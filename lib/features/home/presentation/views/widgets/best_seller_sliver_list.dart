import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerSliverList extends StatelessWidget {
  const BestSellerSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return const BestSellerListViewItem();
          },
          childCount: 10,
        ),
      ),
    );
  }
}
