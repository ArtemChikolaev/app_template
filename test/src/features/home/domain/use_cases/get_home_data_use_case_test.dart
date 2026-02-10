import 'package:app_template/core/errors/failure.dart';
import 'package:app_template/core/result/result.dart';
import 'package:app_template/src/features/home/domain/entity/home_entity.dart';
import 'package:app_template/src/features/home/domain/repository/home_repository.dart';
import 'package:app_template/src/features/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late _MockHomeRepository repository;
  late GetHomeDataUseCase useCase;

  setUp(() {
    repository = _MockHomeRepository();
    useCase = GetHomeDataUseCase(repository);
  });

  test('returns success result when repository succeeds', () async {
    const HomeEntity entity = HomeEntity(
      title: 'Use case title',
      description: 'Use case description',
    );

    when(() => repository.getHomeData())
        .thenAnswer((_) async => const Result<HomeEntity>.success(entity));

    final Result<HomeEntity> result = await useCase();

    expect(result.isSuccess, isTrue);
    expect(result.data, equals(entity));
  });

  test('returns failure result when repository fails', () async {
    const Failure failure = UnknownFailure('Some failure');

    when(() => repository.getHomeData()).thenAnswer(
      (_) async => const Result<HomeEntity>.failure(failure),
    );

    final Result<HomeEntity> result = await useCase();

    expect(result.isFailure, isTrue);
    expect(result.failure, equals(failure));
  });
}

