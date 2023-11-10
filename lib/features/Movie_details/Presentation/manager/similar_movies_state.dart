part of 'similar_movies_cubit.dart';

@immutable
abstract class SimilarMoviesState {}

class SimilarMoviesInitial extends SimilarMoviesState {}
class SimilarMoviesSuccess extends SimilarMoviesState {
  final List<MovieDetailModel> movieDetailModel;
  SimilarMoviesSuccess(this.movieDetailModel);
}
class SimilarMoviesFailure extends SimilarMoviesState {
  final String errorMessage;
  SimilarMoviesFailure(this.errorMessage);
}
class SimilarMoviesLoading extends SimilarMoviesState {

}
