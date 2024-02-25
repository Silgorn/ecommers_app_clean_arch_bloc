import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommers_app2/core/error/error_message.dart';
import 'package:ecommers_app2/core/usecases/usecase.dart';
import 'package:ecommers_app2/data/models/cart/cart_model.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommers_app2/domain/entities/cart/cart_entity.dart';
import 'package:ecommers_app2/domain/usecases/cart/add_item_to_cart.dart';
import 'package:ecommers_app2/domain/usecases/cart/get_cart_items.dart';
import 'package:ecommers_app2/domain/usecases/cart/remove_item_from_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItems cartItems;
  final AddItemToCart addItemToCart;
  final RemoveItemFromCart removeItemFromCart;

  CartBloc({
    required this.cartItems,
    required this.addItemToCart,
    required this.removeItemFromCart,
  }) : super(CartEmpty()) {
    on<GetItemsCart>(_onGetItemsEvent);
    on<AddItemCart>(_onAddItemCartEvent);
    on<RemoveItemCart>(_onRemoveItemCartEvent);
  }

  FutureOr<void> _onGetItemsEvent(
      GetItemsCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final failureOrCart = await cartItems(NoParams());
    emit(failureOrCart.fold(
        (failure) => CartError(message: mapFailureToMessage(failure)),
        (cart) => cart.isEmpty ? CartEmpty() : CartLoaded(cartItems: cart)));
  }

  FutureOr<void> _onAddItemCartEvent(
      AddItemCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final failureOrCart =
        await addItemToCart(CartAddParams(itemsToAdd: event.cartItem));
    emit(failureOrCart.fold(
        (failure) => CartError(message: mapFailureToMessage(failure)),
        (cart) => CartLoaded(cartItems: cart)));
  }

  FutureOr<void> _onRemoveItemCartEvent(
      RemoveItemCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final failureOrCart = await removeItemFromCart(
        CartRemoveParams(removeItemId: event.cartItemId));
    emit(failureOrCart.fold(
        (failure) => CartError(message: mapFailureToMessage(failure)),
        (cart) => cart.isEmpty ? CartEmpty() : CartLoaded(cartItems: cart)));
  }
}
