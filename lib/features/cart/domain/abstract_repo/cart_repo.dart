import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, void>> removeItem(int itemId);
  
}
