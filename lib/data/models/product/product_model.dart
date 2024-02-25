import 'package:ecommers_app2/data/models/product/product_rating_model.dart';
import 'package:ecommers_app2/domain/entities/product/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required id,
      required title,
      required price,
      required description,
      required category,
      required image,
      required rating})
      : super(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category,
            image: image,
            rating: rating);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: json['rating'] != null
          ? RatingModel.fromJson(json['rating'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating,
    };
  }
}
