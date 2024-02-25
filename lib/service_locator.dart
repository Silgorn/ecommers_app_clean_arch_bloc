import 'package:ecommers_app2/core/platform/network_info.dart';
import 'package:ecommers_app2/data/datasources/local/cart_local_data_source.dart';
import 'package:ecommers_app2/data/datasources/local/category_local_data_source.dart';
import 'package:ecommers_app2/data/datasources/local/product_local_data_source.dart';
import 'package:ecommers_app2/data/datasources/remote/category_remote_data_source.dart';
import 'package:ecommers_app2/data/datasources/remote/product_remote_data_source.dart';
import 'package:ecommers_app2/data/repositories/cart/cart_repository_impl.dart';
import 'package:ecommers_app2/data/repositories/category/category_repository_impl.dart';
import 'package:ecommers_app2/data/repositories/product/product_repository_impl.dart';
import 'package:ecommers_app2/domain/repositories/cart/cart_repository.dart';
import 'package:ecommers_app2/domain/repositories/category/category_repository.dart';
import 'package:ecommers_app2/domain/repositories/product/product_repository.dart';
import 'package:ecommers_app2/domain/usecases/cart/add_item_to_cart.dart';
import 'package:ecommers_app2/domain/usecases/cart/get_cart_items.dart';
import 'package:ecommers_app2/domain/usecases/cart/remove_item_from_cart.dart';
import 'package:ecommers_app2/domain/usecases/categories/get_all_categories.dart';
import 'package:ecommers_app2/domain/usecases/products/get_all_products.dart';
import 'package:ecommers_app2/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommers_app2/presentation/bloc/category/category_cubit.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc /Cubit
  sl.registerFactory(
    () => ProductBloc(getAllProducts: sl()),
  );
  sl.registerFactory(
    () => CategoryCubit(getAllCategories: sl()),
  );
  sl.registerFactory(
    () => CartBloc(
        cartItems: sl(), addItemToCart: sl(), removeItemFromCart: sl()),
  );

  //UseCases
  // Products
  sl.registerLazySingleton(
    () => GetAllProducts(sl()),
  );

  // Categories
  sl.registerLazySingleton(
    () => GetAllCategories(sl()),
  );

  // Cart
  sl.registerLazySingleton(
    () => GetCartItems(sl()),
  );
  sl.registerLazySingleton(
    () => AddItemToCart(sl()),
  );
  sl.registerLazySingleton(
    () => RemoveItemFromCart(sl()),
  );

  //Repository

  // Products
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: http.Client()),
  );

  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Cart
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(localDataSource: sl()),
  );

  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(sharedPreferences: sl()),
  );

// Categories
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(client: http.Client()),
  );

  sl.registerLazySingleton<CategoryLocalDataSource>(
      () => CategoryLocalDataSourceImpl(sharedPreferences: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(sl()),
  );

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
