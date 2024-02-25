import 'package:dartz/dartz.dart';
import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/core/usecases/usecase.dart';
import 'package:ecommers_app2/domain/entities/category/category_entity.dart';
import 'package:ecommers_app2/domain/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';

class GetAllCategories extends UseCase<List<CategoryEntity>, CategoryParams> {
  final CategoryRepository categoryRepository;
  GetAllCategories(this.categoryRepository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(
      CategoryParams params) async {
    return await categoryRepository.getAllCategories();
  }
}

class CategoryParams extends Equatable {
  const CategoryParams();

  @override
  List<Object?> get props => [];
}
