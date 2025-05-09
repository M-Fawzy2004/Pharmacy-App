import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/assets.dart';
import 'package:pharmacy_app/feature/onboarding/presentation/view/widget/onboarding_item.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  List categories = [
    {
      "title":
          "صحتك هي أولويتنا القصوى. نحن ملتزمون بتقديم أفضل خدمات الرعاية الصحية لك",
      "personImage": Assets.imagesDoctor1,
    },
    {
      "title":
          "نحن هنا من أجلك نهارًا أو ليلًا. فريقنا الطبي المتخصص جاهز لدعمك على مدار الساعة طوال أيام الأسبوع بكل عناية وتعاطف",
      "personImage": Assets.imagesDoctor2,
    },
    {
      "title":
          "نحن نقدم التميز في كل خدمة نقدمها. بفضل التكنولوجيا المتطورة والخبرة المهنية، فإن صحتك في أيدٍ أمينة",
      "personImage": Assets.imagesDoctor3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.controller,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return OnboardingItem(
          title: categories[index]['title'],
          personImage: categories[index]['personImage'],
        );
      },
    );
  }
}
