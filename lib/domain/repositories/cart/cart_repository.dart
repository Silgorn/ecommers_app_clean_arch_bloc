import 'package:dartz/dartz.dart';
import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/data/models/cart/cart_model.dart';
import 'package:ecommers_app2/domain/entities/cart/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getCartItems();
  Future<Either<Failure, List<CartEntity>>> addItemToCart(CartModel itemsToAdd);
  Future<Either<Failure, List<CartEntity>>> removeItemFromCart(
      int removeItemId);
}
