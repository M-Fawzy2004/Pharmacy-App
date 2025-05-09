import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Styles.fontText20(context),
        ),
      ],
    );
  }
}
