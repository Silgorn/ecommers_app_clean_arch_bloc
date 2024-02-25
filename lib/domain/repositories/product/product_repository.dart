import 'package:dartz/dartz.dart';
import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/domain/entities/product/product_entity.dart';
import 'package:ecommers_app2/domain/usecases/products/get_all_products.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts(
      ProductParams params);
}
