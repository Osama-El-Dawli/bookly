import 'package:bookly_app/core/utils/app_routs.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_shimmer.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          final bookList = state.books.reversed.toList();
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushReplacement(
                            AppRouts.bookDetailsView,
                            extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        imageUrl: bookList[index]
                                .volumeInfo
                                ?.imageLinks
                                ?.thumbnail ??
                            'https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg?w=740&t=st=1723294460~exp=1723295060~hmac=51b2a4841d5664f7cdebea0076b33692f70800153a53723621f7f7a8b28a9ec4',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .15,
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
