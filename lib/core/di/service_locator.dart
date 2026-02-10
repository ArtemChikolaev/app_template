import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator(SharedPreferences sharedPreferences) async {
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
}
