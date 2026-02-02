import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/entities/product_entity.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/product/domain/entities/topping_and_side_options_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getFavorites();
  Future<Either<Failure, void>> toggleFavorite(int productId);
  Future<Either<Failure, List<ToppingAndSideOptionsEntity>>> getToppings();
  Future<Either<Failure, List<ToppingAndSideOptionsEntity>>> getSideOptions();
  Future<Either<Failure,void>> addToCart({
    required int productId,
    required List<int> toppingIds,
    required List<int> sideOptionIds,
  });
}
