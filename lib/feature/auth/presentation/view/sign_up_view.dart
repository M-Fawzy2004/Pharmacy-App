import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/helper/get_it_service.dart';
import 'package:pharmacy_app/feature/auth/data/repos/auth_repo.dart';
import 'package:pharmacy_app/feature/auth/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/widget/sign_up_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: BlocProvider(
            create: (context) => SignUpCubit(
              getIt.get<AuthRepository>(),
            ),
            child: SignUpBlocConsumer(),
          ),
        ),
      ),
    );
  }
}
