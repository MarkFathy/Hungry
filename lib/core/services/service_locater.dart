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
import 'package:hungry_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:hungry_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! ================= Core =================
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiServices>(() => ApiServices(sl()));
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  //! ================= Cubit =================
  sl.registerFactory(() => AuthCubit(loginUseCase: sl(),registerUsecase: sl()));

  //! ================= UseCases =================
  sl.registerLazySingleton(() => LoginUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => RegisterUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => LogoutUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => IsLoggedInUsecase(authRepo: sl()));


  //! ================= Repository =================
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        authRemoteDatasource: sl(),
        authLocalDatasource: sl(),
      ));
      
  //! ================= Data Sources =================
  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDataSourceImpl(apiServices: sl()),
  );
}
