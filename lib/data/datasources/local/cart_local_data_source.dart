import 'dart:convert';

import 'package:ecommers_app2/data/models/cart/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartLocalDataSource {
  Future<List<CartModel>> getCartItems();

  Future<void> addItems(CartModel item);
  Future<void> removeItems(int removeItemId);
}

const cartItemsList = 'CART_ITEMS_LIST';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SharedPreferences sharedPreferences;

  CartLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CartModel>> getCartItems() async {
    final jsonCartItemsList = sharedPreferences.getStringList(cartItemsList);
    if (jsonCartItemsList != null && jsonCartItemsList.isNotEmpty) {
      return jsonCartItemsList
          .map((cartItems) => CartModel.fromJson(json.decode(cartItems)))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> addItems(CartModel cartItem) async {
    late List<String> jsonCartItemsList =
        sharedPreferences.getStringList(cartItemsList) ?? [];

    final cartItems = jsonCartItemsList
        .map((jsonString) => CartModel.fromJson(json.decode(jsonString)))
        .toList();

    final existingItemIndex =
        cartItems.indexWhere((item) => item.id == cartItem.id);

    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity++;
      cartItems[existingItemIndex].price += cartItem.price;
    } else {
      cartItems.add(cartItem);
    }

    jsonCartItemsList =
        cartItems.map((cartItem) => json.encode(cartItem.toJson())).toList();

    await sharedPreferences.setStringList(cartItemsList, jsonCartItemsList);
    debugPrint('Cart items written to Cache: ${jsonCartItemsList.length}');
  }

  @override
  Future<void> removeItems(int removeItemId) async {
    final jsonCartItemsList = sharedPreferences.getStringList(cartItemsList);

    if (jsonCartItemsList != null && jsonCartItemsList.isNotEmpty) {
      final List<String> updatedJsonCartItemsList =
          jsonCartItemsList.where((jsonCartItem) {
        final cartItem = CartModel.fromJson(json.decode(jsonCartItem));
        return cartItem.id != removeItemId;
      }).toList();

      await sharedPreferences.setStringList(
          cartItemsList, updatedJsonCartItemsList);
    }
  }
}
