import 'package:collection/collection.dart';
import 'package:app_template/src/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter();

  static final GoRouter _router = GoRouter(
    initialLocation: MobilePages.homePage.path,
    routes: [
      GoRoute(
        path: MobilePages.homePage.path,
        name: MobilePages.homePage.name,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
  GoRouter get router => _router;
}

enum MobilePages {
  homePage;

  static MobilePages? fromName(String? name) {
    return MobilePages.values.firstWhereOrNull(
      (MobilePages element) => element.name == name,
    );
  }
}

extension MobilePagesExt on MobilePages {
  String get path => '/$name';
}
