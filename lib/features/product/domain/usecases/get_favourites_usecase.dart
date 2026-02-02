import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/entities/product_entity.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/product/domain/abstract_repo/abstract_product_repo.dart';

class GetFavoritesUseCase extends BaseUseCase<List<ProductEntity>, NoParams> {
  final ProductRepo productRepo;

  GetFavoritesUseCase({required this.productRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return productRepo.getFavorites();
  }
}
