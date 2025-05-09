import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';

class ProductItemDetails extends StatelessWidget {
  const ProductItemDetails({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kBackgroundColor,
          ),
          child: Text(
            'تفاصيل المنتج',
            style: Styles.fontText16(context).copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.015,
        ),
        Divider(
          color: kBlueColor,
          endIndent: 50,
          indent: 50,
        ),
        Text(
          productModel.details,
          style: Styles.fontText16(context).copyWith(
            color: kBlueColor,
          ),
        ),
      ],
    );
  }
}
