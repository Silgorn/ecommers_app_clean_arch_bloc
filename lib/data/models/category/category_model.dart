import 'package:ecommers_app2/domain/entities/category/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({required name}) : super(name: name);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
