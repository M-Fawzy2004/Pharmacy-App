import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/core/utils/assets.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onTap,
    this.controller,
    this.onChanged,
  });

  final Function()? onTap;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      style: Styles.textInputStyle(context),
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        fillColor: kBackgroundColor,
        filled: true,
        hintText: 'البحث عن منتج',
        hintStyle: Styles.titleLoginStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            Assets.imagesSpeaker,
            width: 20,
            height: 20,
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Image.asset(
            Assets.imagesSearchIcon,
            width: 15,
            height: 15,
          ),
        ),
      ),
    );
  }
}
