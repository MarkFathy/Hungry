import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/cart/domain/abstract_repo/cart_repo.dart';

class RemoveCartItemUseCase extends BaseUseCase<void, int> {
  final CartRepo cartRepo;
  RemoveCartItemUseCase({required this.cartRepo});

  @override
  Future<Either<Failure, void>> call(int itemId) {
    return cartRepo.removeItem(itemId);
  }
}

