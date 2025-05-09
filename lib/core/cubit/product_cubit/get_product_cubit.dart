import 'dart:math';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/repos/product_repo.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
part 'get_product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  // get all product
  Future<void> getProduct() async {
    emit(ProductLoading());
    final result = await productRepo.getProducts();

    result.fold(
      (failure) {
        emit(ProductFailure(failure.message));
      },
      (products) {
        products.shuffle(Random());
        emit(ProductSuccess(products));
      },
    );
  }
}
