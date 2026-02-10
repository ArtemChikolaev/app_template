import 'package:app_template/core/result/result.dart';
import 'package:app_template/src/features/home/domain/entity/home_entity.dart';
import 'package:app_template/src/features/home/domain/repository/home_repository.dart';

/// Use case that encapsulates loading data for the Home page.
class GetHomeDataUseCase {
  const GetHomeDataUseCase(this._repository);

  final HomeRepository _repository;

  Future<Result<HomeEntity>> call() async {
    return _repository.getHomeData();
  }
}
