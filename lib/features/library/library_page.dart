import 'package:book_storage/domain/models/book_info.dart';
import 'package:book_storage/features/library/cubits/book_creation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/short_book_info.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  void onTapActiveFilledButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('a'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return BookShortInfoWidget(
            bookInfo: BookInfo(
              title: 'Песнь льда и пламени',
              author: 'Джордж Мартин',
              year: 1996,
              publisher: 'АСТ',
              pageCount: 650,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final bookCreationCubit = BookCreationCubit();

              return Dialog(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Название'
                      ),
                      onChanged: bookCreationCubit.setTitle,
                    ),
                    BlocBuilder<BookCreationCubit, BookInfo>(
                      bloc: bookCreationCubit,
                      builder: (context, book) {
                        return FilledButton(
                          onPressed: book.title.isNotEmpty ? () {} : null,
                          child: Text('Сохранить'),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
