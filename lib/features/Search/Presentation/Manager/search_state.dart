part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchSuccess extends SearchState {
  final List<MovieList> searchResult;

  SearchSuccess(this.searchResult);
}
class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}
class SearchLoading extends SearchState {}
