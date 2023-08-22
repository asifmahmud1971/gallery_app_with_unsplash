part of 'dashboard_cubit.dart';

enum DashboardStatus {
  initial,
  loading,
  success,
  failure,
  unAuthorized,
}

class DashboardState extends Equatable {
  final DashboardStatus status;
  final PerformanceModel? performanceList;
  final DateTime? start;
  final DateTime? end;

  const DashboardState({
    this.status = DashboardStatus.initial,
    this.performanceList,
    this.start,
    this.end,
  });

  DashboardState copyWith(
      {final DashboardStatus? status,
      final PerformanceModel? performanceList,
      final DateTime? start,
      final DateTime? end}) {
    return DashboardState(
        status: status ?? this.status,
        performanceList: performanceList ?? this.performanceList,
        start: start ?? this.start,
        end: end ?? this.end);
  }

  @override
  List<Object> get props => [
        status,
        performanceList ?? {},
        start ?? DateTime.now(),
        end ?? DateTime.now()
      ];
}
