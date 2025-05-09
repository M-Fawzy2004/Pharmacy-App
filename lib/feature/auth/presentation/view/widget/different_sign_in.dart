import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/core/utils/assets.dart';
import 'package:pharmacy_app/feature/auth/presentation/manager/sign_in/sign_in_cubit.dart';

class DifferentSignIn extends StatelessWidget {
  const DifferentSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // sign in with google
        context.read<SignInCubit>().signInWithGoogle();
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.045,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey.shade100,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(
                Assets.imagesGoogle,
                height: 30,
              ),
            ),
            const Spacer(),
            Text(
              'التسجيل بواسطه جوجل',
              style: Styles.fontText16(context),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
