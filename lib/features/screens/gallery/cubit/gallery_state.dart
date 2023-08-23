part of 'gallery_cubit.dart';

enum GalleryStatus {
  initial,
  loading,
  success,
  failure,
  unAuthorized,
}

enum GalleryFilterStatus {
  initial,
  loading,
  success,
  failure,
}

enum SortStatus {
  asc,
  desc,
}

enum GalleryFilterType {
  date,
  time,
  canton,
  corrLanguage,
  otherLanguage,
  status,
}

class GalleryState extends Equatable {
  final GalleryStatus status;
  final List<GalleryModel>? allPhotos;
  final bool hasReachedMax;

  const GalleryState({
    this.status = GalleryStatus.initial,
    this.allPhotos,
    this.hasReachedMax = false,
  });

  GalleryState copyWith({
    final GalleryStatus? status,
    final List<GalleryModel>? allPhotos,
    final bool hasReachedMax = false,

  }) {
    return GalleryState(
      status: status ?? this.status,
      allPhotos: allPhotos ?? this.allPhotos,
      hasReachedMax: hasReachedMax,
    );
  }

  @override
  List<Object> get props => [
        status,
        allPhotos ?? [],
        hasReachedMax,
      ];
}
