import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/product_details/presentation/view/widget/product_info_row.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productModel.name,
          style: Styles.fontText20(context).copyWith(
            color: kBlueColor,
          ),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Text(
          productModel.categoryName,
          style: Styles.fontText16(context),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Divider(
          color: kBlueColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProductInfoRow(
                text: '5',
                icon: Icons.star_border_outlined,
              ),
              Spacer(),
              ProductInfoRow(
                text: 'FREE',
                icon: Icons.time_to_leave,
              ),
              Spacer(),
              ProductInfoRow(
                text: '20 min',
                icon: Icons.timelapse,
              ),
            ],
          ),
        ),
        Divider(
          color: kBlueColor,
        ),
      ],
    );
  }
}
