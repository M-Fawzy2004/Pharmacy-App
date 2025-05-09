import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle titleSplashView(context) {
    return TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontText13(context) {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle fontText16(context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle fontText20(context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle titleLoginStyle() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.black38,
    );
  }

  static TextStyle textInputStyle(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
    );
  }
}
