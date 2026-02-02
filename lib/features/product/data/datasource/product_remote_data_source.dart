import 'package:dio/dio.dart';
import 'package:hungry_app/core/error/dio_exception_handler.dart';
import 'package:hungry_app/core/models/product_model.dart';
import 'package:hungry_app/core/network/api_const.dart';
import 'package:hungry_app/core/utils/api_services.dart';
import 'package:hungry_app/features/product/data/models/toppings_and_side_options_model.dart';

abstract class ProductRemoteDataSource {
  Future<void> toggleFavorite(int productId);
  Future<List<ProductModel>> getFavorites();
  Future<List<ToppingAndSideOptionsModel>> getToppings();
  Future<List<ToppingAndSideOptionsModel>> getSideOptions();
  Future<void> addToCart({
    required int productId,
    required List<int> toppingIds,
    required List<int> sideOptionIds,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiServices apiServices;

  ProductRemoteDataSourceImpl({required this.apiServices});

  @override
  getFavorites() async {
    try {
      final response = await apiServices.get(endPoint: ApiConst.favorites);

      final List favoritesJson = response['data'];

      return favoritesJson.map((e) => ProductModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  @override
  Future<void> toggleFavorite(int productId) async {
    try {
      await apiServices.post(
        endPoint: ApiConst.toggleFav,
        data: {"product_id": productId},
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  @override
  Future<List<ToppingAndSideOptionsModel>> getToppings() async {
    try {
      final response = await apiServices.get(endPoint: ApiConst.toppings);
      return List<ToppingAndSideOptionsModel>.from(
        response['data'].map((e) => ToppingAndSideOptionsModel.fromJson(e)),
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  @override
  Future<List<ToppingAndSideOptionsModel>> getSideOptions() async {
    try {
      final response = await apiServices.get(endPoint: ApiConst.sideOptions);
      return List<ToppingAndSideOptionsModel>.from(
        response['data'].map((e) => ToppingAndSideOptionsModel.fromJson(e)),
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  @override
  Future<void> addToCart({
    required int productId,
    required List<int> toppingIds,
    required List<int> sideOptionIds,
  }) async {
    try {
      await apiServices.post(
        endPoint: ApiConst.addToCart,
        data: {
          "items": [
            {
              "product_id": productId,
              "quantity": 1,
              "spicy": 0.1,
              "toppings": toppingIds,
              "side_options": sideOptionIds,
            },
          ],
        },
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }
}
