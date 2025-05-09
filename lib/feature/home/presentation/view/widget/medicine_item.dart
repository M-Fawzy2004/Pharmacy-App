import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/app_styles.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/custom_image_network.dart';
import 'package:pharmacy_app/feature/product_details/presentation/view/product_details_view.dart';

class MedicineItem extends StatelessWidget {
  const MedicineItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsView.routeName,
          arguments: {
            'product': productModel,
            'cartItem': CartItemEntity(productModel: productModel),
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kBlueColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Expanded(
              child: CustomImageNetwork(
                imageUrl: productModel.image,
                aspectRatio: 1.4,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),

            // name
            Text(
              productModel.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.fontText16(context),
            ),

            // size box
            SizedBox(
              height: screenHeight * 0.01,
            ),

            // price and icon add
            Row(
              children: [
                Text(
                  '${productModel.price} جنيه',
                  style: Styles.fontText13(context).copyWith(
                    color: kBlueColor,
                  ),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: kBlueColor,
                  child: FittedBox(
                    child: IconButton(
                      onPressed: () {
                        context.read<CartCubit>().addProduct(productModel);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
