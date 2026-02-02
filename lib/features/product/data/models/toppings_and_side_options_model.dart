import 'package:hungry_app/features/product/domain/entities/topping_and_side_options_entity.dart';

class ToppingAndSideOptionsModel extends ToppingAndSideOptionsEntity {
  const ToppingAndSideOptionsModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory ToppingAndSideOptionsModel.fromJson(Map<String, dynamic> json) {
    return ToppingAndSideOptionsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
