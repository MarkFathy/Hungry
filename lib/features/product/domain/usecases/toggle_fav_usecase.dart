import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/product/domain/abstract_repo/abstract_product_repo.dart';

class ToggleFavoriteUseCase extends BaseUseCase<void, int> {
  final ProductRepo productRepo;

  ToggleFavoriteUseCase({required this.productRepo});

  @override
  Future<Either<Failure, void>> call(int productId) {
    return productRepo.toggleFavorite(productId);
  }
}
