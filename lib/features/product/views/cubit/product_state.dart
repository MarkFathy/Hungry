part of 'product_cubit.dart';

class ProductState extends Equatable {
  final bool isLoadingToppings;
  final bool isLoadingSideOptions;
  final List<ToppingAndSideOptionsEntity> toppings;
  final List<ToppingAndSideOptionsEntity> sideOptions;
  final List<ToppingAndSideOptionsEntity> selectedToppings;
  final List<ToppingAndSideOptionsEntity> selectedSideOptions;
  final String? toppingsError;
  final String? sideOptionsError;
  final String? addToCartError;
  final bool cartAddedSuccess;
  final bool isAddingToCart;

  
  

  const ProductState({
    required this.isLoadingToppings,
    required this.isLoadingSideOptions,
    required this.toppings,
    required this.sideOptions,
    required this.selectedToppings,
    required this.selectedSideOptions,
    required this.isAddingToCart,

    this.toppingsError,
    this.sideOptionsError,
    this.addToCartError,
    required this.cartAddedSuccess,
  });

  factory ProductState.initial() => const ProductState(
        isLoadingToppings: false,
        isLoadingSideOptions: false,
        toppings: [],
        sideOptions: [],
        selectedToppings: [],
        selectedSideOptions: [],
        cartAddedSuccess: false,
          isAddingToCart: false,

      );

  ProductState copyWith({
    bool? isLoadingToppings,
    bool? isLoadingSideOptions,
    List<ToppingAndSideOptionsEntity>? toppings,
    List<ToppingAndSideOptionsEntity>? sideOptions,
    List<ToppingAndSideOptionsEntity>? selectedToppings,
    List<ToppingAndSideOptionsEntity>? selectedSideOptions,
    String? toppingsError,
    String? sideOptionsError,
    String? addToCartError,
    bool? cartAddedSuccess,
    bool? isAddingToCart,

  }) {
    return ProductState(
      isLoadingToppings: isLoadingToppings ?? this.isLoadingToppings,
      isLoadingSideOptions: isLoadingSideOptions ?? this.isLoadingSideOptions,
      toppings: toppings ?? this.toppings,
      sideOptions: sideOptions ?? this.sideOptions,
      selectedToppings: selectedToppings ?? this.selectedToppings,
      selectedSideOptions: selectedSideOptions ?? this.selectedSideOptions,
      toppingsError: toppingsError ?? this.toppingsError,
      sideOptionsError: sideOptionsError ?? this.sideOptionsError,
      addToCartError: addToCartError ?? this.addToCartError,
      cartAddedSuccess: cartAddedSuccess ?? this.cartAddedSuccess,
      isAddingToCart: isAddingToCart ?? this.isAddingToCart,

    );
  }

  @override
  List<Object?> get props => [
        isLoadingToppings,
        isLoadingSideOptions,
        toppings,
        sideOptions,
        selectedToppings,
        selectedSideOptions,
        toppingsError,
        sideOptionsError,
        addToCartError,
        cartAddedSuccess,
        isAddingToCart,

      ];
}
