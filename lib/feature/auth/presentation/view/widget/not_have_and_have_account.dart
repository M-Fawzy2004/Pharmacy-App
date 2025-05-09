import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class NotHaveAccountAndHaveAccount extends StatelessWidget {
  const NotHaveAccountAndHaveAccount({
    super.key,
    required this.title1,
    required this.title2,
    this.onTap,
  });

  final String title1;
  final String title2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title1,
          style: Styles.fontText16(context),
        ),
        Text(' '),
        GestureDetector(
          onTap: onTap,
          child: Text(
            title2,
            style: Styles.fontText16(context).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: kBlueColor,
              color: kBlueColor,
            ),
          ),
        )
      ],
    );
  }
}
