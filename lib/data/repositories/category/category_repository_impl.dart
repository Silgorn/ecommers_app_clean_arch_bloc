import 'package:dartz/dartz.dart';
import 'package:ecommers_app2/core/error/exception.dart';
import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/core/platform/network_info.dart';
import 'package:ecommers_app2/data/datasources/local/category_local_data_source.dart';
import 'package:ecommers_app2/data/datasources/remote/category_remote_data_source.dart';
import 'package:ecommers_app2/data/models/category/category_model.dart';
import 'package:ecommers_app2/domain/entities/category/category_entity.dart';
import 'package:ecommers_app2/domain/repositories/category/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final CategoryLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    return await _getCategories(() {
      return remoteDataSource.getCategories();
    });
  }

  Future<Either<Failure, List<CategoryModel>>> _getCategories(
      Future<List<CategoryModel>> Function() getCategory) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategory = await getCategory();
        localDataSource.categoryToCache(remoteCategory);
        return Right(remoteCategory);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCategory = await localDataSource.getCategoryFromCache();
        return Right(localCategory);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
