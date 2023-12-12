import 'package:book_storage/domain/models/book_info.dart';
import 'package:book_storage/features/library/cubits/book_creation_cubit.dart';
import 'package:book_storage/features/library/cubits/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/short_book_info.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  late final LibraryCubit libraryCubit;

  @override
  void initState() {
    libraryCubit = LibraryCubit(context.read())..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('a'),
      ),
      body: BlocBuilder<LibraryCubit, LibraryState>(
        bloc: libraryCubit,
        builder: (context, state) => switch (state) {
          LibraryErrorState() => LibraryErrorView(message: state.message),
          LibraryLoadedState() => LibraryLoadedView(books: state.books),
          _ => const LibraryLoadingView(),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final bookCreationCubit = BookCreationCubit();

              return BookCreationDialog(
                bookCreationCubit: bookCreationCubit,
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

class LibraryLoadedView extends StatelessWidget {
  final List<BookInfo> books;

  const LibraryLoadedView({
    required this.books,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookShortInfoWidget(book: books[index]);
      },
    );
  }
}

class LibraryErrorView extends StatelessWidget {
  final String message;

  const LibraryErrorView({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}

class LibraryLoadingView extends StatelessWidget {
  const LibraryLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class BookCreationDialog extends StatelessWidget {
  const BookCreationDialog({
    super.key,
    required this.bookCreationCubit,
  });

  final BookCreationCubit bookCreationCubit;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<BookCreationCubit, BookInfo>(
        bloc: bookCreationCubit,
        builder: (context, book) {
          return Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Название',
                  helperText:
                      book.isTitleComplete ? null : '* обязательное поле',
                ),
                onChanged: bookCreationCubit.setTitle,
              ),
              FilledButton(
                onPressed: book.isCompleted ? () {} : null,
                child: Text('Сохранить'),
              ),
            ],
          );
        },
      ),
    );
  }
}
