import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:terminator/core/app/app_preference.dart';
import 'package:terminator/data/network/api_exception.dart';
import 'package:terminator/features/components/custom_progress_loader.dart';
import 'package:terminator/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:terminator/features/screens/termine/model/filter_model.dart';
import 'package:terminator/features/screens/termine/model/gallery_model.dart';
import 'package:terminator/features/screens/termine/repository/termin_repo_imp.dart';
import 'package:time_range_picker/time_range_picker.dart';

part 'termin_state.dart';

@injectable
class TerminCubit extends Cubit<TerminState> {
  final TerminRepositoryImp _terminRepositoryImp;
  final AppPreferences _appPreferences;

  TerminCubit(this._terminRepositoryImp, this._appPreferences)
      : super(TerminState());
  RefreshController homeTodayController =
      RefreshController(initialRefresh: false);
  RefreshController homeController = RefreshController(initialRefresh: false);
  TextEditingController searchController = TextEditingController();
  int page = 1;
  DateTimeRange? dateRangeGlobal;
  TimeRange? timeRangeGlobal;
  SortStatus sort = SortStatus.desc;
  List<GalleryModel>? allPhotos = [];

  Future<void> getTerminData({bool isToday = false}) async {
    if (page == 1 ||
        homeTodayController.isRefresh ||
        homeController.isRefresh) {
      showProgressDialog();
      page = 1;
      emit(state.copyWith(
          status: TerminStatus.loading, hasReachedMax: false, allPhotos: []));
    }
    if (state.hasReachedMax) return;

    var response = await _terminRepositoryImp.getTerminData({
      "client_id": dotenv.env['ACCESS_KEY'],
      "page": page,
      "per_page": 10,
    });

    response.fold(
      (failure) {
        if (failure.code == ResponseCode.unauthorised) {
          emit(state.copyWith(status: TerminStatus.unAuthorized));
          _appPreferences.logout();
        } else {
          emit(state.copyWith(status: TerminStatus.failure));
          if (isToday) {
            homeTodayController.refreshCompleted();
            homeTodayController.loadComplete();
          } else {
            homeController.refreshCompleted();
            homeController.loadComplete();
          }
        }
      },
      (data) {
        if (data.isNotEmpty) {
          page++;

          emit(
            state.copyWith(
              status: TerminStatus.success,
              allPhotos: [...?state.allPhotos, ...data],
            ),
          );
        } else {
          emit(state.copyWith(
              status: TerminStatus.success, hasReachedMax: true));
        }
        if (isToday) {
          homeTodayController.refreshCompleted();
          homeTodayController.loadComplete();
        } else {
          homeController.refreshCompleted();
          homeController.loadComplete();
        }
      },
    );
    dismissProgressDialog();
  }

  Future<void> getFilterData() async {
    showProgressDialog();
    emit(
      state.copyWith(
          filterStatus: TerminFilterStatus.loading, filterList: FilterModel()),
    );

    var response = await _terminRepositoryImp.getFilterData();
    response.fold(
      (failure) {
        emit(state.copyWith(filterStatus: TerminFilterStatus.failure));
      },
      (data) {
        emit(
          state.copyWith(
            filterStatus: TerminFilterStatus.success,
            filterList: data,
          ),
        );
      },
    );
    dismissProgressDialog();
  }

  void sortToggle() {
    sort == SortStatus.asc ? sort = SortStatus.desc : sort = SortStatus.asc;

    page = 1;
    getTerminData();
  }

  void changeDateRange({DateTimeRange? range}) {
    dateRangeGlobal = range;
    setFilter(TerminFilterType.date,
        dateTimeRange: range ??
            range ??
            DateTimeRange(start: DateTime.now(), end: DateTime.now()));
  }

  void changeTimeRange({TimeRange? time}) async {
    timeRangeGlobal = time;
    setFilter(TerminFilterType.time,
        timeRange: time ??
            TimeRange(
              startTime: TimeOfDay.now(),
              endTime: TimeOfDay.now(),
            ));
  }

  void resetFilter({bool isReset = false}) {
    FocusManager.instance.primaryFocus?.unfocus();
    page = 1;
    changeDateRange();
    changeTimeRange();
    emit(state.copyWith(
      selectedCanton: [],
      selectedCorLanguage: [],
      selectedOtherLanguage: [],
      selectedCorStatus: [],
    ));
    if (!isReset) {
      getTerminData();
    }
  }

