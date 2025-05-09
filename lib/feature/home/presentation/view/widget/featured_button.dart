import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class FeaturedButton extends StatelessWidget {
  const FeaturedButton({super.key, this.onPressed, required this.title});

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: kBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: FittedBox(
          child: Text(
            title,
            style: Styles.fontText13(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
