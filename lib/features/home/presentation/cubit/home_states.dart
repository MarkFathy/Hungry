import 'package:equatable/equatable.dart';
import 'package:hungry_app/core/entities/product_entity.dart';
import 'package:hungry_app/core/entities/user_entity.dart';
import 'package:hungry_app/features/home/domain/entity/category.dart';

abstract class HomeStates extends Equatable {
  const HomeStates();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeStates {}

// ===================== Categories =====================
class CategoryLoadingState extends HomeStates {}

class CategorySuccessState extends HomeStates {
  final List<CategoryEntity> categories;
  const CategorySuccessState(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoryFailureState extends HomeStates {
  final String message;
  const CategoryFailureState(this.message);

  @override
  List<Object?> get props => [message];
}

class CategorySelectedState extends HomeStates {
  final int selectedCategoryId;
  const CategorySelectedState(this.selectedCategoryId);

  @override
  List<Object?> get props => [selectedCategoryId];
}

// ===================== User =====================
class UserLoadingState extends HomeStates {}

class UserSuccessState extends HomeStates {
  final UserEntity user;
  const UserSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class UserFailureState extends HomeStates {
  final String message;
  const UserFailureState(this.message);

  @override
  List<Object?> get props => [message];
}

// ===================== Products =====================
class ProductsLoadingState extends HomeStates {}

class ProductsSuccessState extends HomeStates {
  final List<ProductEntity> products;
  const ProductsSuccessState(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductsFailureState extends HomeStates {
  final String message;
  const ProductsFailureState(this.message);

  @override
  List<Object?> get props => [message];
}



class FavoritesLoading extends HomeStates {}

class FavoritesLoaded extends HomeStates {
  final List<ProductEntity> favorites;
  const FavoritesLoaded(this.favorites);

  @override
  List<Object?> get props => [favorites];
}

class FavoritesError extends HomeStates {
  final String message;
  const FavoritesError(this.message);

  @override
  List<Object?> get props => [message];
}


// Optimistic UI update (local only)
class FavoritesUpdated extends HomeStates {
  final List<int> favoriteIds;
  const FavoritesUpdated(this.favoriteIds);

  @override
  List<Object?> get props => [favoriteIds];
}