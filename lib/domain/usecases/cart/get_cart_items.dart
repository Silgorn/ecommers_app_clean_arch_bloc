import 'package:dartz/dartz.dart';
import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/core/usecases/usecase.dart';
import 'package:ecommers_app2/domain/entities/cart/cart_entity.dart';
import 'package:ecommers_app2/domain/repositories/cart/cart_repository.dart';

class GetCartItems extends UseCase<List<CartEntity>, NoParams> {
  final CartRepository cartRepository;

  GetCartItems(this.cartRepository);

  @override
  Future<Either<Failure, List<CartEntity>>> call(NoParams params) async {
    return await cartRepository.getCartItems();
  }
}
