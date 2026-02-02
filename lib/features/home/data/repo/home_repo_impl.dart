import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/entities/product_entity.dart';
import 'package:hungry_app/core/error/exceptions.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:hungry_app/features/home/domain/abstract_repo/abstract_home_repo.dart';
import 'package:hungry_app/features/home/domain/entity/category.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final result = await homeRemoteDataSource.getAllCategories();
      return Right(result);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

 @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final products = await homeRemoteDataSource.getAllProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
