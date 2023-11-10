import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieverse/core/common_models/movie_list.dart';
import 'package:movieverse/core/errors/failures.dart';
import 'package:movieverse/core/utils/api_service.dart';
import 'package:movieverse/features/Home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final String trendingEndPoint = "trending/movie/week?language=en-US";
  @override
  Future<Either<Failures, List<MovieList>>> fetchTrendingMovies() async {
    try {
      var request = await ApiService().get(endpoint: trendingEndPoint);
      List<MovieList> trendingMovies = [];

      for (var item in request["results"]) {
        trendingMovies.add(MovieList.fromJson(item));
      }
      return right(trendingMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioException(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  final String topRatedEndPoint =
      "discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200";

  @override
  Future<Either<Failures, List<MovieList>>> fetchTopRatedMovies() async {
    try {
      var request = await ApiService().get(endpoint: topRatedEndPoint);
      List<MovieList> trendingMovies = [];

      for (var item in request["results"]) {
        trendingMovies.add(MovieList.fromJson(item));
      }
      return right(trendingMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioException(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
