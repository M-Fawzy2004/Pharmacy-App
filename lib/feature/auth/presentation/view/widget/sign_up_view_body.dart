import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/helper/custom_snak_bar.dart';
import 'package:pharmacy_app/core/utils/assets.dart';
import 'package:pharmacy_app/core/widget/custom_button.dart';
import 'package:pharmacy_app/core/widget/product_view_header.dart';
import 'package:pharmacy_app/feature/auth/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/sign_in_view.dart';
import 'package:pharmacy_app/core/widget/custom_form_text_field.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/widget/not_have_and_have_account.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/widget/terms_and_condition.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  // variable for checkbox
  bool isTermsAccepted = false;

  // variable for text field
  late String name, email, password;

  // variable for form key
  final formKey = GlobalKey<FormState>();

  // variable for autovalidate mode
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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

            // text field full name
            CustomTextFormField(
              onSaved: (val) => name = val!,
              hintText: 'الاسم كامل',
              isPassword: false,
            ),

            // size box height
            SizedBox(
              height: screenHeight * .01,
            ),

            // text field email
            CustomTextFormField(
              onSaved: (val) => email = val!,
              hintText: 'البريد الالكتروني',
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
              height: screenHeight * .035,
            ),

            // terms and conditions
            TermsAndCondition(
              isAccepted: isTermsAccepted,
              onChanged: (val) {
                setState(
                  () {
                    isTermsAccepted = val;
                  },
                );
              },
            ),

            // size box height
            SizedBox(
              height: screenHeight * .04,
            ),

            // sign up button
            CustomButton(
              text: 'إنشاء حساب',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  if (isTermsAccepted) {
                    context.read<SignUpCubit>().signUp(
                          email,
                          password,
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      buildSnakBarError(
                        'يجب قبول الشروط والاحكام',
                      ),
                    );
                  }
                }
              },
            ),

            // size box height
            SizedBox(
              height: screenHeight * .025,
            ),

            // not have account and have account
            NotHaveAccountAndHaveAccount(
              title1: 'ليس لديك حساب؟',
              title2: 'تسجيل دخول',
              onTap: () {
                Navigator.pushNamed(context, SignInView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
