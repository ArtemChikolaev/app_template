import 'package:collection/collection.dart';
import 'package:app_template/src/features/home/presentation/pages/home_page.dart';
import 'package:app_template/src/features/feature_template/presentation/pages/feature_template_page.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: MobilePages.homePage.path,
    routes: [
      GoRoute(
        path: MobilePages.homePage.path,
        name: MobilePages.homePage.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: MobilePages.featureTemplatePage.path,
        name: MobilePages.featureTemplatePage.name,
        builder: (context, state) => const FeatureTemplatePage(),
      ),
    ],
  );
}

enum MobilePages {
  homePage,
  featureTemplatePage;

  static MobilePages? fromName(String? name) {
    return MobilePages.values.firstWhereOrNull(
      (MobilePages element) => element.name == name,
    );
  }
}

extension MobilePagesExt on MobilePages {
  String get path => '/$name';
}
