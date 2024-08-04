import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(4),
          child: Icon(
            FontAwesomeIcons.solidStar,
            color: Color(0xffFFDD4F),
            size: 18,
          ),
        ),
        Text(
          '4.8',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        const Padding(
          padding: EdgeInsets.all(9),
          child: Text(
            '(2390)',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
