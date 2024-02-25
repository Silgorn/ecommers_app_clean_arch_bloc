import 'package:dartz/dartz.dart';
import 'package:ecommers_app2/core/error/exception.dart';
import 'package:ecommers_app2/core/error/failure.dart';
import 'package:ecommers_app2/core/platform/network_info.dart';
import 'package:ecommers_app2/data/datasources/local/product_local_data_source.dart';
import 'package:ecommers_app2/data/datasources/remote/product_remote_data_source.dart';
import 'package:ecommers_app2/data/models/product/product_model.dart';
import 'package:ecommers_app2/domain/entities/product/product_entity.dart';
import 'package:ecommers_app2/domain/repositories/product/product_repository.dart';
import 'package:ecommers_app2/domain/usecases/products/get_all_products.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts(
      ProductParams params) async {
    return await _getProducts(() {
      return remoteDataSource.getAllProducts(params);
    });
  }

  Future<Either<Failure, List<ProductModel>>> _getProducts(
      Future<List<ProductModel>> Function() getPersons) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await getPersons();
        localDataSource.productToCache(remoteProduct);
        return Right(remoteProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProduct = await localDataSource.getLastProductFromCache();
        return Right(localProduct);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
