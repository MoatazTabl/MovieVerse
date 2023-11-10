import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';
import 'package:movieverse/features/Movie_details/data/repos/similar_movie_repo.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit(this.similarMoviesRepo) : super(SimilarMoviesInitial());

  final SimilarMoviesRepo similarMoviesRepo;

  Future<void> fetchSimilarMovies({required int movieId}) async {
    emit(SimilarMoviesLoading());

    try {
      var result = await similarMoviesRepo.fetchSimilarMovies(movieId: movieId);

      result.fold((failure) {
        emit(SimilarMoviesFailure(failure.errorMessage));
      }, (movieDetail) {
        emit(SimilarMoviesSuccess(movieDetail));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
