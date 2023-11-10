import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movieverse/core/common_models/movie_list.dart';
import 'package:movieverse/features/Search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchWantedSearch({required String query}) async {
    emit(SearchLoading());

    try {
      var result = await searchRepo.fetchSearch(query: query);

      result.fold((failure) {
        emit(SearchFailure(failure.errorMessage));
      }, (result) {
        emit(SearchSuccess(result));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
