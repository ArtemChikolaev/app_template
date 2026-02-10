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
  "hello_world": "Добро пожаловать в шаблон приложения!",
  "feature_template_page_title": "Шаблон страницы",
  "feature_template_page_description": "Это страница шаблона",
  "home_from_repository": "Главная страница из репозитория",
  "this_text_comes_from_the_domain_data_layers": "Этот текст приходит из слоев домена/данных."
};
static const Map<String,dynamic> _en = {
  "app_name": "App Template",
  "home_page_title": "Home Page",
  "hello_world": "Welcome to the app template!",
  "feature_template_page_title": "Feature Template Page",
  "feature_template_page_description": "This is the feature template page",
  "home_from_repository": "Home from repository",
  "this_text_comes_from_the_domain_data_layers": "This text comes from the domain/data layers."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": _ru, "en": _en};
}
