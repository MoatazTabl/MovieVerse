part of 'trending_movies_cubit.dart';

@immutable
abstract class TrendingMoviesState {}

class TrendingMoviesInitial extends TrendingMoviesState {}
class TrendingMoviesSuccess extends TrendingMoviesState {
   final List<MovieList> trendingMovies;

  TrendingMoviesSuccess(this.trendingMovies);
}
class TrendingMoviesLoading extends TrendingMoviesState {}
class TrendingMoviesFailure extends TrendingMoviesState {

  final String errorMessage;
  TrendingMoviesFailure(this.errorMessage);
}
