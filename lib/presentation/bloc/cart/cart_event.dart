part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddItemCart extends CartEvent {
  final CartModel cartItem;

  const AddItemCart(this.cartItem);
  @override
  List<Object> get props => [cartItem];
}

class RemoveItemCart extends CartEvent {
  final int cartItemId;

  const RemoveItemCart(this.cartItemId);
  @override
  List<Object> get props => [cartItemId];
}

class GetItemsCart extends CartEvent {
  //final List<CartEntity> cartItem;

  const GetItemsCart();
  @override
  List<Object> get props => [];
}
