import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_item/cart_item_cubit.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/custom_image_network.dart';
import 'package:pharmacy_app/core/widget/quantity_order.dart';

import '../../manager/cart_cubit/cart_cubit.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.cartEntity});

  final CartItemEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdate) {
          if (current.cartItemEntity == cartEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Slidable(
          startActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                onPressed: (context) {
                  context.read<CartCubit>().removeProduct(cartEntity);
                },
                icon: Icons.delete,
                label: 'حذف',
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartEntity.productModel.name,
                      style: Styles.fontText16(context).copyWith(
                        color: kBlueColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${cartEntity.calculateTotalPrice().toString()} جنيه',
                      style: Styles.fontText16(context).copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                    QuantityOrder(
                      cartItemEntity: cartEntity,
                    )
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: CustomImageNetwork(
                    imageUrl: cartEntity.productModel.image,
                    aspectRatio: 1.2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
