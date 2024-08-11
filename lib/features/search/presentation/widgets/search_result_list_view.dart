import 'package:bookly_app/core/utils/app_routs.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_shimmer_book_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResultLisView extends StatelessWidget {
  const SearchResultLisView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Center(
            child: Text(
              'Search for a Book 🔎📚',
              style: Styles.textStyle30.copyWith(fontWeight: FontWeight.normal),
            ),
          );
        } else if (state is SearchSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => GoRouter.of(context).push(
                  AppRouts.bookDetailsView,
                  extra: state.books[index],
                ),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
            itemCount: state.books.length,
          );
        } else if (state is SearchFailure) {
          if (state.errMessage ==
              'type \'Null\' is not a subtype of type \'Iterable<dynamic>\'') {
            return const CustomErrorWidget(errMessage: 'Not Found 😔');
          }
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return ListView.builder(
            itemBuilder: (context, index) =>
                const CustomShimmerBookListViewItem(),
            itemCount: 10,
          );
        }
      },
    );
  }
}
