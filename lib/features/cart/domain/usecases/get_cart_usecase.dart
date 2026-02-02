import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/cart/domain/abstract_repo/cart_repo.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_entity.dart';

class GetCartUseCase extends BaseUseCase<CartEntity, NoParams> {
  final CartRepo cartRepo;

  GetCartUseCase({required this.cartRepo});

  @override
  Future<Either<Failure, CartEntity>> call(NoParams params) {
    return cartRepo.getCart();
  }
}
