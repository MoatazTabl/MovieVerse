import 'package:dartz/dartz.dart';
import 'package:movieverse/core/errors/failures.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';

abstract class SimilarMoviesRepo {
  Future<Either<Failures, List<MovieDetailModel>>> fetchSimilarMovies(
      {required int movieId});
}
