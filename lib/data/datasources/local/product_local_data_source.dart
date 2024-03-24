import 'dart:convert';

import 'package:ecommers_app2/core/error/exception.dart';
import 'package:ecommers_app2/data/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getLastProductFromCache();
  Future<void> productToCache(List<ProductModel> products);
}

const cachedProductsList = 'CACHED_PRODUCTS_LIST';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ProductModel>> getLastProductFromCache() {
    final jsonProductList = sharedPreferences.getStringList(cachedProductsList);

    if (jsonProductList!.isNotEmpty) {
      return Future.value(jsonProductList
          .map((product) => ProductModel.fromJson(json.decode(product)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> productToCache(List<ProductModel> products) {
    final List<String> jsonProductsList =
        products.map((product) => json.encode(product.toJson())).toList();

    sharedPreferences.setStringList(cachedProductsList, jsonProductsList);
    debugPrint('Products to write Cache: ${jsonProductsList.length}');
    return Future.value(jsonProductsList);
  }
}
