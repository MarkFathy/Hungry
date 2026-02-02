import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final double rating;
  final double price;
  final bool isFavorite;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
    required this.isFavorite,
  });

  ProductEntity copyWith({
    bool? isFavorite,
  }) {
    return ProductEntity(
      id: id,
      name: name,
      description: description,
      image: image,
      rating: rating,
      price: price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [id, name, description, image, rating, price, isFavorite];
}
