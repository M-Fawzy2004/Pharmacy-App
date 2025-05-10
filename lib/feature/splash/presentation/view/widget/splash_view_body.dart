// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/utils/assets.dart';
import 'package:pharmacy_app/feature/auth/data/repos/auth_repo.dart';
import 'package:pharmacy_app/feature/home/presentation/view/main_view.dart';
import 'package:pharmacy_app/feature/onboarding/presentation/view/onboarding_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  // init state
  @override
  void initState() {
    super.initState();
    // navgation to onboarding view
    excuteNavgation();
  }

  @override
  Widget build(BuildContext context) {
    // center image
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo image
          Image.asset(
            Assets.imagesImagesRemovebgPreview,
            color: kBlueColor,
          ),
        ],
      ),
    );
  }

  // method navgation
  void excuteNavgation() {
    // wait 3 seconds تأخير 3 ثواني
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // check login or not
        var isLogin = AuthRepositoryImpl(Supabase.instance.client).isLoggedIn();
        if (isLogin) {
          // login then navgation to main view
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          // not login then navgation to onboarding view
          Navigator.pushReplacementNamed(context, OnboardingView.routeName);
        }
      },
    );
  }
}
