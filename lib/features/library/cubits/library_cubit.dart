import 'package:book_storage/data/local_data_sources/book_storage/books_data_source.dart';
import 'package:book_storage/domain/models/book_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class LibraryState {}

class LibraryLoadingState extends LibraryState {}

class LibraryLoadedState extends LibraryState {
  final List<BookInfo> books;

  LibraryLoadedState(this.books);
}

class LibraryErrorState extends LibraryState {
  final String message;

  LibraryErrorState(this.message);
}

class LibraryCubit extends Cubit<LibraryState> {
  final BooksDataSource booksDataSource;

  LibraryCubit(this.booksDataSource) : super(LibraryLoadingState());

  Future<void> init() async {
    try {
      emit(LibraryLoadingState());

      final books = await booksDataSource.getAll();

      emit(LibraryLoadedState(books));
    } catch (e) {
      emit(LibraryErrorState(e.toString()));
    }
  }

  Future<void> addBook(BookInfo book) async {
    try {
      emit(LibraryLoadingState());

      booksDataSource.create(book);
      final books = await booksDataSource.getAll();

      emit(LibraryLoadedState(books));
    } catch (e) {
      emit(LibraryErrorState(e.toString()));
    }
  }
}
