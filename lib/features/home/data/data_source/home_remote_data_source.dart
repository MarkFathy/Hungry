import 'package:dio/dio.dart';
import 'package:hungry_app/core/error/dio_exception_handler.dart';
import 'package:hungry_app/core/models/product_model.dart';
import 'package:hungry_app/core/network/api_const.dart';
import 'package:hungry_app/core/utils/api_services.dart';
import 'package:hungry_app/features/home/data/models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<ProductModel>> getAllProducts();

}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices apiServices;
  HomeRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await apiServices.get(endPoint: ApiConst.categories);

      return (response['data'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await apiServices.get(endPoint: ApiConst.products);

      final List productsJson = response['data'];
      return productsJson.map((e) => ProductModel.fromJson(e)).toList();
    } on DioException catch (e) {
            throw DioExceptionHandler.handle(e);

    }
  }
}
