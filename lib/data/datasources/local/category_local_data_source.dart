import 'dart:convert';

import 'package:ecommers_app2/core/error/exception.dart';
import 'package:ecommers_app2/data/models/category/category_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCategoryFromCache();

  Future<void> categoryToCache(List<CategoryModel> persons);
}

const cachedCategoryList = 'CACHED_CATEGORY_LIST';

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final SharedPreferences sharedPreferences;

  CategoryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CategoryModel>> getCategoryFromCache() {
    final jsonCategoryList =
        sharedPreferences.getStringList(cachedCategoryList);

    if (jsonCategoryList!.isNotEmpty) {
      return Future.value(jsonCategoryList
          .map((category) => CategoryModel.fromJson(json.decode(category)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> categoryToCache(List<CategoryModel> categories) {
    final List<String> jsonCategoryList =
        categories.map((category) => json.encode(category.toJson())).toList();

    sharedPreferences.setStringList(cachedCategoryList, jsonCategoryList);
    debugPrint('Category to write Cache: ${jsonCategoryList.length}');
    return Future.value(jsonCategoryList);
  }
}
