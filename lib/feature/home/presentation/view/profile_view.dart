import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: const ProfileViewBody(),
      ),
    );
  }
}
