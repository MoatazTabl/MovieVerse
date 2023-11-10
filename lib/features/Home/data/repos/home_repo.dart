import 'package:dartz/dartz.dart';
import 'package:movieverse/core/common_models/movie_list.dart';
import 'package:movieverse/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<MovieList>>> fetchTrendingMovies();
  Future<Either<Failures, List<MovieList>>> fetchTopRatedMovies();
}
