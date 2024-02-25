import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommers_app2/core/error/error_message.dart';
import 'package:ecommers_app2/domain/usecases/products/get_all_products.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_event.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;
  ProductBloc({required this.getAllProducts}) : super(ProductEmpty()) {
    on<GetProductsEvent>(_getProducts);
  }

  FutureOr<void> _getProducts(
      GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    final failureOrProducts = await getAllProducts(ProductParams(
      sortBy: event.sortBy,
      categoryName: event.categoryName,
      isInCategory: event.isInCategory,
    ));
    emit(failureOrProducts.fold(
        (failure) => ProductError(message: mapFailureToMessage(failure)),
        (products) => ProductLoaded(products)));
  }
}
