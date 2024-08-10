import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingShimmer extends StatelessWidget {
  const CustomLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!.withOpacity(.7),
        highlightColor: Colors.grey[100]!.withOpacity(.7),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
