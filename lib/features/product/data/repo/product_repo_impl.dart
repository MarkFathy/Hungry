import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/entities/product_entity.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/product/data/datasource/product_remote_data_source.dart';
import 'package:hungry_app/features/product/domain/abstract_repo/abstract_product_repo.dart';
import 'package:hungry_app/features/product/domain/entities/topping_and_side_options_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    try {
      final result = await productRemoteDataSource.getFavorites();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavorite(int productId) async {
    try {
      await productRemoteDataSource.toggleFavorite(productId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ToppingAndSideOptionsEntity>>>
  getToppings() async {
    try {
      final result = await productRemoteDataSource.getToppings();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  

  @override
  Future<Either<Failure, List<ToppingAndSideOptionsEntity>>> getSideOptions() async{
      try {
      final result = await productRemoteDataSource.getSideOptions();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

   @override
  Future<Either<Failure, void>> addToCart({
    required int productId,
    required List<int> toppingIds,
    required List<int> sideOptionIds,
  }) async {
    try {
      await productRemoteDataSource.addToCart(
        productId: productId,
        toppingIds: toppingIds,
        sideOptionIds: sideOptionIds,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
}

