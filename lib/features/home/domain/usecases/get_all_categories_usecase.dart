import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/home/domain/abstract_repo/abstract_home_repo.dart';
import 'package:hungry_app/features/home/domain/entity/category.dart';

class GetAllCategoriesUsecase implements BaseUseCase<List<CategoryEntity>, NoParams> {
  final HomeRepo homeRepo;
  GetAllCategoriesUsecase({required this.homeRepo});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await homeRepo.getAllCategories();
  }
}
