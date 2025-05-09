import 'package:flutter/material.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.sizeOf(context).height * 0.03,
      child: Image.asset(
        image,
        color: Color(0xffA2B0C0),
      ),
    );
  }
}
