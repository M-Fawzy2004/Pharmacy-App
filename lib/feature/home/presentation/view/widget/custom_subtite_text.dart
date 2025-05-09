import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class CustomSubtitleText extends StatelessWidget {
  const CustomSubtitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '',
              style: Styles.fontText16(context).copyWith(
                color: Color(0xffF4A91F),
              ),
            ),
            TextSpan(
              text: " / ",
              style: Styles.fontText16(context).copyWith(
                color: Color(0xffF4A91F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
