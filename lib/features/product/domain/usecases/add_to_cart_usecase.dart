import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import '../abstract_repo/abstract_product_repo.dart';

class AddToCartUseCase extends BaseUseCase<void, AddToCartParams> {
  final ProductRepo productRepo;

  AddToCartUseCase({required this.productRepo});

  @override
  Future<Either<Failure, void>> call(AddToCartParams params) async {
    return await productRepo.addToCart(
      productId: params.productId,
      toppingIds: params.toppingIds,
      sideOptionIds: params.sideOptionIds,
    );
  }
}

class AddToCartParams {
  final int productId;
  final List<int> toppingIds;
  final List<int> sideOptionIds;

  AddToCartParams({
    required this.productId,
    required this.toppingIds,
    required this.sideOptionIds,
  });
}
