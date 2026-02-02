import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/entities/product_entity.dart';
import 'package:hungry_app/core/entities/user_entity.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/home/domain/entity/category.dart';
import 'package:hungry_app/features/home/domain/usecases/get_all_categories_usecase.dart';
import 'package:hungry_app/features/home/domain/usecases/get_all_products_usecase.dart';
import 'package:hungry_app/features/home/domain/usecases/get_current_user_usecase.dart';
import 'package:hungry_app/features/product/domain/usecases/get_favourites_usecase.dart';
import 'package:hungry_app/features/product/domain/usecases/toggle_fav_usecase.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetAllCategoriesUsecase getAllCategoriesUsecase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final GetAllProductsUsecase getAllProductsUsecase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;


  HomeCubit({
    required this.getAllProductsUsecase,
    required this.getCurrentUserUseCase,
    required this.getAllCategoriesUsecase,
    required this.getFavoritesUseCase,
    required this.toggleFavoriteUseCase,
  }) : super(HomeInitial());

  // Controllers
  final TextEditingController searchController = TextEditingController();

  // User
  UserEntity? currentUser;

  // Categories
  List<CategoryEntity> categories = [];
  int selectedCategoryId = -1; // All

  // Products
  List<ProductEntity> products = [];
  List<ProductEntity> filteredProducts = [];

  // Search
  String searchQuery = "";

  // ===================== Load User =====================
  Future<void> loadUser() async {
    emit(UserLoadingState());
    final result = await getCurrentUserUseCase(NoParams());

    result.fold(
      (failure) {
        currentUser = null;
        emit(UserFailureState(failure.message));
      },
      (user) {
        currentUser = user;
        emit(UserSuccessState(user));
      },
    );
  }

  // ===================== Load Categories =====================
  Future<void> loadCategories() async {
    emit(CategoryLoadingState());
    final result = await getAllCategoriesUsecase(NoParams());

    result.fold(
      (failure) => emit(CategoryFailureState(failure.message)),
      (cats) {
        categories = [
          const CategoryEntity(id: -1, name: "All"),
          ...cats,
        ];
        emit(CategorySuccessState(categories));
      },
    );
  }

  // ===================== Load Products =====================
  Future<void> loadProducts() async {
    emit(ProductsLoadingState());
    final result = await getAllProductsUsecase(NoParams());

    result.fold(
      (failure) => emit(ProductsFailureState(failure.message)),
      (prods) {
        products = prods;
        filteredProducts = List.from(products);
        emit(ProductsSuccessState(filteredProducts));
      },
    );
  }

  // ===================== Category Select (UI Only) =====================
  void selectCategory(int categoryId) {
    selectedCategoryId = categoryId;

    // ⚠️ API products مفيهوش categoryId
    // فمش هنفلتر المنتجات هنا، بس هنغير اللون فقط
    emit(CategorySelectedState(categoryId));
  }

  // ===================== Search Filter =====================
  void onSearchChanged(String value) {
    searchQuery = value.trim().toLowerCase();

    filteredProducts = products.where((p) {
      return p.name.toLowerCase().contains(searchQuery);
    }).toList();

    emit(ProductsSuccessState(filteredProducts));
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }





//Favourites
  
void loadFavorites() async {
    final result = await getFavoritesUseCase(NoParams());
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (favorites) {
        favoriteIds = favorites.map((e) => e.id).toSet();
        emit(FavoritesLoaded(favorites));
      },
    );
  }
  Future<void> toggleFavorite(int productId) async {
  final result = await toggleFavoriteUseCase(productId);

  result.fold(
    (failure) => emit(FavoritesError(failure.message)),
    (_) async {
      // ✅ update local products UI instantly
      products = products.map((p) {
        if (p.id == productId) {
          return p.copyWith(isFavorite: !p.isFavorite);
        }
        return p;
      }).toList();

      filteredProducts = filteredProducts.map((p) {
        if (p.id == productId) {
          return p.copyWith(isFavorite: !p.isFavorite);
        }
        return p;
      }).toList();

      emit(ProductsSuccessState(filteredProducts));

    
    },
  );
}
  Set<int> favoriteIds = {};

 void toggleFavoriteLocal(int productId) {
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);
    }
    emit(FavoritesUpdated(favoriteIds.toList()));

    // Call API in background (don’t block UI)
    toggleFavoriteUseCase(productId);
  }

  bool isFavorite(int productId) {
    return favoriteIds.contains(productId);
  }
}


