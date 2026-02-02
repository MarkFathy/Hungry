import '../../../core/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.price,
    required super.rating,
    required super.isFavorite,

  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: double.tryParse(json['price'].toString()) ?? 0,
      rating: double.tryParse(json['rating'].toString()) ?? 0,
      isFavorite: json['is_favorite'] == true
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'price': price,
        'rating': rating,
        'is_favorite':isFavorite
      };
}
