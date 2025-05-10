import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/splash/presentation/view/widget/splash_view_body.dart';

// splash view
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  // onGenerateRoute in main
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    // scaffold
    return Scaffold(
      // body
      body: const SplashViewBody(),
    );
  }
}
