import 'package:book_storage/domain/models/book_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCreationCubit extends Cubit<BookInfo> {
  BookCreationCubit() : super(BookInfo());

  void setTitle(String value){
    emit(state.copyWith(title: value));
  }
}
