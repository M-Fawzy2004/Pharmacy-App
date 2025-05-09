import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/errors/failures.dart';
import 'package:pharmacy_app/core/repos/product_repo.dart';
import 'package:pharmacy_app/core/services/constant_path.dart';
import 'package:pharmacy_app/core/services/data_base_supabase.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';

class ProductRepoImpl extends ProductRepo {
  final DataBaseSupabase dataBaseSupabase;

  ProductRepoImpl(this.dataBaseSupabase);

  // get all products
  @override
  Future<Either<Failures, List<ProductModel>>> getProducts() async {
    try {
      var data = await dataBaseSupabase.getDataSupbase(
        path: ConstantPath.kProduct,
      ) as List<Map<String, dynamic>>;

      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductModel> productEntity =
          products.map((e) => e.toEntity()).toList();
      return right(productEntity);
    } catch (e) {
      return left(
        ServerFailure(
          message: 'There is a problem, please try again later.',
        ),
      );
    }
  }
  
  // get category products
  @override
  Future<Either<Failures, List<ProductModel>>> getCategoryProducts() {
    // TODO: implement getCategoryProducts
    throw UnimplementedError();
  }
}
