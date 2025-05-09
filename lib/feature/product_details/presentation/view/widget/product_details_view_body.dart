import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
import 'package:pharmacy_app/feature/product_details/presentation/view/widget/add_to_cart_bar.dart';
import 'package:pharmacy_app/feature/product_details/presentation/view/widget/product_image_header.dart';
import 'package:pharmacy_app/feature/product_details/presentation/view/widget/product_info_card.dart';
import 'package:pharmacy_app/feature/product_details/presentation/view/widget/product_item_details.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody(
      {super.key, required this.productModel, required this.cartItemEntity});

  final ProductModel productModel;
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: ProductImageHeader(
                productModel: productModel,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
            ),
            SliverToBoxAdapter(
              child: ProductInfoCard(
                productModel: productModel,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
            ),
            SliverToBoxAdapter(
              child: ProductItemDetails(
                productModel: productModel,
              ),
            ),
          ],
        ),
        AddToCartBar(
          productModel: productModel,
          cartItemEntity: cartItemEntity,
        ),
      ],
    );
  }
}
