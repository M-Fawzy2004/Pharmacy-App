import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class ProductInfoRow extends StatelessWidget {
  const ProductInfoRow({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Styles.fontText16(context).copyWith(
            color: kBlueColor,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.01,
        ),
        Icon(
          icon,
          size: 30,
          color: kBlueColor,
        ),
      ],
    );
  }
}
