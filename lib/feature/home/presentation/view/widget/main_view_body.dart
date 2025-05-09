import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/home/presentation/view/category_view.dart';
import 'package:pharmacy_app/feature/home/presentation/view/home_view.dart';
import 'package:pharmacy_app/feature/home/presentation/view/cart_view.dart';
import 'package:pharmacy_app/feature/home/presentation/view/profile_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: [
        HomeView(),
        CategoryView(),
        CartView(),
        ProfileView(),
      ],
    );
  }
}
