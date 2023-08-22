import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_progress_loader.dart';
import 'package:terminator/features/components/custom_snackbar.dart';
import 'package:terminator/features/components/custom_time_formatter.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/screens/termine_details/model/appointment_model.dart';
import 'package:terminator/features/screens/termine_details/model/history_model.dart';
import 'package:terminator/features/screens/termine_details/model/termin_details_model.dart';
import 'package:terminator/features/screens/termine_details/repository/termin_details_repo_imp.dart';

part 'termin_details_state.dart';

@injectable
class TerminDetailsCubit extends Cubit<TerminDetailsState> {
  final TerminDetailsImp terminDetailsImp;

  List<ResultModel> resultList = [
    ResultModel(value: "Positive", label: "Positive"),
    ResultModel(value: "Negative", label: "Negative"),
    ResultModel(
        value: "Follow up contact necessary",
        label: "Follow up contact necessary"),
  ];

  List fileList = [];
  GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();
  Appointment? selectedNegativeExplanation = Appointment();
  Appointment? selectedPositiveExplanation = Appointment();
  ExpandedTileController? expandedTileController =
      ExpandedTileController(isExpanded: false);

  int? selectedAppointment;
  DateTime? selectedYear;
  DateTime? followUpDateTime;

  ResultModel? selectedResult;

  TextEditingController? intermediaryRemarksController =
      TextEditingController();
  TextEditingController? othersController = TextEditingController();
  TextEditingController? contractedSign = TextEditingController();

  Appointment selectedExplanationValue = Appointment();

  TerminDetailsCubit(this.terminDetailsImp) : super(TerminDetailsState());

  Future<void> getTerminDetails(id) async {
    showProgressDialog();
    var response = await terminDetailsImp.getTerminDetailsData({}, id);
    response.fold(
      (failure) {
        emit(state.copyWith(status: TerminDetailsStatus.failure));
      },
      (data) {
        emit(
          state.copyWith(
            status: TerminDetailsStatus.success,
            terminDetailsModel: data,
          ),
        );
      },
    );
    dismissProgressDialog();
  }

  void addFile(image) {
    fileList.add(image);
    log("sexy file : $fileList");
  }

  void selectYear(year) {
    selectedYear = year ?? null;
    emit(
      state.copyWith(selectedYear: selectedYear),
    );
  }

  Future<void> getTerminHistory(id) async {
    showProgressDialog();
    var response = await terminDetailsImp.getTerminHistory({}, id);
    response.fold(
      (failure) {
        emit(state.copyWith(status: TerminDetailsStatus.thFailure));
      },
      (data) {
        emit(
          state.copyWith(
            status: TerminDetailsStatus.thSuccess,
            allHistoryData: data,
          ),
        );
      },
    );
    dismissProgressDialog();
  }

  Future<void> editDetails(id) async {
    showProgressDialog();

    if (selectedAppointment != null) {
      List multipartImage = [];

      for (var element in fileList) {
        var multipart = await MultipartFile.fromFile(element,
            filename: path.basename(element));
        multipartImage.add(multipart);
      }

      log("multipart image : $multipartImage");

      var response = await terminDetailsImp.editDetails({
        "appointment_took_place": selectedAppointment == 0 ? 1 : 0,
        "outcome": selectedResult?.value ?? "",
        "reason": selectedExplanationValue.value ?? "",
        "contracts_concluded": contractedSign?.text ?? "",
        "other": othersController?.text ?? "",
        "expiry_year": selectedYear != null
            ? CustomTimeFormatter.localDayFormat(
                DateTime.parse(selectedYear.toString()))
            : "",
        "follow_up_contact_date": followUpDateTime != null
            ? CustomTimeFormatter.localDayFormat(followUpDateTime)
            : null,
        "follow_up_contact_time": followUpDateTime != null
            ? CustomTimeFormatter.localToUTCTimeFormat(followUpDateTime)
            : null,
        "intermediary_remarks": intermediaryRemarksController?.text ?? "",
        "images[]": multipartImage
      }, id);
      response.fold(
        (failure) {
          if (failure.code == 422) {
            showTopSnackbar(
                context: GetContext.context,
                message: AppStrings.requiredField.tr());
          }
          emit(state.copyWith(status: TerminDetailsStatus.editFailure));
        },
        (data) {
          emit(
            state.copyWith(
              status: TerminDetailsStatus.editSuccess,
            ),
          );
          clear();
        },
      );
      dismissProgressDialog();
    } else {
      showTopSnackbar(
          context: GetContext.context, message: AppStrings.requiredField.tr());
      dismissProgressDialog();
    }
  }

  void selectedExplanation(Appointment value, check) {
    if (check == 'yes') {
      selectedPositiveExplanation =
          Appointment(value: value.value, label: value.label);
      selectedExplanationValue =
          Appointment(value: value.value, label: value.label);
    } else {
      selectedNegativeExplanation =
          Appointment(value: value.value, label: value.label);
      selectedExplanationValue =
          Appointment(value: value.value, label: value.label);
    }

    emit(
      state.copyWith(
          status: TerminDetailsStatus.initial, selectedExplanation: value),
    );
  }

  void dropdownReset() {
    key.currentState?.reset();
  }

  void selectResult(value) {
    selectedResult = ResultModel(value: value.value, label: value.label);
    emit(
      state.copyWith(
          status: TerminDetailsStatus.initial, selectedResult: value),
    );
    //log(selectedAppointment.toString());
  }

  void selectAppointment({index}) {
    selectedAppointment = index;
    emit(
      state.copyWith(
          status: TerminDetailsStatus.initial,
          selectedAppointment: selectedAppointment),
    );
    log(selectedAppointment.toString());
  }

  void followUpDateTimeSelect({DateTime? dateTime}) {
    followUpDateTime = dateTime;
    emit(
      state.copyWith(dateTime: followUpDateTime),
    );
  }

  void clear() {
    selectedNegativeExplanation = Appointment(label: null, value: null);
    selectedPositiveExplanation = Appointment(label: null, value: null);
    selectedExplanationValue = Appointment(label: null, value: null);
    selectedResult = ResultModel(label: null, value: null);
    selectedAppointment = null;
    followUpDateTime = null;
    selectedYear = null;
    intermediaryRemarksController?.clear();
    othersController?.clear();
    contractedSign?.clear();
    fileList = [];
    emit(
      state.copyWith(
          status: TerminDetailsStatus.initial,
          selectedResult: ResultModel(),
          selectedAppointment: null,
          dateTime: followUpDateTime,
          selectedExplanation: Appointment()),
    );
  }
}
