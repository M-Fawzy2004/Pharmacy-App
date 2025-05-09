import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/custom_snak_bar.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/main_view_body.dart';

class MainViewBlocConsumer extends StatelessWidget {
  const MainViewBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(
              'تم إضافة المنتج بنجاح',
              backgroundColor: kBlueColor,
            ),
          );
        }
        if (state is CartItemRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(
              'تم حذف المنتج بنجاح',
              backgroundColor: kBlueColor,
            ),
          );
        }
      },
      child: MainViewBody(
        currentViewIndex: currentViewIndex,
      ),
    );
  }
}
