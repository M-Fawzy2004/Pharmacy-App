import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/helper/get_it_service.dart';
import 'package:pharmacy_app/feature/auth/data/repos/auth_repo.dart';
import 'package:pharmacy_app/feature/auth/presentation/manager/sign_in/sign_in_cubit.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/widget/sign_in_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: BlocProvider(
            create: (context) => SignInCubit(
              getIt.get<AuthRepository>(),
            ),
            child: SignInBlocConsumer(),
          ),
        ),
      ),
    );
  }
}
