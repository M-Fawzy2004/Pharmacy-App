import 'package:bloc/bloc.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity cartItemEntity) async {
    emit(CartItemUpdate(cartItemEntity));
  }
}
