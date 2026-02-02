import 'package:hungry_app/features/cart/data/models/cart_item_model.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.id,
    required super.totalPrice,
    required super.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      totalPrice: json['total_price'] is double
          ? json['total_price']
          : double.parse(json['total_price'].toString()),
      items: (json['items'] as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),
    );
  }
}
