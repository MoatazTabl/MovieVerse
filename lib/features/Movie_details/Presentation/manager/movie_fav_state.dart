part of 'movie_fav_cubit.dart';

@immutable
abstract class MovieFavState {}

class MovieFavInitial extends MovieFavState {}
class MovieFavAddedToDb extends MovieFavState {}
class MovieFavExistsInDb extends MovieFavState {}
class MovieFavRemoveFromDb extends MovieFavState {}
class MovieFavFailure extends MovieFavState {}
