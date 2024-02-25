import 'package:dartz/dartz.dart';
import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/core/usecases/usecase.dart';
import 'package:ecommers_app2/domain/entities/cart/cart_entity.dart';
import 'package:ecommers_app2/domain/repositories/cart/cart_repository.dart';
import 'package:equatable/equatable.dart';

class RemoveItemFromCart extends UseCase<List<CartEntity>, CartRemoveParams> {
  final CartRepository cartRepository;

  RemoveItemFromCart(this.cartRepository);

  @override
  Future<Either<Failure, List<CartEntity>>> call(
      CartRemoveParams params) async {
    return await cartRepository.removeItemFromCart(params.removeItemId);
  }
}

class CartRemoveParams extends Equatable {
  final int removeItemId;

  const CartRemoveParams({required this.removeItemId});
  @override
  List<Object?> get props => [removeItemId];
}
