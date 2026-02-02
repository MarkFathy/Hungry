import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/entities/product_entity.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/home/domain/entity/category.dart';

abstract class HomeRepo
{ 
  Future<Either<Failure,List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();


}