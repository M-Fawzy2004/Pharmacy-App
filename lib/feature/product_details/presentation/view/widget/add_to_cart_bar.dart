import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/widget/custom_button.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';

class AddToCartBar extends StatelessWidget {
  const AddToCartBar({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.04,
      left: 0,
      right: 0,
      child: CustomButton(
        text: 'أضف إالى السله',
        onTap: () {
          context.read<CartCubit>().addProduct(productModel);
        },
      ),
    );
  }
}
