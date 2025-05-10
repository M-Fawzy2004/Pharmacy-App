// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/widget/custom_button.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/sign_up_view.dart';
import 'package:pharmacy_app/feature/onboarding/presentation/view/widget/custom_dot_indicator.dart';
import 'package:pharmacy_app/feature/onboarding/presentation/view/widget/onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  // controller for page view
  final PageController _controller = PageController();

  // current page
  int currentPage = 0;

  // init state
  // دالة يتم استدعاؤها مرة واحدة عند إنشاء الـ State لأول مرة، قبل أن تُبنى واجهة المستخدم.
  @override
  void initState() {
    // من المهم استدعاء الدالة الأصلية لتضمن عمل التهيئة بشكل صحيح في كلاس الأب.
    super.initState();
    // يضيف مستمعًا للتغييرات في الـ controller (مثل الانتقال بين الصفحات).
    _controller.addListener(() {
      // يُستخدم لتحديث واجهة المستخدم عندما تتغير بيانات State.
      setState(() {
        //يأخذ رقم الصفحة الحالية من الـ PageController ويقربه (لأنه يكون double غالبًا)، ثم يخزن القيمة في currentPage (وهي متغير يُفترض أنه معرف مسبقًا في الكلاس).
        currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // PageView
        OnboardingPageView(
          controller: _controller,
        ),

        // Dots
        Positioned(
          bottom: 90,
          left: 0,
          right: 0,
          child: CustomDotIndicator(
            currentPage: currentPage,
            controller: _controller,
          ),
        ),

        // Start Button
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: currentPage == 2 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomButton(
                  text: 'البدء',
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SignUpView.routeName,
                      (route) => false,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
