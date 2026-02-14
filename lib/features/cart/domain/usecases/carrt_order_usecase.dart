import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/cart/domain/abstract_repo/cart_repo.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';

class CreateOrderUseCase
    extends BaseUseCase<int, List<CartItemEntity>> {
  final CartRepo cartRepo;

  CreateOrderUseCase({required this.cartRepo});

  @override
  Future<Either<Failure, int>> call(List<CartItemEntity> params) {
    return cartRepo.createOrder(params);
  }
}
