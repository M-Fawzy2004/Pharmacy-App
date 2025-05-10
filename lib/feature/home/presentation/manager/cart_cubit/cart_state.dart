part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final CartEntity cartEntity;
  CartLoaded({required this.cartEntity});
}

class CartItemAdded extends CartState {
  final CartEntity cartEntity;
  CartItemAdded({required this.cartEntity});
}

class CartItemRemoved extends CartState {
  final CartEntity cartEntity;
  CartItemRemoved({required this.cartEntity});
}
