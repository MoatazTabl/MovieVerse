import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movieverse/core/common_models/movie_list.dart';
import 'package:movieverse/features/Home/data/repos/home_repo_impl.dart';
part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit(this.homeRepo) : super(TrendingMoviesInitial());

  final HomeRepoImpl homeRepo;

  Future<void> fetchTrendingMovies() async {
    emit(TrendingMoviesLoading());

    try {
      var trendingMovies = await homeRepo.fetchTrendingMovies();

      trendingMovies.fold((failure) {
        emit(TrendingMoviesFailure(failure.errorMessage));
      }, (movies) {
        emit(TrendingMoviesSuccess(movies));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
