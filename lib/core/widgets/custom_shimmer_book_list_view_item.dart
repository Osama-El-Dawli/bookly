import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerBookListViewItem extends StatelessWidget {
  const CustomShimmerBookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!.withOpacity(0.5),
              highlightColor: Colors.grey[100]!.withOpacity(0.5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[300]!.withOpacity(0.5),
                ),
                width: 80,
                height: 125,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!.withOpacity(0.5),
                    highlightColor: Colors.grey[100]!.withOpacity(0.5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 20,
                      color: Colors.grey[300]!.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!.withOpacity(0.5),
                    highlightColor: Colors.grey[100]!.withOpacity(0.5),
                    child: Container(
                      width: 100,
                      height: 14,
                      color: Colors.grey[300]!.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!.withOpacity(0.5),
                        highlightColor: Colors.grey[100]!.withOpacity(0.5),
                        child: Container(
                          width: 50,
                          height: 20,
                          color: Colors.grey[300]!.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        width: 36,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!.withOpacity(0.5),
                        highlightColor: Colors.grey[100]!.withOpacity(0.5),
                        child: Container(
                          width: 100,
                          height: 20,
                          color: Colors.grey[300]!.withOpacity(0.5),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
