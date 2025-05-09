import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_item/cart_item_cubit.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: BlocProvider(
          create: (context) => CartItemCubit(),
          child: const CartViewBody(),
        ),
      ),
    );
  }
}
