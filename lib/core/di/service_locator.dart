import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_template/core/api/api_client.dart';
import 'package:app_template/src/features/home/data/repository/home_repository_impl.dart';
import 'package:app_template/src/features/home/domain/repository/home_repository.dart';
import 'package:app_template/src/features/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:app_template/src/features/home/presentation/bloc/home_page_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator(SharedPreferences sharedPreferences) async {
  // Core
  sl
    ..registerSingleton<SharedPreferences>(sharedPreferences)
    ..registerLazySingleton<ApiClient>(
      () => ApiClient(
        // Example mock base URL; replace with your real one per environment.
        // Используем dummyjson, который отдаёт тестовые данные без авторизации.
        baseUrl: 'https://dummyjson.com',
      ),
    );

  // Home feature
  sl
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(apiClient: sl<ApiClient>()),
    )
    ..registerLazySingleton<GetHomeDataUseCase>(
      () => GetHomeDataUseCase(sl<HomeRepository>()),
    )
    ..registerFactory<HomePageBloc>(
      () => HomePageBloc(getHomeDataUseCase: sl<GetHomeDataUseCase>()),
    );
}
