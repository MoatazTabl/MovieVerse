import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieverse/core/errors/failures.dart';
import 'package:movieverse/core/utils/api_service.dart';
import 'package:movieverse/features/Movie_details/data/models/top_cast_model.dart';
import 'package:movieverse/features/Movie_details/data/repos/top_cast_repo.dart';

class TopCastRepoImpl implements TopCastRepo {
  @override
  Future<Either<Failures, List<TopCastCastModel>>> fetchTopCast(
      {required int movieId}) async {
    try {
      var response = await ApiService().get(endpoint: "movie/$movieId/credits");
      List<TopCastCastModel> topCast = [];
      for (var item in response["cast"]) {
        topCast.add(TopCastCastModel.fromJson(item));
      }
      return right(topCast);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioException(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
