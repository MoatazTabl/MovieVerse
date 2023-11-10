part of 'movie_detail_cubit.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}
class MovieDetailLoading extends MovieDetailState {}
class MovieDetailSuccess extends MovieDetailState {
  final MovieDetailModel movieDetail;

  MovieDetailSuccess(this.movieDetail);
}
class MovieDetailFailure extends MovieDetailState {
  final String errorMessage;

  MovieDetailFailure(this.errorMessage);
}
