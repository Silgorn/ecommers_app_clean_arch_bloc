// ignore_for_file: must_be_immutable

import 'package:ecommers_app2/domain/entities/cart/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required id,
    required title,
    required price,
    required image,
    quantity = 1,
  }) : super(
          id: id,
          title: title,
          price: price,
          image: image,
          quantity: quantity,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }
}
