import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/offers_item.dart';

class OfferItemList extends StatelessWidget {
  const OfferItemList({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      child: Row(
        children: List.generate(
          2,
          (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: OffersItem(),
          ),
        ),
      ),
    );
  }
}
