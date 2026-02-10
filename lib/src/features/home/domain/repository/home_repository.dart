import 'package:app_template/core/result/result.dart';
import 'package:app_template/src/features/home/domain/entity/home_entity.dart';

/// Contract for loading data needed on the Home page.
abstract class HomeRepository {
  /// Returns domain data required to render the Home page.
  Future<Result<HomeEntity>> getHomeData();
}
