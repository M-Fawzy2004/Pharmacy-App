// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/core/utils/assets.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.title,
    required this.personImage,
  });

  final String personImage, title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // front person image
        Positioned(
          top: 100,
          right: 0,
          left: 0,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                personImage,
                width: 500,
                height: 500,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),

        // Background with color gradient
        Image.asset(
          Assets.imagesBakgroundImage,
          fit: BoxFit.cover,
        ),

        // Logo at the top
        Positioned(
          top: 50,
          left: 20,
          child: Row(
            children: [
              Image.asset(
                Assets.imagesImagesRemovebgPreview,
                height: MediaQuery.sizeOf(context).height * 0.1,
                color: kBlueColor,
              ),
            ],
          ),
        ),

        // title
        Positioned(
          bottom: 150,
          left: 20,
          right: 20,
          child: Text(
            title,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: Styles.titleSplashView(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
