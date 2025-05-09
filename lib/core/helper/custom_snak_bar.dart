import 'package:flutter/material.dart';

SnackBar buildSnakBarError(String? text, {Color? backgroundColor}) {
  backgroundColor ??= Colors.red.shade600;
  return SnackBar(
    content: Text(
      text ?? 'Error',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    elevation: 6,
  );
}
