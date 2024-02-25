import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartEntity extends Equatable {
  final int id;
  final String title;
  late double price;
  final String image;
  late int quantity;

  CartEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
  });

  @override
  List<Object?> get props => [id, title, price, image, quantity];
}
