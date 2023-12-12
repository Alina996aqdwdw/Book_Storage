import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app.dart';
import 'data/local_data_sources/book_storage/books_data_source.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final BooksDataSource booksDataSource = BooksDataSource();
      await booksDataSource.init();

      runApp(
        Provider.value(
          value: booksDataSource,
          child: const App(),
        ),
      );
    },
    (error, stackTrace) {
      log(
        '[Main isolate]',
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}
