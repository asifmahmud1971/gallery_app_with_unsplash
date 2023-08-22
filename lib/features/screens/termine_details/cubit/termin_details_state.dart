part of 'termin_details_cubit.dart';

enum TerminDetailsStatus {
  initial,
  loading,
  success,
  thSuccess,
  thFailure,
  editSuccess,
  editFailure,
  failure,
}

class TerminDetailsState extends Equatable {
  final TerminDetailsStatus status;
  final TerminDetailsModel? terminDetailsModel;
  final int? selectedAppointment;
  final ResultModel? selectedResult;
  final DateTime? dateTime;
  final DateTime? selectedYear;
  final Appointment? selectedExplanation;
  final List<HistoryModel>? allHistoryData;

  const TerminDetailsState({
    this.status = TerminDetailsStatus.initial,
    this.terminDetailsModel,
    this.selectedAppointment,
    this.dateTime,
    this.allHistoryData,
    this.selectedResult,
    this.selectedExplanation,
    this.selectedYear,
  });

  TerminDetailsState copyWith(
      {final TerminDetailsStatus? status,
      final TerminDetailsModel? terminDetailsModel,
      final int? selectedAppointment,
      final List<HistoryModel>? allHistoryData,
      final ResultModel? selectedResult,
      final DateTime? dateTime,
      final Appointment? selectedExplanation,
      final DateTime? selectedYear}) {
    return TerminDetailsState(
      status: status ?? this.status,
      terminDetailsModel: terminDetailsModel ?? this.terminDetailsModel,
      selectedAppointment: selectedAppointment ?? this.selectedAppointment,
      allHistoryData: allHistoryData ?? this.allHistoryData,
      selectedResult: selectedResult ?? this.selectedResult,
      selectedExplanation: selectedExplanation ?? this.selectedExplanation,
      selectedYear: selectedYear ?? this.selectedYear,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object> get props => [
        status,
        terminDetailsModel ?? {},
        allHistoryData ?? [],
        selectedResult ?? ResultModel(),
        selectedExplanation ?? Appointment(),
        selectedYear ?? "",
        dateTime ?? "",
      ];
}
