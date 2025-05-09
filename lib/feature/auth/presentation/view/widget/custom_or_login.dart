import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class CutomOrLogin extends StatelessWidget {
  const CutomOrLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 20,
            color: kBlueColor,
          ),
        ),
        Text(
          'أو',
          style: Styles.fontText16(context).copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        Expanded(
          child: Divider(
            indent: 20,
            color: kBlueColor,
          ),
        ),
      ],
    );
  }
}
