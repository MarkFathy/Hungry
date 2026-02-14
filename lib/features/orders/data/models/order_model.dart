import 'package:hungry_app/features/orders/domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.status,
    required super.totalPrice,
    required super.createdAt,
    required super.productImage,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      status: json['status'],
      totalPrice: json['total_price'],
      createdAt: json['created_at'],
      productImage: json['product_image'],
    );
  }
}
