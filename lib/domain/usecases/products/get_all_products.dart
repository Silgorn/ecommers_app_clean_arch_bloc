import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/core/usecases/usecase.dart';
import 'package:ecommers_app2/domain/entities/product/product_entity.dart';
import 'package:ecommers_app2/domain/repositories/product/product_repository.dart';

class GetAllProducts extends UseCase<List<ProductEntity>, ProductParams> {
  final ProductRepository productRepository;
  GetAllProducts(this.productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      ProductParams params) async {
    return await productRepository.getAllProducts(params);
  }
}

class ProductParams extends Equatable {
  final String sortBy;
  final String categoryName;
  final bool isInCategory;

  const ProductParams({
    required this.sortBy,
    required this.categoryName,
    required this.isInCategory,
  });

  @override
  List<Object?> get props => [sortBy, categoryName, isInCategory];
}
