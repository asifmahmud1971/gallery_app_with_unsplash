part of 'sliver_app_bar_cubit.dart';


enum SliverAppBarStatus {
  initial,
  loading,
  success,
  failure,
  unAuthorized,
}

 class SliverAppBarState extends Equatable {
  final SliverAppBarStatus status;
  final List<UserModel>? allUser;
  final bool hasReachedMax;

  const SliverAppBarState({
    this.status=SliverAppBarStatus.initial,
    this.allUser,
    this.hasReachedMax = false,
  });

  SliverAppBarState copyWith({
    final SliverAppBarStatus? status,
    final List<UserModel>? allUser,
    final bool hasReachedMax = false,
}){
    return SliverAppBarState(
      status: status?? this.status,
      allUser: allUser ?? this.allUser,
      hasReachedMax: hasReachedMax
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    allUser??[],
    hasReachedMax,
  ];


}
