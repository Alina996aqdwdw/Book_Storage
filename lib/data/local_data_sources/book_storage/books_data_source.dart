import 'dart:async';

import 'package:book_storage/domain/models/book_info.dart';
import 'package:sqflite/sqflite.dart';

import 'src/books_storage_hash_keys.dart';
import 'src/models/book_model.dart';


part 'src/book_data_source_impl.dart';

abstract class BooksDataSource {
  factory BooksDataSource() => _BooksDataSourceImpl();

  Future<void> init();

  Future<void> dispose();

  Future<BookInfo> create(BookInfo book);

  Future<List<BookInfo>> getAll();
}