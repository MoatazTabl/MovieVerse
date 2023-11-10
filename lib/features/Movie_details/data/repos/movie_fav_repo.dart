import 'package:movieverse/core/utils/hive/hive_fav_movies.dart';

abstract class MovieFavRepo {
  void addToHive(
      {required int movieId,
      required String posterPath,
      required String releaseDate,
      required String title,
      required double voteAverage});
  Future<void> removeFromHive({required int movieId});
  bool checkIfDuplicateInHive({required int movieId});
  List<FavMovies> retrieveFromHive();
}
