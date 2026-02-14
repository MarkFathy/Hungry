import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';
import 'package:hungry_app/features/orders/domain/entity/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, int>> createOrder(List<CartItemEntity> items);
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, OrderEntity>> getOrderById(int id);
}
