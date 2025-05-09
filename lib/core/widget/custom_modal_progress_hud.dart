import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';

class CustomModalProgressHUD extends StatelessWidget {
  final bool inAsyncCall;
  final Widget child;
  final String text;

  const CustomModalProgressHUD({
    super.key,
    required this.inAsyncCall,
    required this.child,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (inAsyncCall)
          Positioned.fill(
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: kBlueColor,
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 8),
                    Text(
                      'لحظه من فضلك',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kBlueColor,
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
