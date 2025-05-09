import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBackgroundColor,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: Styles.fontText20(context).copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            shadows: [
              BoxShadow(
                blurRadius: 100,
                spreadRadius: 20,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
