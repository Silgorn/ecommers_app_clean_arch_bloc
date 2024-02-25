import 'package:ecommers_app2/domain/entities/product/product_entity.dart';

class RatingModel extends RatingEntity {
  RatingModel({rate, count}) : super(rate: rate, count: count);

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
    rate: json['rate'] is int ? (json['rate'] as int).toDouble() : json['rate'],
    count: json['count'] as int,
  );

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}
