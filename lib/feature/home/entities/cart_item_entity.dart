import 'package:equatable/equatable.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductModel productModel;
  int count;

  CartItemEntity({required this.productModel, this.count = 0});

  num calculateTotalPrice() => productModel.price * count;
  num calculateTotalWeight() => productModel.amountItem * count;
  incrasedCount() => count++;
  decreasedCount() => count--;

  @override
  List<Object?> get props => [productModel];
}
