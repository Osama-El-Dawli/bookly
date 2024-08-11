import 'package:bookly_app/core/utils/functions/custom_url_launcher.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BoxAction extends StatelessWidget {
  const BoxAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          )),
          Expanded(
              child: CustomButton(
            text: getText(),
            onPressed: () => customUrlLauncher(
              context,
              bookModel.volumeInfo?.previewLink,
            ),
            fontSize: 16,
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          )),
        ],
      ),
    );
  }

  String getText() {
    if (bookModel.volumeInfo?.previewLink! == null) {
      return 'Not Available';
    } else {
      return 'Free Preview';
    }
  }
}
