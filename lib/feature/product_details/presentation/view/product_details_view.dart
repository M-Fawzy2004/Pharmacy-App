import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_item/cart_item_cubit.dart';
import 'package:pharmacy_app/feature/product_details/presentation/view/widget/product_details_bloc_consumer.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.productModel,
    required this.cartItemEntity,
  });

  static const routeName = '/product_details';
  final ProductModel productModel;
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CartItemCubit(),
            ),
            BlocProvider(
              create: (context) => CartCubit(),
            ),
          ],
          child: ProductDetailsBlocConsumer(
            productModel: productModel,
            cartItemEntity: cartItemEntity,
          ),
        ),
      ),
    );
  }
}
