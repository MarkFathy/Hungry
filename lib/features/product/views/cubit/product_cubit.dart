import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/entities/product_entity.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/product/domain/entities/topping_and_side_options_entity.dart';
import 'package:hungry_app/features/product/domain/usecases/get_side_options_usecase.dart';
import 'package:hungry_app/features/product/domain/usecases/get_toppings_usecase.dart';
import 'package:hungry_app/features/product/domain/usecases/add_to_cart_usecase.dart';

part 'product_state.dart';



class ProductCubit extends Cubit<ProductState> {
  final GetToppingsUseCase getToppingsUseCase;
  final GetSideOptionsUsecase getSideOptionsUsecase;
  final AddToCartUseCase addToCartUseCase;

  ProductCubit({
    required this.getToppingsUseCase,
    required this.getSideOptionsUsecase,
    required this.addToCartUseCase,
  }) : super(ProductState.initial());

  // Fetch toppings
  Future<void> getToppings() async {
    emit(state.copyWith(isLoadingToppings: true));

    final result = await getToppingsUseCase(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
          isLoadingToppings: false, toppingsError: failure.message)),
      (toppings) =>
          emit(state.copyWith(isLoadingToppings: false, toppings: toppings)),
    );
  }

  // Fetch side options
  Future<void> getSideOptions() async {
    emit(state.copyWith(isLoadingSideOptions: true));

    final result = await getSideOptionsUsecase(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
          isLoadingSideOptions: false, sideOptionsError: failure.message)),
      (sideOptions) =>
          emit(state.copyWith(isLoadingSideOptions: false, sideOptions: sideOptions)),
    );
  }

  // Local selection for toppings
  void addTopping(ToppingAndSideOptionsEntity topping) {
    final updated = List<ToppingAndSideOptionsEntity>.from(state.selectedToppings)
      ..add(topping);
    emit(state.copyWith(selectedToppings: updated));
  }

  void removeTopping(ToppingAndSideOptionsEntity topping) {
    final updated = List<ToppingAndSideOptionsEntity>.from(state.selectedToppings)
      ..remove(topping);
    emit(state.copyWith(selectedToppings: updated));
  }

  // Local selection for side options
  void addSideOption(ToppingAndSideOptionsEntity sideOption) {
    final updated = List<ToppingAndSideOptionsEntity>.from(state.selectedSideOptions)
      ..add(sideOption);
    emit(state.copyWith(selectedSideOptions: updated));
  }

  void removeSideOption(ToppingAndSideOptionsEntity sideOption) {
    final updated = List<ToppingAndSideOptionsEntity>.from(state.selectedSideOptions)
      ..remove(sideOption);
    emit(state.copyWith(selectedSideOptions: updated));
  }

  // Compute total price (toppings: 20, side options: 30)
  double computeTotal(ProductEntity product) {
    final toppingPrice = state.selectedToppings.length * 20;
    final sidePrice = state.selectedSideOptions.length * 30;
    return product.price + toppingPrice + sidePrice;
  }

  // Final add to cart
  Future<void> addToCart(ProductEntity product) async {
  emit(state.copyWith(
    isAddingToCart: true,
    addToCartError: null,
    cartAddedSuccess: false,
  ));

  final result = await addToCartUseCase(
    AddToCartParams(
      productId: product.id,
      toppingIds: state.selectedToppings.map((e) => e.id).toList(),
      sideOptionIds: state.selectedSideOptions.map((e) => e.id).toList(),
    ),
  );

  result.fold(
    (failure) => emit(
      state.copyWith(
        isAddingToCart: false,
        addToCartError: failure.message,
      ),
    ),
    (_) => emit(
      state.copyWith(
        isAddingToCart: false,
        cartAddedSuccess: true,
      ),
    ),
  );
}

}
