import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/core/utils/assets.dart';
import 'package:pharmacy_app/core/widget/custom_button.dart';
import 'package:pharmacy_app/core/widget/product_view_header.dart';
import 'package:pharmacy_app/feature/auth/presentation/manager/sign_in/sign_in_cubit.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/sign_up_view.dart';
import 'package:pharmacy_app/core/widget/custom_form_text_field.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/widget/custom_or_login.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/widget/different_sign_in.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/widget/not_have_and_have_account.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  // variable for autovalidate mode
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // variable for form key
  final GlobalKey<FormState> formKey = GlobalKey();

  // variable for text field
  late String email, password;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            // size box height
            SizedBox(
              height: screenHeight * .02,
            ),

            // icon back
            ProductViewHeader(
              isNotfication: true,
              title: '',
            ),

            // size box height
            SizedBox(
              height: screenHeight * .015,
            ),

            // logo
            Image.asset(Assets.imagesLogoblue),

            // size box height
            SizedBox(
              height: screenHeight * .05,
            ),

            // text field email
            CustomTextFormField(
              onSaved: (val) => email = val!,
              hintText: 'البريد الإلكتروني',
              isPassword: false,
            ),

            // size box height
            SizedBox(
              height: screenHeight * .01,
            ),

            // text field password
            CustomTextFormField(
              onSaved: (val) => password = val!,
              hintText: 'كلمة المرور',
              isPassword: true,
            ),

            // size box height
            SizedBox(
              height: screenHeight * .04,
            ),

            // sign up button
            CustomButton(
              text: 'تسجيل الدخول',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SignInCubit>().signIn(email, password);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),

            // size box height
            SizedBox(
              height: screenHeight * .025,
            ),

            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'هل نسيت كلمة المرور؟',
                    style: Styles.fontText13(context).copyWith(
                      color: kBlueColor,
                    ),
                  ),
                ),
              ],
            ),

            // size box height
            SizedBox(
              height: screenHeight * .025,
            ),

            // OR
            CutomOrLogin(),

            // size box height
            SizedBox(
              height: screenHeight * .025,
            ),

            // different sign in
            DifferentSignIn(),

            // size box height
            SizedBox(
              height: screenHeight * .025,
            ),

            // not have account and have account
            NotHaveAccountAndHaveAccount(
              title1: 'ليس لديك حساب؟',
              title2: 'إنشاء حساب',
              onTap: () {
                Navigator.pushNamed(context, SignUpView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
