import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';
import 'package:hungry_app/features/product/data/models/toppings_and_side_options_model.dart';


class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.itemId,
    required super.productId,
    required super.name,
    required super.image,
    required super.quantity,
    required super.price,
    required super.spicy,
    required super.toppings,
    required super.sideOptions,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['item_id'],
      productId: json['product_id'],
      name: json['name'],
      image: json['image'],
      quantity: json['quantity'] is int
          ? json['quantity']
          : int.parse(json['quantity'].toString()),
      price: json['price'] is double
          ? json['price']
          : double.parse(json['price'].toString()),
      spicy: json['spicy'] is double
          ? json['spicy']
          : double.parse(json['spicy'].toString()),
      toppings: (json['toppings'] as List)
          .map((e) => ToppingAndSideOptionsModel.fromJson(e))
          .toList(),
      sideOptions: (json['side_options'] as List)
          .map((e) => ToppingAndSideOptionsModel.fromJson(e))
          .toList(),
    );
  }
}
