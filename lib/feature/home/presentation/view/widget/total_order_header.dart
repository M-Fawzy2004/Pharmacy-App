import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_item/cart_item_cubit.dart';

class TotalOrderHeader extends StatelessWidget {
  const TotalOrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Row(
          children: [
            Text(
              'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} طلبات',
              style: Styles.fontText16(context),
            ),
            Spacer(),
            BlocBuilder<CartItemCubit, CartItemState>(
              builder: (context, state) {
                return Text(
                  'المجموع : ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
                  style: Styles.fontText16(context),
                );
              },
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
