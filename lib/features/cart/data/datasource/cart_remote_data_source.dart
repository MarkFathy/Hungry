import 'package:hungry_app/core/network/api_const.dart';
import 'package:hungry_app/core/utils/api_services.dart';
import 'package:hungry_app/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  Future<void> removeItem(int itemId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiServices apiServices;

  CartRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<CartModel> getCart() async {
    final response = await apiServices.get(endPoint: ApiConst.cart);
    return CartModel.fromJson(response['data']);
  }

  @override
  Future<void> removeItem(int itemId) async {
   await apiServices.delete(endPoint: '${ApiConst.removeFromCart}/$itemId');
  }
}
