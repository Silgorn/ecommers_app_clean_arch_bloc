import 'dart:convert';

import 'package:ecommers_app2/core/error/exception.dart';
import 'package:ecommers_app2/data/models/product/product_model.dart';
import 'package:ecommers_app2/domain/usecases/products/get_all_products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts(ProductParams params);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts(params) {
    if (params.isInCategory == false) {
      return _getProductsFromUrl(
          'https://fakestoreapi.com/products?sort=${params.sortBy}');
    } else {
      return _getProductsFromUrl(
          'https://fakestoreapi.com/products/category/${params.categoryName}?sort=${params.sortBy}');
    }
  }

  Future<List<ProductModel>> _getProductsFromUrl(String url) async {
    debugPrint(url);
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final products = json.decode(response.body);
      return (products as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
