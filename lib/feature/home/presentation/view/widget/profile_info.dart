import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/core/widget/custom_form_text_field.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  String? selectedMonth, selectedDay, selectedYear;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        // profile image
        CircleAvatar(
          backgroundColor: kBackgroundColor,
          radius: 50,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                size: 70,
                color: kBlueColor,
              ),
            ),
          ),
        ),

        // sized box
        SizedBox(
          height: screenHeight * 0.03,
        ),

        // text
        Text(
          'معلومات شخصية',
          style: Styles.fontText16(context),
        ),

        // sized box
        SizedBox(
          height: screenHeight * 0.03,
        ),

        // custom field profile info
        // full name
        CustomTextFormField(
          hintText: 'الاسم الكامل',
          isPassword: false,
          prefixIcon: Icons.person,
        ),

        // sized box
        SizedBox(
          height: screenHeight * 0.01,
        ),

        // content number
        CustomTextFormField(
          hintText: 'رقم الهاتف',
          isPassword: false,
          prefixIcon: Icons.phone,
        ),

        // sized box
        SizedBox(
          height: screenHeight * 0.01,
        ),
      ],
    );
  }
}
