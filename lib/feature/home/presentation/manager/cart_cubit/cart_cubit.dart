import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/entities/cart_entity.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addProduct(ProductModel productModel) {
    bool isProductExist = cartEntity.isExist(productModel);
    var getCartItems = cartEntity.getCartItem(productModel);
    if (isProductExist) {
      getCartItems.incrasedCount();
    } else {
      cartEntity.addCartItem(getCartItems);
    }
    emit(CartItemAdded());
  }

  void removeProduct(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
