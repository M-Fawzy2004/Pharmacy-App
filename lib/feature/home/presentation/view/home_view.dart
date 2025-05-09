import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:pharmacy_app/core/helper/get_it_service.dart';
import 'package:pharmacy_app/core/repos/product_repo.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductCubit(
          getIt.get<ProductRepo>(),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 7, right: 7),
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
