import 'package:bloc/bloc.dart';
import 'package:ecommers_app2/core/error/error_message.dart';
import 'package:ecommers_app2/domain/entities/category/category_entity.dart';
import 'package:ecommers_app2/domain/usecases/categories/get_all_categories.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetAllCategories getAllCategories;

  CategoryCubit({required this.getAllCategories}) : super(CategoryInitial());

  bool isInCategory = false;
  String categoryName = '';

  void loadCategories() async {
    emit(CategoryLoading());
    final failureOrProducts = await getAllCategories(const CategoryParams());
    emit(failureOrProducts.fold(
        (failure) => CategoryError(message: mapFailureToMessage(failure)),
        (products) => CategoryLoaded(products)));
  }
}
