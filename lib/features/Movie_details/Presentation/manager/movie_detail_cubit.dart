import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';
import 'package:movieverse/features/Movie_details/data/repos/movie_detail_repo.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(this.movieDetailRepo) : super(MovieDetailInitial());

  final MovieDetailRepo movieDetailRepo;

  Future<void> fetchMovieDetail({required int movieId}) async {
    emit(MovieDetailLoading());

    try {
      var result = await movieDetailRepo.fetchMovieDetail(movieId: movieId);

      result.fold((failure) {
        emit(MovieDetailFailure(failure.errorMessage));
      }, (movieDetail) {
        emit(MovieDetailSuccess(movieDetail));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
