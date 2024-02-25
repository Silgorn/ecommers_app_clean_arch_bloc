import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/core/usecases/usecase.dart';
import 'package:ecommers_app2/data/models/cart/cart_model.dart';
import 'package:ecommers_app2/domain/entities/cart/cart_entity.dart';
import 'package:ecommers_app2/domain/repositories/cart/cart_repository.dart';

class AddItemToCart extends UseCase<List<CartEntity>, CartAddParams> {
  final CartRepository cartRepository;

  AddItemToCart(this.cartRepository);

  @override
  Future<Either<Failure, List<CartEntity>>> call(CartAddParams params) async {
    return await cartRepository.addItemToCart(params.itemsToAdd);
  }
}

class CartAddParams extends Equatable {
  final CartModel itemsToAdd;

  const CartAddParams({required this.itemsToAdd});
  @override
  List<Object?> get props => [itemsToAdd];
}
