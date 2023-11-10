import 'package:hive/hive.dart';

part 'hive_fav_movies.g.dart';

@HiveType(typeId: 0)
class FavMovies extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? posterPath;
  @HiveField(2)
  String? releaseDate;
  @HiveField(3)
  String? title;
  @HiveField(4)
  double? voteAverage;


  @override
  toString() {
    return "id:$id, $releaseDate, $title";
  }

  FavMovies(
      {required this.id, required this.posterPath, required this.releaseDate, required this.title, required this.voteAverage});
}