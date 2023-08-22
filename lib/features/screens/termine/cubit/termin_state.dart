part of 'termin_cubit.dart';

enum TerminStatus {
  initial,
  loading,
  success,
  failure,
  unAuthorized,
}

enum TerminFilterStatus {
  initial,
  loading,
  success,
  failure,
}

enum SortStatus {
  asc,
  desc,
}

enum TerminFilterType {
  date,
  time,
  canton,
  corrLanguage,
  otherLanguage,
  status,
}

class TerminState extends Equatable {
  final TerminStatus status;
  final List<GalleryModel>? allPhotos;
  final bool hasReachedMax;

  final TerminFilterStatus filterStatus;
  final FilterModel? filterList;
  final DateTimeRange? selectedDateRange;
  final TimeRange? selectedTimeRange;
  final List<Filter>? selectedCanton;
  final List<Filter>? selectedCorLanguage;
  final List<Filter>? selectedOtherLanguage;
  final List<Filter>? selectedCorStatus;

  const TerminState({
    this.status = TerminStatus.initial,
    this.allPhotos,
    this.hasReachedMax = false,
    this.filterStatus = TerminFilterStatus.initial,
    this.selectedDateRange,
    this.selectedTimeRange,
    this.filterList,
    this.selectedCanton,
    this.selectedCorLanguage,
    this.selectedOtherLanguage,
    this.selectedCorStatus,
  });

  TerminState copyWith({
    final TerminStatus? status,
    final List<GalleryModel>? allPhotos,
    final bool hasReachedMax = false,
    final TerminFilterStatus? filterStatus,
    final FilterModel? filterList,
    final DateTimeRange? selectedDateTime,
    final TimeRange? selectedTimeRange,
    final List<Filter>? selectedCanton,
    final List<Filter>? selectedCorLanguage,
    final List<Filter>? selectedOtherLanguage,
    final List<Filter>? selectedCorStatus,
  }) {
    return TerminState(
      status: status ?? this.status,
      allPhotos: allPhotos ?? this.allPhotos,
      hasReachedMax: hasReachedMax,
      filterStatus: filterStatus ?? this.filterStatus,
      filterList: filterList ?? this.filterList,
      selectedDateRange: selectedDateTime ?? this.selectedDateRange,
      selectedTimeRange: selectedTimeRange ?? this.selectedTimeRange,
      selectedCanton: selectedCanton ?? this.selectedCanton,
      selectedCorLanguage: selectedCorLanguage ?? this.selectedCorLanguage,
      selectedOtherLanguage:
          selectedOtherLanguage ?? this.selectedOtherLanguage,
      selectedCorStatus: selectedCorStatus ?? this.selectedCorStatus,
    );
  }

  @override
  List<Object> get props => [
        status,
        allPhotos ?? [],
        hasReachedMax,
        filterStatus,
        filterList ?? {},
        selectedDateRange ?? {},
        selectedTimeRange ?? {},
        selectedCanton ?? [],
        selectedCorLanguage ?? [],
        selectedOtherLanguage ?? [],
        selectedCorStatus ?? [],
      ];
}
