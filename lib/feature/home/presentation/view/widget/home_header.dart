import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/core/utils/assets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    this.onTap,
    required this.title,
    required this.isCart,
  });

  final Function()? onTap;
  final String title;
  final bool isCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isCart
            ? GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  Assets.imagesMdiCart,
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  color: kBlueColor,
                ),
              )
            : SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.1,
              ),
        Text(
          title,
          style: Styles.fontText20(context).copyWith(
            color: kBlueColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        Image.asset(
          Assets.imagesImagesRemovebgPreview,
          height: MediaQuery.sizeOf(context).height * 0.05,
          color: kBlueColor,
        ),
      ],
    );
  }
}
