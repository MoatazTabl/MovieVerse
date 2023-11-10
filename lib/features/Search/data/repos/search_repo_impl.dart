import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieverse/core/common_models/movie_list.dart';
import 'package:movieverse/core/errors/failures.dart';
import 'package:movieverse/core/utils/api_service.dart';
import 'package:movieverse/features/Search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failures, List<MovieList>>> fetchSearch(
      {required String query}) async {
    try {
      var request = await ApiService().get(
          endpoint:
              "search/movie?query=$query&include_adult=false&language=en-US&page=1");
      List<MovieList> searchMovies = [];

      for (var item in request["results"]) {
        searchMovies.add(MovieList.fromJson(item));
      }
      return right(searchMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioException(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
