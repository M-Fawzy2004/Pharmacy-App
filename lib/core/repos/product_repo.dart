import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/errors/failures.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';

abstract class ProductRepo {
  // get all products
  Future<Either<Failures, List<ProductModel>>> getProducts();

  // get category products
  Future<Either<Failures, List<ProductModel>>> getCategoryProducts();
}
