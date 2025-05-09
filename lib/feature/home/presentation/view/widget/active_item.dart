import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
        decoration: ShapeDecoration(
          color: kBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: Styles.fontText13(context).copyWith(
                color: kBlueColor,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.03,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.05,
              height: MediaQuery.sizeOf(context).height * 0.03,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(
                child: Image.asset(image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
