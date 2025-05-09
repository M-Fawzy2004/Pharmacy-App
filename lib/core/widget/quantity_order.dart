import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_item/cart_item_cubit.dart';

class QuantityOrder extends StatelessWidget {
  const QuantityOrder({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kBlueColor,
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff41414F),
                  shape: BoxShape.circle,
                ),
                child: FittedBox(
                  child: IconButton(
                    onPressed: () {
                      if (cartItemEntity.count > 1) {
                        cartItemEntity.decreasedCount();
                        context
                            .read<CartItemCubit>()
                            .updateCartItem(cartItemEntity);
                      }
                    },
                    icon: Icon(Icons.remove),
                    color: Colors.white,
                  ),
                ),
              ),

              // text price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  cartItemEntity.count.toString(),
                  style: Styles.fontText16(context),
                ),
              ),

              // add
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff41414F),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    cartItemEntity.incrasedCount();
                    context
                        .read<CartItemCubit>()
                        .updateCartItem(cartItemEntity);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
