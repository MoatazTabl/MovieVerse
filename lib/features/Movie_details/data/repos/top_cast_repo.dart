import 'package:dartz/dartz.dart';
import 'package:movieverse/core/errors/failures.dart';
import 'package:movieverse/features/Movie_details/data/models/top_cast_model.dart';

abstract class TopCastRepo {
  Future<Either<Failures, List<TopCastCastModel>>> fetchTopCast(
      {required int movieId});
}
