import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/custom_snak_bar.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmacy_app/feature/product_details/presentation/view/widget/product_details_view_body.dart';

class ProductDetailsBlocConsumer extends StatelessWidget {
  const ProductDetailsBlocConsumer({
    super.key,
    required this.productModel,
    required this.cartItemEntity,
  });

  final ProductModel productModel;
  final CartItemEntity cartItemEntity;

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
      child: ProductDetailsViewBody(
        productModel: productModel,
        cartItemEntity: cartItemEntity,
      ),
    );
  }
}