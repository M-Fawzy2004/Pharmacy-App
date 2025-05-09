// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    required this.isPassword,
    this.prefixIcon,
    this.onSaved,
    this.hintStyle,
    this.keyboardType,
  });

  final String? hintText;
  final String? hintStyle;
  final bool isPassword;
  final IconData? prefixIcon;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onSaved: widget.onSaved,
      cursorColor: kBlueColor,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'الحقل مطلوب';
        } else {
          return null;
        }
      },
      obscureText: widget.isPassword ? _isObscured : false,
      keyboardType: widget.keyboardType,
      style: Styles.textInputStyle(context),
      decoration: InputDecoration(
        fillColor: kBackgroundColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        hintText: widget.hintText,
        hintStyle: Styles.titleLoginStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: methodEnableOutlineBorder(),
        focusedBorder: methodFocusOutlineBorder(),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: kBlueColor,
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  color: Colors.grey[400],
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
      ),
    );
  }

  // method enable outline border
  OutlineInputBorder methodEnableOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }

  // method focus outline border
  OutlineInputBorder methodFocusOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: kBlueColor, width: 2),
    );
  }
}
