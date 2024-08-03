import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsData.logoSvg,
          width: ((MediaQuery.sizeOf(context).width) * 75 / 100),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Read Free Books',
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
