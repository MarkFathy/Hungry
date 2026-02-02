import 'package:hungry_app/features/product/domain/entities/topping_and_side_options_entity.dart';

class CartItemEntity {
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final double price;
  final double spicy;
  final List<ToppingAndSideOptionsEntity> toppings;
  final List<ToppingAndSideOptionsEntity> sideOptions;

  const CartItemEntity({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  CartItemEntity copyWith({
    int? quantity,
  }) {
    return CartItemEntity(
      itemId: itemId,
      productId: productId,
      name: name,
      image: image,
      quantity: quantity ?? this.quantity,
      price: price,
      spicy: spicy,
      toppings: toppings,
      sideOptions:sideOptions
    );
  }
}
