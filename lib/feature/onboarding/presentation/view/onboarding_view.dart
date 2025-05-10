import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/onboarding/presentation/view/widget/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  // route name to navigate
  static const routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    // scaffold
    return Scaffold(
      // body
      body: OnboardingViewBody(),
    );
  }
}
