import 'package:app_template/core/api/api_client.dart';
import 'package:app_template/core/di/service_locator.dart';
import 'package:app_template/core/generated/localizations/codegen_loader.g.dart';
import 'package:app_template/src/features/home/data/repository/home_repository_impl.dart';
import 'package:app_template/src/features/home/domain/repository/home_repository.dart';
import 'package:app_template/src/features/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:app_template/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:app_template/src/features/home/presentation/pages/home_page.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeApiClient extends ApiClient {
  _FakeApiClient() : super(baseUrl: 'https://example.com');

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Map<String, String> data = <String, String>{
      'title': 'Test title',
      'body': 'Test body',
    };

    return Response<T>(
      data: data as T,
      statusCode: 200,
      requestOptions: RequestOptions(path: path),
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    await sl.reset();

    sl
      ..registerSingleton<SharedPreferences>(sharedPreferences)
      ..registerLazySingleton<ApiClient>(_FakeApiClient.new)
      ..registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(apiClient: sl<ApiClient>()),
      )
      ..registerLazySingleton<GetHomeDataUseCase>(
        () => GetHomeDataUseCase(sl<HomeRepository>()),
      )
      ..registerFactory<HomePageBloc>(
        () => HomePageBloc(getHomeDataUseCase: sl<GetHomeDataUseCase>()),
      );
  });

  testWidgets('HomePage builds and shows Scaffold', (tester) async {
    await EasyLocalization.ensureInitialized();

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const <Locale>[Locale('en'), Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: CodegenLoader(),
        child: const MaterialApp(home: HomePage()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });
}
