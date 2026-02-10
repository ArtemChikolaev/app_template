import 'package:app_template/app/app_entry_point.dart';
import 'package:app_template/core/di/service_locator.dart';
import 'package:app_template/core/generated/localizations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await setupServiceLocator(sharedPreferences);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: CodegenLoader(),
      saveLocale: false,
      child: const AppEntryPoint(),
    ),
  );
}
