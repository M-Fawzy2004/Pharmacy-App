import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/core/widget/custom_button.dart';
import 'package:pharmacy_app/core/widget/quantity_order.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_item/cart_item_cubit.dart';

class AddToCartBar extends StatelessWidget {
  const AddToCartBar({
    super.key,
    required this.productModel,
    required this.cartItemEntity,
  });

  final ProductModel productModel;
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.04,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kBackgroundColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                QuantityOrder(
                  cartItemEntity: cartItemEntity,
                ),
                Spacer(),
                BlocBuilder<CartItemCubit, CartItemState>(
                  builder: (context, state) {
                    return Text(
                      '${cartItemEntity.calculateTotalPrice()} جنيه',
                      style: Styles.fontText20(context),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
            CustomButton(
              text: 'أضف إالى السله',
              onTap: () {
                context.read<CartCubit>().addProduct(productModel);
              },
            ),
          ],
        ),
      ),
    );
  }
}
