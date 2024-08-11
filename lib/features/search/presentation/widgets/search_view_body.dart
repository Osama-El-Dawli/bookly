import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchTextField(
              onSearch: (searchValue) {
                context
                    .read<SearchCubit>()
                    .fetchSearchedBooks(searchValue: searchValue);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Search Result',
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 16,
            ),
            const Expanded(child: SearchResultLisView()),
          ],
        ),
      ),
    );
  }
}
