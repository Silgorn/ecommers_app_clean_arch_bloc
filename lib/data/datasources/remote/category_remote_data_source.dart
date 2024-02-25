import 'dart:convert';

import 'package:ecommers_app2/core/error/exception.dart';
import 'package:ecommers_app2/data/models/category/category_model.dart';
import 'package:http/http.dart' as http;

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;

  CategoryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getCategories() =>
      _getProductFromUrl('https://fakestoreapi.com/products/categories');

  Future<List<CategoryModel>> _getProductFromUrl(String url) async {
    print(url);
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);

      final List<CategoryModel> categories = jsonResponse.map((category) {
        return CategoryModel(name: category.toString());
      }).toList();

      return categories;
    } else {
      throw ServerException();
    }
  }
}
