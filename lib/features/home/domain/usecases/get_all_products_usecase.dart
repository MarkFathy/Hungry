import 'package:dartz/dartz.dart';
import 'package:hungry_app/features/home/domain/abstract_repo/abstract_home_repo.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';

class GetAllProductsUsecase implements BaseUseCase<List<ProductEntity>, NoParams> {
  final HomeRepo homeRepo;

  GetAllProductsUsecase({required this.homeRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return homeRepo.getAllProducts();
  }
}
