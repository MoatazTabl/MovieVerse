import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieverse/core/utils/hive/hive_fav_movies.dart';
import 'package:movieverse/features/Movie_details/data/repos/movie_fav_repo.dart';

class MovieFavRepoImpl implements MovieFavRepo {
  @override
  void addToHive(
      {required int movieId,
      required String posterPath,
      required String releaseDate,
      required String title,
      required double voteAverage}) {
    var movieDetail = Hive.box<FavMovies>("MovieFav");
    final existingData = retrieveFromHive();
    for (var item in existingData) {
      if (movieId == item.id) {
        if (kDebugMode) {
          print("it exists");
        }
        return;
      }
    }
    movieDetail.add(
      FavMovies(
        id: movieId,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        voteAverage: voteAverage,
      ),
    );
  }

  @override
  List<FavMovies> retrieveFromHive() {
    List<FavMovies> favMoviesList = [];
    var moviesDetails = Hive.box<FavMovies>("MovieFav");
    favMoviesList = moviesDetails.values.toList();
    return favMoviesList;
  }

  @override
  Future<void> removeFromHive({required int movieId}) async {
    var movieDetail = Hive.box<FavMovies>("MovieFav");
    List<FavMovies> movList = movieDetail.values.toList();

    int i;
    for (i = 0; i < movList.length; i++) {
      if (movList[i].id == movieId) {
        break;
      }
    }
    await movieDetail.deleteAt(i);
  }

  @override
  bool checkIfDuplicateInHive({required int movieId}) {
    final exist = retrieveFromHive();

    for (var item in exist) {
      if (item.id == movieId) {
        return true;
      }
    }
    return false;
  }
}
