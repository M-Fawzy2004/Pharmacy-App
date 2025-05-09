import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:pharmacy_app/core/helper/get_dummy_product.dart';
import 'package:pharmacy_app/core/widget/custom_error.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/medicine_item_sliver_grid.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MedicineItemSliverBlocBuilder extends StatelessWidget {
  const MedicineItemSliverBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          final shuffledProducts = List<ProductModel>.from(state.products)
            ..shuffle(Random());
          return MedicineItemSliverGrid(
            product: shuffledProducts,
          );
        } else if (state is ProductFailure) {
          return SliverToBoxAdapter(
            child: CustomError(text: state.message),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: MedicineItemSliverGrid(
              product: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}
