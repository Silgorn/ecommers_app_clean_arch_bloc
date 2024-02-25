import 'package:dartz/dartz.dart';
import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/data/datasources/local/cart_local_data_source.dart';
import 'package:ecommers_app2/data/models/cart/cart_model.dart';
import 'package:ecommers_app2/domain/entities/cart/cart_entity.dart';
import 'package:ecommers_app2/domain/repositories/cart/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<CartEntity>>> addItemToCart(
      CartModel itemsToAdd) async {
    try {
      await localDataSource.addItems(itemsToAdd);
      final cartItems = await localDataSource.getCartItems();
      return Right(cartItems);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getCartItems() async {
    try {
      final cartItems = await localDataSource.getCartItems();
      return Right(cartItems);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> removeItemFromCart(
      int removeItemId) async {
    try {
      await localDataSource.removeItems(removeItemId);
      final cartItems = await localDataSource.getCartItems();
      return Right(cartItems);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
