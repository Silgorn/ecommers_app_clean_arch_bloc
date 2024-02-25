part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {
  // final List<CategoryEntity> categoryList;

  // const CategoryLoading(this.categoryList);

  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categoryList;

  const CategoryLoaded(this.categoryList);

  @override
  List<Object> get props => [categoryList];
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
