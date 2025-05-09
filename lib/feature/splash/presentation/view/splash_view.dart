import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/splash/presentation/view/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SplashViewBody(),
    );
  }
}
