import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieverse/core/errors/failures.dart';
import 'package:movieverse/core/utils/api_service.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';
import 'package:movieverse/features/Movie_details/data/repos/movie_detail_repo.dart';

class MovieDetailRepoImpl implements MovieDetailRepo {
  @override
  Future<Either<Failures, MovieDetailModel>> fetchMovieDetail(
      {required int movieId}) async {
    try {
      var response = await ApiService().get(endpoint: "/movie/$movieId");
      return right(MovieDetailModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioException(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
