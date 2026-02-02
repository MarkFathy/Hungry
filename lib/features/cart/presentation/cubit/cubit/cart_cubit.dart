import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';
import 'package:hungry_app/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:hungry_app/features/cart/domain/usecases/remove_item_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;

  CartCubit({required this.removeCartItemUseCase,required this.getCartUseCase}) : super(CartInitial());

Future<void> loadCart() async {
    emit(CartLoadingState());
    final result = await getCartUseCase(NoParams()  );
    result.fold(
      (failure) => emit(CartErrorState(failure.message)),
      (cart) => emit(CartSuccessState(items: cart.items, totalPrice: cart.totalPrice)),
    );
  }


Future<void> removeItem(int itemId) async {
  final currentState = state;

  if (currentState is CartSuccessState) {
    // 1️⃣ loader على العنصر فقط + نحتفظ بالـ items
    emit(
      CartRemovingItemState(
        items: currentState.items,
        itemId: itemId,
      ),
    );

    final result = await removeCartItemUseCase(itemId);

    result.fold(
      (failure) {
        emit(CartErrorState(failure.message));
        emit(currentState); // رجوع آمن
      },
      (_) {
        final updatedItems = currentState.items
            .where((item) => item.itemId != itemId)
            .toList();

        emit(
          CartSuccessState(
            items: updatedItems,
            totalPrice: calculateTotal(updatedItems),
          ),
        );
      },
    );
  }
}

double calculateTotal(List<CartItemEntity> items) {
  return items.fold(
    0.0,
    (sum, item) => sum + (item.price * item.quantity),
  );
}

}



 

