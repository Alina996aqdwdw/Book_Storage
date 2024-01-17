import 'dart:ffi';

import 'package:book_storage/domain/models/book_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCreationCubit extends Cubit<BookInfo> {
  BookCreationCubit() : super(BookInfo());

  void setTitle(String value){
    emit(state.copyWith(title: value));
  }

  void setAuthor(String value) {
    emit(state.copyWith(author: value));
  }

  void setPublisher(String value) {
    emit(state.copyWith(publisher: value));
  }

  //void setYear(String int) {
  //  emit(state.copyWith(year: int));
  // }
    void main() {
    String setYear = 'Год';
    int Year = int.parse(setYear);
    print(Year);
    }
  }
