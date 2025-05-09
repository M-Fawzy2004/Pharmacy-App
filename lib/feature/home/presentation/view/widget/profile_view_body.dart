import 'package:flutter/cupertino.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/home_header.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/profile_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        // sized box
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.034,
          ),
        ),
        // set up profile
        SliverToBoxAdapter(
          child: HomeHeader(
            title: 'إعدادات الملف الشخصي',
            isCart: false,
          ),
        ),
        // sized box
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
        ),
        // profile info
        SliverToBoxAdapter(
          child: ProfileInfo(),
        ),
      ],
    );
  }
}
