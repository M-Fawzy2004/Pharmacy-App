import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/featured_button.dart';

class OffersItem extends StatelessWidget {
  const OffersItem({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // text
          Text(
            'اطلب الدواء',
            style: Styles.fontText16(context).copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          // SizeBox
          SizedBox(
            height: screenHeight * 0.005,
          ),
          // text
          Text(
            'قم بتحميل الوصفة الطبية وأخبرنا بما يلي أنت بحاجة إلى ذلك. وسنقوم بالباقي',
            style: Styles.fontText13(context).copyWith(
              color: Colors.black38,
              fontWeight: FontWeight.w600,
            ),
          ),
          // SizeBox
          SizedBox(
            height: screenHeight * 0.005,
          ),
          // offers
          Text(
            'احصل على خصم يصل إلى 30%',
            style: Styles.fontText13(context).copyWith(
              color: kBlueColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          // sizeBox
          SizedBox(
            height: screenHeight * 0.005,
          ),
          // button
          FeaturedButton(
            title: 'اطلب الآن',
          ),
        ],
      ),
    );
  }
}
