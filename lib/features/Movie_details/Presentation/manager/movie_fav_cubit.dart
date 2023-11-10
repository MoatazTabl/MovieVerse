import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movieverse/features/Movie_details/data/repos/movie_fav_repo.dart';

part 'movie_fav_state.dart';

class MovieFavCubit extends Cubit<MovieFavState> {
  MovieFavCubit(this.movieFavRepo) : super(MovieFavInitial());

  final MovieFavRepo movieFavRepo;

  void addToDb(
      {required int movieId,
      required String posterPath,
      required String releaseDate,
      required String title,
      required double voteAverage}) {
    try {
      movieFavRepo.addToHive(
        movieId: movieId,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        voteAverage: voteAverage,
      );
      emit(MovieFavAddedToDb());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void checkIfDuplicate({required int movieId}) {
    try {
      bool check = movieFavRepo.checkIfDuplicateInHive(movieId: movieId);
      if (check == true) {
        emit(MovieFavExistsInDb());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> removeFromDb({required int movieId}) async {
    try {
      await movieFavRepo.removeFromHive(movieId: movieId);
      emit(MovieFavRemoveFromDb());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
