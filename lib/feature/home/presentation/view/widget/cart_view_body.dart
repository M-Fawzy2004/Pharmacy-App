import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/widget/custom_button.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/home_header.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/order_item_sliver_grid.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/total_order_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            // sized box
            SliverToBoxAdapter(
              child: SizedBox(
                height: screenHeight * 0.034,
              ),
            ),
            // header
            SliverToBoxAdapter(
              child: HomeHeader(
                title: 'الطلبات',
                isCart: false,
              ),
            ),
            // sized box
            SliverToBoxAdapter(
              child: SizedBox(
                height: screenHeight * 0.02,
              ),
            ),
            // total order
            SliverToBoxAdapter(
              child: TotalOrderHeader(),
            ),
            // sized box
            SliverToBoxAdapter(
              child: SizedBox(
                height: screenHeight * 0.02,
              ),
            ),
            // order item
            OrderItemSliverGrid(
              cartEntity: context.watch<CartCubit>().cartEntity.cartItems,
            ),
          ],
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
          child: CustomButton(
            text: 'الدفع',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
