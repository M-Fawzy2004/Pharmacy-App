import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/widget/custom_check_box.dart';

class TermsAndCondition extends StatelessWidget {
  final bool isAccepted;
  final ValueChanged<bool> onChanged;

  const TermsAndCondition({
    super.key,
    required this.isAccepted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // check box
        CustomCheckBox(
          isChecker: isAccepted,
          onChanged: (bool value) {
            onChanged(value);
          },
        ),

        // size box width
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.02,
        ),

        // text
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Text.rich(
            TextSpan(
              children: [
                // text span 1
                TextSpan(
                  text: 'انا أوافق على ',
                  style: Styles.fontText13(context),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: Styles.fontText13(context).copyWith(
                    color: kBlueColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
