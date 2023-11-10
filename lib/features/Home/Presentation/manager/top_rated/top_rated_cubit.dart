import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movieverse/core/common_models/movie_list.dart';
import 'package:movieverse/features/Home/data/repos/home_repo_impl.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.homeRepo) : super(TopRatedInitial());

  final HomeRepoImpl homeRepo;

  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedLoading());

    try {
      var trendingMovies = await homeRepo.fetchTopRatedMovies();

      trendingMovies.fold((failure) {
        emit(TopRatedFailure(failure.errorMessage));
      }, (movies) {
        emit(TopRatedSuccess(movies));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
