import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/entities/cart_entity.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  // Creating a new cart if it doesn't exist
  CartEntity cartEntity = CartEntity([]);

  CartCubit() : super(CartInitial());

  void addProduct(ProductModel productModel) {
    // Check if product already exists
    if (cartEntity.isExist(productModel)) {
      // If it exists, increase the count
      CartItemEntity cartItem = cartEntity.getCartItem(productModel);
      cartItem.incrasedCount();
    } else {
      // If it doesn't exist, add a new product with count = 1
      CartItemEntity cartItem = CartItemEntity(productModel: productModel);
      cartEntity.addCartItem(cartItem);
    }

    // Emit event to notify UI of product addition
    emit(CartItemAdded(cartEntity: cartEntity));

    // Reset state to original to allow re-adding
    Future.delayed(Duration(milliseconds: 100), () {
      emit(CartLoaded(cartEntity: cartEntity));
    });
  }

  void removeProduct(ProductModel productModel) {
    if (cartEntity.isExist(productModel)) {
      CartItemEntity cartItem = cartEntity.getCartItem(productModel);
      cartEntity.removeCartItem(cartItem);
      emit(CartItemRemoved(cartEntity: cartEntity));

      // Reset server state to original
      Future.delayed(Duration(milliseconds: 100), () {
        emit(CartLoaded(cartEntity: cartEntity));
      });
    }
  }

  // Method to get current cart
  CartEntity getCart() {
    return cartEntity;
  }
}
