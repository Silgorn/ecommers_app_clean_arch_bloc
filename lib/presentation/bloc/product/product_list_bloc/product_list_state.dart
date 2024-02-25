import 'package:ecommers_app2/domain/entities/product/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductEmpty extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  // final List<ProductEntity> oldProductsList;
  // //final bool isFirstFetch;

  // const ProductLoading(this.oldProductsList);

  // @override
  // List<Object?> get props => [oldProductsList];
}

class ProductLoaded extends ProductState {
  final List<ProductEntity> productsList;

  const ProductLoaded(this.productsList);

  @override
  List<Object?> get props => [productsList];
}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object?> get props => [message];
}
