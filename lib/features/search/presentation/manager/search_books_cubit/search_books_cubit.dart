import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String searchValue}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks(searchValue: searchValue);
    result.fold(
      (failure) {
        return emit(SearchFailure(failure.errmessage));
      },
      (books) {
        return emit(SearchSuccess(books));
      },
    );
  }
}
