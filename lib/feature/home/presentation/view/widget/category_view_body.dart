import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/category_item_sliver_grid.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/home_header.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        // sized box
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.034,
          ),
        ),
        // header
        SliverToBoxAdapter(
          child: HomeHeader(
            title: 'التصنيفات',
            isCart: true,
          ),
        ),
        // sized box
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.02,
          ),
        ),
        // category item
        CategoryItemSliverGrid(),
        // sized box
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.01,
          ),
        ),
      ],
    );
  }
}
