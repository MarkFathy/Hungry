import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/product/domain/abstract_repo/abstract_product_repo.dart';
import 'package:hungry_app/features/product/domain/entities/topping_and_side_options_entity.dart';

class GetToppingsUseCase
    extends BaseUseCase<List<ToppingAndSideOptionsEntity>, NoParams> {
  final ProductRepo productRepo;

  GetToppingsUseCase({required this.productRepo});

  @override
  Future<Either<Failure, List<ToppingAndSideOptionsEntity>>> call(
    NoParams params,
  ) {
    return productRepo.getToppings();
  }
}
