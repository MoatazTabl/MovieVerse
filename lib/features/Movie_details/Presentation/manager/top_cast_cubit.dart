import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movieverse/features/Movie_details/data/models/top_cast_model.dart';
import 'package:movieverse/features/Movie_details/data/repos/top_cast_repo.dart';

part 'top_cast_state.dart';

class TopCastCubit extends Cubit<TopCastState> {
  TopCastCubit(this.topCastRepo) : super(TopCastInitial());

  final TopCastRepo topCastRepo;

  Future<void> fetchTopCast({required int movieId}) async {
    emit(TopCastLoading());

    try {
      var result = await topCastRepo.fetchTopCast(movieId: movieId);

      result.fold((failure) {
        emit(TopCastFailure(failure.errorMessage));
      }, (topCast) {
        emit(TopCastSuccess(topCast));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
