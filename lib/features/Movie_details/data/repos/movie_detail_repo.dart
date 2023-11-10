import 'package:dartz/dartz.dart';
import 'package:movieverse/core/errors/failures.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';

abstract class MovieDetailRepo {
  Future<Either<Failures, MovieDetailModel>> fetchMovieDetail(
      {required int movieId});
}
