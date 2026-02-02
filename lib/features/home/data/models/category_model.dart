import 'package:hungry_app/features/home/domain/entity/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.id, required super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(id: data['id'], name: data['name']);
  }
}
