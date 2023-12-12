import 'package:book_storage/core/extensions/widget_padding_extension.dart';
import 'package:book_storage/domain/models/book_info.dart';
import 'package:flutter/material.dart';

class BookShortInfoWidget extends StatelessWidget {
  final BookInfo book;

  const BookShortInfoWidget({
    required this.book,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const ColoredBox(
            color: Colors.black26,
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              book.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (book.author.isEmpty)
              Text(book.author).paddingOnly(top: 4),
            Row(
              children: [
                Text('Год: '),
                Text(book.year.toString()),
              ],
            ).paddingOnly(top: 4),
            Row(
              children: [
                Text('Издательство: '),
                Text(book.publisher),
              ],
            ).paddingOnly(top: 4),
            Text('${book.pageCount} стр.').paddingOnly(top: 4),
          ],
        ).paddingOnly(left: 10),
      ],
    ).paddingSymmetric(vertical: 8, horizontal: 16);
  }
}