  void setFilter(
    TerminFilterType filterType, {
    Filter? value,
    DateTimeRange? dateTimeRange,
    TimeRange? timeRange,
  }) {
    switch (filterType) {
      case TerminFilterType.date:
        emit(state.copyWith(selectedDateTime: dateTimeRange));
        break;

      case TerminFilterType.time:
        emit(state.copyWith(selectedTimeRange: timeRange));
        break;

      case TerminFilterType.canton:
        cantonToggle(value!, filterType);
        break;

      case TerminFilterType.corrLanguage:
        corLanguageToggle(value!, filterType);
        break;

      case TerminFilterType.otherLanguage:
        corOtherToggle(value!, filterType);
        break;

      case TerminFilterType.status:
        corStatusToggle(value!, filterType);
        break;
    }
  }

  bool isAlreadyExist(Filter value, TerminFilterType filterType) {
    switch (filterType) {
      case TerminFilterType.date:
        return false;

      case TerminFilterType.time:
        return false;

      case TerminFilterType.canton:
        return (state.selectedCanton ?? [])
            .where((element) => element.value == value.value)
            .isNotEmpty;

      case TerminFilterType.corrLanguage:
        return (state.selectedCorLanguage ?? [])
            .where((element) => element.value == value.value)
            .isNotEmpty;

      case TerminFilterType.otherLanguage:
        return (state.selectedOtherLanguage ?? [])
            .where((element) => element.value == value.value)
            .isNotEmpty;

      case TerminFilterType.status:
        return (state.selectedCorStatus ?? [])
            .where((element) => element.value == value.value)
            .isNotEmpty;
    }
  }

  void cantonToggle(Filter value, TerminFilterType filterType) {
    bool isExist = isAlreadyExist(value, filterType);
    if (isExist) {
      state.selectedCanton
          ?.removeWhere((element) => element.value == value.value);
      emit(state.copyWith(selectedCanton: state.selectedCanton));
      log(state.selectedCanton.toString());
    } else {
      emit(state
          .copyWith(selectedCanton: [...state.selectedCanton ?? [], value]));
    }
  }

  void corLanguageToggle(Filter value, TerminFilterType filterType) {
    bool isExist = isAlreadyExist(value, filterType);

    if (isExist) {
      state.selectedCorLanguage
          ?.removeWhere((element) => element.value == value.value);
      emit(state.copyWith(selectedCorLanguage: state.selectedCorLanguage));
      log(state.selectedCorLanguage.toString());
    } else {
      emit(state.copyWith(
          selectedCorLanguage: [...state.selectedCorLanguage ?? [], value]));
    }
  }

  void corOtherToggle(Filter value, TerminFilterType filterType) {
    bool isExist = isAlreadyExist(value, filterType);
    if (isExist) {
      state.selectedOtherLanguage
          ?.removeWhere((element) => element.value == value.value);
      emit(state.copyWith(selectedOtherLanguage: state.selectedOtherLanguage));
      log(state.selectedOtherLanguage.toString());
    } else {
      emit(state.copyWith(selectedOtherLanguage: [
        ...state.selectedOtherLanguage ?? [],
        value
      ]));
    }
  }

  void corStatusToggle(Filter value, TerminFilterType filterType) {
    bool isExist = isAlreadyExist(value, filterType);
    if (isExist) {
      state.selectedCorStatus
          ?.removeWhere((element) => element.value == value.value);
      emit(state.copyWith(selectedCorStatus: state.selectedCorStatus));
      log(state.selectedCorStatus.toString());
    } else {
      emit(state.copyWith(
          selectedCorStatus: [...state.selectedCorStatus ?? [], value]));
    }
  }

/*  Map<String, String> selectedFilter(List<Filter>? data) {
    Map<String, String> selectedFilter = {};
    if (data != null || data!.isNotEmpty) {
      if (data.length > 2) {
        selectedFilter['title'] =
            data.map((item) => item.label).toList().take(2).join(',');
        selectedFilter['count'] =
            '${data.map((item) => item.value).toList().length - 2}';
      } else {
        selectedFilter['title'] =
            data.map((item) => item.label).toList().take(2).join(',');
        selectedFilter['count'] = '0';
      }
    }
    log("======>>>>>" + selectedFilter.toString());
    return selectedFilter;
  }*/
}
