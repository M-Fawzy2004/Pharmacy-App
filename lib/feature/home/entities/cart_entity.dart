import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  removeCartItem(CartItemEntity cartItem) {
    cartItems.remove(cartItem);
  }

  calculateTotalPrice() {
    num totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isExist(ProductModel productModel) {
    for (var cartItem in cartItems) {
      if (cartItem.productModel == productModel) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductModel productModel) {
    for (var cartItem in cartItems) {
      if (cartItem.productModel == productModel) {
        return cartItem;
      }
    }
    return CartItemEntity(
      productModel: productModel,
      count: 1,
    );
  }

}
