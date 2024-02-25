part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartEmpty extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartEntity> cartItems;

  const CartLoaded({required this.cartItems});

  @override
  List<Object> get props => [cartItems];
}

class CartError extends CartState {
  final String message;

  const CartError({required this.message});

  @override
  List<Object> get props => [message];
}
