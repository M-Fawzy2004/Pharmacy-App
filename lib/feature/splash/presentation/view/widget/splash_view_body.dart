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
  @override
  void initState() {
    super.initState();
    // navgation to onboarding view
    excuteNavgation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
    Future.delayed(
      const Duration(seconds: 3),
      () {
        var isLogin = AuthRepositoryImpl(Supabase.instance.client).isLoggedIn();
        if (isLogin) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnboardingView.routeName);
        }
      },
    );
  }
}
