import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:terminator/core/app/app_preference.dart';
import 'package:terminator/data/network/api_exception.dart';
import 'package:terminator/features/components/custom_progress_loader.dart';
import 'package:terminator/features/components/custom_time_formatter.dart';
import 'package:terminator/features/screens/dashboard/model/performance_model.dart';
import 'package:terminator/features/screens/dashboard/repository/dashboard_repo_imp.dart';
import 'package:terminator/features/screens/dashboard/widget/filter_widget.dart';

part 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepositoryImp _dashboardRepository;
  final AppPreferences _appPreferences;

  DashboardCubit(this._dashboardRepository, this._appPreferences)
      : super(DashboardState());
  DateTimeRange? dateTimeRange;
  String? selectedFilter;
  DateTime pickerStart = DateTime.now();
  DateTime pickerEnd = DateTime.now();

  Future<void> getDashboardData() async {
    showProgressDialog();
    emit(
      state.copyWith(
        status: DashboardStatus.loading,
        performanceList:
            PerformanceModel(pieChart: [], totalContactDataRecord: 0),
      ),
    );
    Map<String, dynamic> params = {};
    if (dateTimeRange != null) {
      params['start_date'] =
          CustomTimeFormatter.dateFormat(dateTimeRange!.start);
      params['end_date'] = CustomTimeFormatter.dateFormat(dateTimeRange!.end);
    }

    var response = await _dashboardRepository.getDashboardData(params);
    response.fold(
      (failure) {
        if (failure.code == ResponseCode.unauthorised) {
          emit(state.copyWith(status: DashboardStatus.unAuthorized));
          _appPreferences.logout();
        } else {
          emit(state.copyWith(status: DashboardStatus.failure));
        }
      },
      (data) {
        emit(
          state.copyWith(
            status: DashboardStatus.success,
            performanceList: data,
          ),
        );
      },
    );
    dismissProgressDialog();
  }

  void pickerStartEnd({start, end}) {
    pickerStart = start ?? DateTime.now();
    pickerEnd = end ?? DateTime.now();

    emit(
      state.copyWith(
          status: DashboardStatus.initial,
          start: start ?? DateTime.now(),
          end: end ?? DateTime.now()),
    );
  }

  void toggleFilter({DateTimeRange? range, FilterOptionType? filter}) {
    if (filter != null) {
      selectedFilter = filter.toString().split('.').last;
    } else {
      selectedFilter = null;
      pickerStartEnd();
    }

    dateTimeRange = range;
    getDashboardData();
  }
}
