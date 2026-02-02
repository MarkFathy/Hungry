import 'package:equatable/equatable.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';

class CartEntity extends Equatable {
  final int id;
  final double totalPrice;
  final List<CartItemEntity> items;

  const CartEntity({
    required this.id,
    required this.totalPrice,
    required this.items,  
    
  });

  

  @override
  List<Object?> get props => [id, totalPrice, items];
}
