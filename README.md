# App Template

Шаблон Flutter-приложения с **чистой архитектурой** (Clean Architecture) и принципами **SOLID**. Предназначен для быстрого старта новых проектов и как обучающий пример разделения на слои domain, data и presentation.

---

## Что это за проект

Это не готовое приложение, а **каркас**: в нём настроены роутинг, темы, локализация, сетевой слой, DI, обработка ошибок и логирование. Фича **Home** реализована полностью (от API до UI) и служит эталоном для добавления новых фич. Фича **Feature Template** — заготовка с той же структурой папок и плейсхолдерами.

---

## Реализовано

### Архитектура

- **Слои по фичам:** `lib/src/features/<feature>/` с подпапками:
  - **domain** — сущности, контракты репозиториев, use cases (без зависимостей от Flutter и data).
  - **data** — реализации репозиториев, работа с API и локальными источниками.
  - **presentation** — Bloc, страницы, виджеты.
- **Core** (`lib/core/`) — инфраструктура без привязки к фичам: API-клиент, ошибки, маппер Dio→Failure, результат, логгер, ассеты, локализация (codegen).
- **App** (`lib/app/`) — точка сборки приложения: DI, роутер, темы, `AppEntryPoint`.
- **Зависимости:** presentation → domain ← data; core не зависит от фич; app собирает фичи через DI и роутер.

### Основные возможности

| Область | Реализация |
|--------|------------|
| **Навигация** | Go Router, именованные маршруты, enum `MobilePages`. |
| **Состояние** | Flutter Bloc + Equatable. |
| **DI** | GetIt: регистрация репозиториев, use cases, Bloc’ов. |
| **Сеть** | `ApiClient`: get/post/put/patch/delete, baseUrl, baseHeaders, опциональная подмена Dio (для тестов/окружений). Логирование тел запросов/ответов только в debug; в релизе — только метод и путь. |
| **Ошибки** | Типы `Failure` (Network, Server, Unknown), `Result<T>`, централизованный `mapDioException()` в `core/errors/dio_error_mapper.dart`. Сообщения — ключи локализации (`errors_network` и др.), UI показывает их через `.tr()`. |
| **Логирование** | `AppLogger` (debug / info / warning / error) в API, репозиториях и Bloc’ах. |
| **Тема** | FlexColorScheme (светлая/тёмная тема). |
| **Локализация** | Easy Localization + codegen ключей. |
| **Ассеты** | FlutterGen (изображения, иконки, шрифты). |
| **Pull-to-refresh** | На Home и Feature Template; на Home — ожидание завершения загрузки по Bloc. |
| **Bloc-конкуррентность** | `bloc_concurrency`: для события загрузки используется `restartable()` — повторный запрос отменяет предыдущий (нет параллельных запросов при частом pull-to-refresh). |

### Фича Home (образцовая)

- **Domain:** `HomeEntity`, `HomeRepository`, `GetHomeDataUseCase`.
- **Data:** `HomeRepositoryImpl` — запрос к [DummyJSON](https://dummyjson.com) `/posts/1`, маппинг ошибок через `mapDioException()`, возврат `Result<HomeEntity>`.
- **Presentation:** `HomePageBloc` (загрузка через use case, `Result.fold`, событие загрузки с трансформером `restartable()`), `HomePage` с отображением loading/success/error (сообщения об ошибках через ключи локализации и `.tr()`) и кнопкой перехода на Feature Template.

### Тесты

- Unit-тест use case: `test/.../get_home_data_use_case_test.dart`.
- Unit-тест Bloc: `test/.../home_page_bloc_test.dart`.
- Widget-тест страницы: `test/.../home_page_test.dart` (DI, FakeApiClient, Easy Localization).

---

## Зависимости

### Основные

| Пакет | Назначение |
|-------|------------|
| `flutter_bloc` | Управление состоянием. |
| `bloc_concurrency` | Трансформеры событий (restartable/droppable и др.) для дедупликации и отмены запросов. |
| `equatable` | Сравнение состояний Bloc. |
| `get_it` | Dependency injection. |
| `dio` | HTTP-клиент. |
| `go_router` | Декларативная маршрутизация. |
| `easy_localization` | Многоязычность и codegen ключей. |
| `flex_color_scheme` | Светлая/тёмная тема. |
| `flutter_gen` | Генерация доступа к ассетам и шрифтам. |
| `flutter_svg` | SVG-изображения. |
| `shared_preferences` | Локальное ключ-значение хранилище. |
| `logger` | Логи (используется через `AppLogger`). |
| `collection` | Утилиты (в т.ч. для роутера). |
| `freezed` | В проекте подключён, можно использовать для моделей. |

### Для разработки

| Пакет | Назначение |
|-------|------------|
| `mocktail` | Моки в тестах. |
| `flutter_lints` | Рекомендуемые линты. |
| `build_runner` | Генерация кода (в т.ч. flutter_gen, easy_localization). |

---

## Старт

### Требования

- Flutter SDK **^3.10.7**
- Dart **^3.10.7**

### Установка и запуск

```bash
# Клонировать репозиторий и перейти в каталог
cd app_template

# Установить зависимости
flutter pub get

# Сгенерировать ассеты и ключи локализации (если есть Makefile)
make gen
# или вручную:
# make gen-l10n-keys  # ключи из assets/translations → locale_keys.g.dart
# flutter pub run build_runner build --delete-conflicting-outputs  # ассеты и т.д.

# Запуск приложения
flutter run
```

### Запуск тестов

```bash
# Все тесты
flutter test

# Конкретный файл
flutter test test/src/features/home/presentation/bloc/home_page_bloc_test.dart
```

### Добавление новой фичи

1. Скопировать структуру `feature_template` в `lib/src/features/<имя_фичи>/`.
2. В **domain**: описать entity, интерфейс репозитория, при необходимости use case(’ы).
3. В **data**: реализовать репозиторий (через `ApiClient`), возвращать `Result<T>`. Ошибки Dio маппить через `mapDioException()` из `core/errors/dio_error_mapper.dart`; для прочих — `UnknownFailure(ErrorKeys.unknown)`. Ключи ошибок добавить в `assets/translations`.
4. В **presentation**: реализовать Bloc (зависимость от use case), страницы и виджеты.
5. В **app/di/service_locator.dart** зарегистрировать репозиторий, use case и Bloc.
6. В **app/router/app_router.dart** добавить маршрут и страницу.

За образец логики и слоёв можно ориентироваться на фичу **Home**.

---

## Структура проекта (кратко)

```
lib/
├── main.dart                 # Точка входа, инициализация DI и Easy Localization
├── app/
│   ├── app_entry_point.dart  # MaterialApp.router, темы, локализация, роутер
│   ├── di/                   # GetIt (service_locator) — composition root
│   ├── router/               # GoRouter, MobilePages
│   └── theme/                # AppTheme, AppFonts, ColorScheme
├── core/
│   ├── api/                  # ApiClient (get/post/put/patch/delete, baseHeaders, опциональный Dio)
│   ├── errors/               # Failure, dio_error_mapper (mapDioException, ErrorKeys)
│   ├── result/               # Result<T>, fold()
│   ├── logger/               # AppLogger
│   ├── generated/            # flutter_gen, easy_localization codegen
│   ├── constants/
│   └── extensions/
└── src/features/
    ├── home/                 # Образцовая фича (domain → data → presentation)
    └── feature_template/     # Заготовка под новую фичу
```

---

## Лицензия

Проверьте корень репозитория на наличие файла лицензии; при отсутствии — уточните у владельца репозитория.
