import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/order_item.dart';

class OrderItemSliverGrid extends StatelessWidget {
  const OrderItemSliverGrid({super.key, required this.cartEntity});

  final List<CartItemEntity> cartEntity;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 120,
      ),
      itemCount: cartEntity.length,
      itemBuilder: (context, index) {
        return OrderItem(
          cartEntity: cartEntity[index],
        );
      },
    );
  }
}
