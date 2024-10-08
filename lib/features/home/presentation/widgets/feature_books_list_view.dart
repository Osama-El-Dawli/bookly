import 'package:bookly_app/core/utils/app_routs.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_shimmer.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          final bookList = state.books.reversed.toList();
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.builder(
                itemCount: state.books.length,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context).push(
                        AppRouts.bookDetailsView,
                        extra: bookList[index],
                      ),
                      child: CustomBookImage(
                        imageUrl:
                            bookList[index].volumeInfo!.imageLinks!.thumbnail!,
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errmessage);
        } else {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomLoadingShimmer(),
                ),
                itemCount: 10,
              ));
        }
      },
    );
  }
}
