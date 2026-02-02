import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/exceptions.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/cart/data/datasource/cart_remote_data_source.dart';
import 'package:hungry_app/features/cart/domain/abstract_repo/cart_repo.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_entity.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      final result = await cartRemoteDataSource.getCart();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> removeItem(int itemId) async {
    try {
      await cartRemoteDataSource.removeItem(itemId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
