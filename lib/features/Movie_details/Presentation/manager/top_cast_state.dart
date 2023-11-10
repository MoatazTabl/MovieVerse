part of 'top_cast_cubit.dart';

abstract class TopCastState extends Equatable {
  const TopCastState();
}

class TopCastInitial extends TopCastState {
  @override
  List<Object> get props => [];
}
class TopCastSuccess extends TopCastState {
  final List<TopCastCastModel> topCast;

  const TopCastSuccess(this.topCast);
  @override
  List<Object> get props => [topCast];
}
class TopCastLoading extends TopCastState {
  @override
  List<Object> get props => [];
}
class TopCastFailure extends TopCastState {
  final String errorMessage;

  const TopCastFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
