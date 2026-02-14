import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';

class CreateOrderRequestModel {
  final List<CartItemEntity> items;

  CreateOrderRequestModel(this.items);

  Map<String, dynamic> toJson() {
    return {
      "items": items.map((e) => {
        "product_id": e.productId,
        "quantity": e.quantity,
        "spicy": e.spicy,
        "toppings": e.toppings.map((t) => t.id).toList(),
        "side_options": e.sideOptions.map((s) => s.id).toList(),
      }).toList(),
    };
  }
}
