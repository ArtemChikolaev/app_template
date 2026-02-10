// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ru = {
  "app_name": "Шаблон приложения",
  "home_page_title": "Главная страница",
  "hello_world": "Добро пожаловать в шаблон приложения!"
};
static const Map<String,dynamic> _en = {
  "app_name": "App Template",
  "home_page_title": "Home Page",
  "hello_world": "Welcome to the app template!"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": _ru, "en": _en};
}
