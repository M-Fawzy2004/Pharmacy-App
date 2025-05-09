import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:pharmacy_app/core/widget/search_text_field.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductSearchField extends StatelessWidget {
  const ProductSearchField({
    super.key,
    required this.controller,
    required this.onProductsFiltered,
  });

  final TextEditingController controller;
  final ValueChanged<List<ProductModel>> onProductsFiltered;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return Skeletonizer(
            enabled: state is ProductLoading,
            child: SearchTextField(
              controller: controller,
              onChanged: (query) => _filterProducts(query, state.products),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  void _filterProducts(String query, List<ProductModel> products) {
    if (query.isEmpty) {
      onProductsFiltered([]);
    } else {
      final filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      onProductsFiltered(filteredProducts);
    }
  }
}
