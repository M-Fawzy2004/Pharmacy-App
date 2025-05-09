import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/custom_snak_bar.dart';
import 'package:pharmacy_app/core/widget/custom_modal_progress_hud.dart';
import 'package:pharmacy_app/feature/auth/presentation/manager/sign_in/sign_in_cubit.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/widget/sign_in_view_body.dart';
import 'package:pharmacy_app/feature/home/presentation/view/main_view.dart';

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(
              'تم تسجيل الدخول بنجاح',
              backgroundColor: kBlueColor,
            ),
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            MainView.routeName,
            (route) => false,
          );
        }
        if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(
              state.message,
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          text: 'جارى تسجيل الدخول',
          inAsyncCall: state is SignInLoading,
          child: SignInViewBody(),
        );
      },
    );
  }
}
