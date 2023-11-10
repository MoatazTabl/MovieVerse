part of 'top_rated_cubit.dart';

@immutable
abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}
class TopRatedSuccess extends TopRatedState {
  final List<MovieList> movieList;

  TopRatedSuccess(this.movieList);
}
class TopRatedLoading extends TopRatedState {}
class TopRatedFailure extends TopRatedState {
  final String errorMessage;

  TopRatedFailure(this.errorMessage);
}
