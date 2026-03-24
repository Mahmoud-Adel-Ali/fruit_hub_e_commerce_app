import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../features/cart/domain/entities/cart_entity.dart';
import '../../../features/cart/domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cart = CartEntity(cartItems: []);

  void addItemToCart(CartItemEntity cartItem) {
    cart.addItemToCart(cartItem);
    emit(CartItemAdded());
  }

  void decreaseItemQuantity(CartItemEntity cartItem) {
    cart.decreaseItemQuantity(cartItem);
    emit(CartItemRemoved());
  }

  void removeItemFromCart(CartItemEntity cartItem) {
    cart.removeItemFromCart(cartItem);
    emit(CartItemRemoved());
  }

  void clearCart() {
    cart = CartEntity(cartItems: []);
    emit(CartItemRemoved());
  }
}
