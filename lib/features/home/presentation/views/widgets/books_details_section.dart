import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/box_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ??
                'https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg?w=740&t=st=1723294460~exp=1723295060~hmac=51b2a4841d5664f7cdebea0076b33692f70800153a53723621f7f7a8b28a9ec4',
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        Text(
          textAlign: TextAlign.center,
          bookModel.volumeInfo!.title!,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
            opacity: .7,
            child: Text(
              textAlign: TextAlign.center,
              bookModel.volumeInfo!.authors?[0] ?? 'No Author',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            )),
        const SizedBox(
          height: 14,
        ),
        BookRating(
          count: bookModel.volumeInfo!.ratingsCount ?? 2390,
          rating: bookModel.volumeInfo!.averageRating?.toDouble() ?? 4.8,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BoxAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
