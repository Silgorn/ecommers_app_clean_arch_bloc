import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {
  final String sortBy;
  final String categoryName;
  final bool isInCategory;
  const GetProductsEvent(this.sortBy, this.categoryName, this.isInCategory);

  @override
  List<Object> get props => [sortBy, categoryName, isInCategory];
}

class SortProductsEvent extends ProductEvent {
  final String sortBy;
  const SortProductsEvent(this.sortBy);
  @override
  List<Object> get props => [sortBy];
}
