import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSortCubit extends Cubit<String> {
  ProductSortCubit() : super('asc');
  String sortBy = '';
  void selectMenuItem(String item) async {
    sortBy = item;
    emit(item);
  }
}
