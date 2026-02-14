import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/utils/api_services.dart';
import 'package:hungry_app/features/auth/data/data_source/auth_local_datasource.dart';
import 'package:hungry_app/features/auth/data/data_source/auth_remote_datasource.dart';
import 'package:hungry_app/features/auth/data/repo_implementation/auth_repo_impl.dart';
import 'package:hungry_app/features/auth/domain/repo_abstract/auth_repo_abstarct.dart';
import 'package:hungry_app/features/auth/domain/usecases/is_logged_usecase.dart';
import 'package:hungry_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:hungry_app/features/cart/data/datasource/cart_remote_data_source.dart';
import 'package:hungry_app/features/cart/data/repo/cart_repo_impl.dart';
import 'package:hungry_app/features/cart/domain/abstract_repo/cart_repo.dart';
import 'package:hungry_app/features/cart/domain/usecases/carrt_order_usecase.dart';
import 'package:hungry_app/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:hungry_app/features/cart/domain/usecases/order_summary_usecase.dart';
import 'package:hungry_app/features/cart/domain/usecases/remove_item_usecase.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:hungry_app/features/product/data/datasource/product_remote_data_source.dart';
import 'package:hungry_app/features/product/data/repo/product_repo_impl.dart';
import 'package:hungry_app/features/product/domain/abstract_repo/abstract_product_repo.dart';
import 'package:hungry_app/features/product/domain/usecases/get_favourites_usecase.dart';
import 'package:hungry_app/features/product/domain/usecases/get_side_options_usecase.dart';
import 'package:hungry_app/features/product/domain/usecases/get_toppings_usecase.dart';
import 'package:hungry_app/features/product/domain/usecases/toggle_fav_usecase.dart';
import 'package:hungry_app/features/product/domain/usecases/add_to_cart_usecase.dart';
import 'package:hungry_app/features/product/views/cubit/product_cubit.dart';
import 'package:hungry_app/features/profile/domain/usecases/logout_usecase.dart';
import 'package:hungry_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:hungry_app/features/home/data/repo/home_repo_impl.dart';
import 'package:hungry_app/features/home/domain/abstract_repo/abstract_home_repo.dart';
import 'package:hungry_app/features/home/domain/usecases/get_all_categories_usecase.dart';
import 'package:hungry_app/features/home/domain/usecases/get_all_products_usecase.dart';
import 'package:hungry_app/features/home/domain/usecases/get_current_user_usecase.dart';
import 'package:hungry_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:hungry_app/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:hungry_app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:hungry_app/features/profile/domain/abstract_repo/profile_repo.dart';
import 'package:hungry_app/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:hungry_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:hungry_app/features/profile/presentation/cubit/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! ================= Core =================
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiServices>(
    () => ApiServices(
      sl<Dio>(),
      sl<AuthLocalDatasource>(), // هنا بنمرر الـ local datasource
    ),
  );
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  //! ================= Cubit =================
  sl.registerFactory(
    () => AuthCubit(loginUseCase: sl(), registerUsecase: sl()),
  );
  sl.registerFactory(
    () => HomeCubit(
      getAllCategoriesUsecase: sl(),
      getCurrentUserUseCase: sl(),
      getAllProductsUsecase: sl(),
      getFavoritesUseCase: sl(),
      toggleFavoriteUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => ProfileCubit(
      getProfileUseCase: sl(),
      updateProfileUseCase: sl(),
      logoutUsecase: sl(),
    ),
  );

  sl.registerFactory(
    () => ProductCubit(
      getToppingsUseCase: sl(),
      getSideOptionsUsecase: sl(),
      addToCartUseCase: sl(),
    ),
  );

  sl.registerFactory(() => CartCubit(
    getCartUseCase: sl(),
    removeCartItemUseCase: sl(),
    calculateOrderSummaryUseCase: sl(),
    createOrderUseCase: sl()
    ));
  //! ================= UseCases =================
  sl.registerLazySingleton(() => LoginUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => RegisterUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => LogoutUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => IsLoggedInUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(authRepo: sl()));
  sl.registerLazySingleton(() => GetAllProductsUsecase(homeRepo: sl()));
  sl.registerLazySingleton(() => GetAllCategoriesUsecase(homeRepo: sl()));
  sl.registerLazySingleton(() => GetProfileUseCase(profileRepo: sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(profileRepo: sl()));
  sl.registerLazySingleton(() => GetFavoritesUseCase(productRepo: sl()));
  sl.registerLazySingleton(() => ToggleFavoriteUseCase(productRepo: sl()));
  sl.registerLazySingleton(() => GetToppingsUseCase(productRepo: sl()));
  sl.registerLazySingleton(() => GetSideOptionsUsecase(productRepo: sl()));
  sl.registerLazySingleton(() => AddToCartUseCase(productRepo: sl()));
  sl.registerLazySingleton(() => GetCartUseCase(cartRepo: sl()));
  sl.registerLazySingleton(() => RemoveCartItemUseCase(cartRepo: sl()));
  sl.registerLazySingleton(() => CalculateOrderSummaryUseCase());
  sl.registerLazySingleton(() => CreateOrderUseCase(cartRepo: sl()));


  //! ================= Repository =================
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDatasource: sl(), authLocalDatasource: sl()),
  );
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(profileRemoteDataSource: sl()),
  );

  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(productRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(cartRemoteDataSource: sl()),
  );

  //! ================= Data Sources =================
  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDataSourceImpl(apiServices: sl()),
  );

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiServices: sl()),
  );

  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(apiServices: sl()),
  );

  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(apiServices: sl()),
  );
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(apiServices: sl()),
  );
}
