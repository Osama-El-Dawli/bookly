import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultLisView extends StatelessWidget {
  const SearchResultLisView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const BookListViewItem(
          bookModel: BookModel(),
        );
      },
      itemCount: 20,
    );
  }
}
