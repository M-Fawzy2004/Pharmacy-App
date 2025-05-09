import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({
    super.key,
    required this.title,
    required this.isNotfication,
  });

  final String title;
  final bool isNotfication;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          isNotfication
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kBlueColor,
                    ),
                    child: FittedBox(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: Styles.fontText20(context),
            ),
          ),
        ],
      ),
    );
  }
}
