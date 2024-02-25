import 'package:dartz/dartz.dart';
import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/domain/entities/category/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}
