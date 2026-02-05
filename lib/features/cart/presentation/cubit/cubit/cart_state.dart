import 'package:equatable/equatable.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';
import 'package:hungry_app/features/cart/domain/entity/order_summary_entity.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}
//Load Cart Data
class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final List<CartItemEntity> items;
  final double totalPrice;

  const CartSuccessState({
    required this.items,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [items, totalPrice];
}

class CartErrorState extends CartState {
  final String message;

  const CartErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class CartRemovingItemState extends CartState {
  final List<CartItemEntity> items;
  final int itemId;

  const CartRemovingItemState({
    required this.items,
    required this.itemId,
  });

  @override
  List<Object?> get props => [items, itemId];
}


class RemoveItemSuccessState extends CartState {
  final String message;
  const RemoveItemSuccessState(this.message);
  @override
  List<Object?> get props => [message];
}
class RemoveItemErrorState extends CartState {
  final String message;

  const RemoveItemErrorState(this.message);

  @override
  List<Object?> get props => [message];
}


class OrderSummaryState extends CartState {
  final OrderSummaryEntity summary;

  const OrderSummaryState(this.summary);
}
