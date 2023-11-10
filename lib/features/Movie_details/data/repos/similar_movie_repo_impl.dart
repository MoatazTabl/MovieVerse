import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieverse/core/errors/failures.dart';
import 'package:movieverse/core/utils/api_service.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';
import 'package:movieverse/features/Movie_details/data/repos/similar_movie_repo.dart';

class SimilarMoviesRepoImpl implements SimilarMoviesRepo {
  @override
  Future<Either<Failures, List<MovieDetailModel>>> fetchSimilarMovies(
      {required int movieId}) async {
    try {
      var response = await ApiService().get(endpoint: "movie/$movieId/similar");
      List<MovieDetailModel> movieDetail = [];
      for (var item in response["results"]) {
        movieDetail.add(MovieDetailModel.fromJson(item));
      }
      return right(movieDetail);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioException(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
