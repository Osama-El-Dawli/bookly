import 'package:bookly_app/core/widgets/custom_loading_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  // final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) => const CustomLoadingShimmer(),
          errorWidget: (context, url, error) => Container(
              color: const Color(0xffB00020),
              child: const Icon(
                Icons.error_outline_rounded,
                size: 30,
              )),
        ),
      ),
    );
  }
}
