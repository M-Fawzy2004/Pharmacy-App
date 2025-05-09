import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({
    super.key,
    required this.currentPage,
    required PageController controller,
  }) : _controller = controller;

  final int currentPage;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: currentPage == 2
          ? null
          : SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white54,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8,
              ),
            ),
    );
  }
}
