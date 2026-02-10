import 'package:app_template/core/errors/failure.dart';
import 'package:app_template/core/result/result.dart';
import 'package:app_template/src/features/home/domain/entity/home_entity.dart';
import 'package:app_template/src/features/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:app_template/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetHomeDataUseCase extends Mock implements GetHomeDataUseCase {}

void main() {
  late _MockGetHomeDataUseCase getHomeDataUseCase;

  setUp(() {
    getHomeDataUseCase = _MockGetHomeDataUseCase();
  });

  group('HomePageBloc', () {
    test(
      'emits loading then loaded state when data is loaded successfully',
      () async {
        final HomeEntity entity = const HomeEntity(
          title: 'Test title',
          description: 'Test description',
        );

        when(() => getHomeDataUseCase())
            .thenAnswer((_) async => Result<HomeEntity>.success(entity));

        final bloc = HomePageBloc(getHomeDataUseCase: getHomeDataUseCase);

        final List<HomePageState> emittedStates = <HomePageState>[];
        final subscription = bloc.stream.listen(emittedStates.add);

        bloc.add(HomePageInitialEvent());

        await Future<void>.delayed(const Duration(milliseconds: 10));

        await subscription.cancel();
        await bloc.close();

        expect(emittedStates.length, 2);
        expect(emittedStates[0].isLoading, true);
        expect(emittedStates[1].isLoading, false);
        expect(emittedStates[1].title, entity.title);
        expect(emittedStates[1].description, entity.description);
        expect(emittedStates[1].errorMessage, isNull);
      },
    );

    test(
      'emits loading then error state when use case returns failure',
      () async {
        const Failure failure = NetworkFailure('Network error');

        when(() => getHomeDataUseCase()).thenAnswer(
          (_) async => const Result<HomeEntity>.failure(failure),
        );

        final bloc = HomePageBloc(getHomeDataUseCase: getHomeDataUseCase);

        final List<HomePageState> emittedStates = <HomePageState>[];
        final subscription = bloc.stream.listen(emittedStates.add);

        bloc.add(HomePageInitialEvent());

        await Future<void>.delayed(const Duration(milliseconds: 10));

        await subscription.cancel();
        await bloc.close();

        expect(emittedStates.length, 2);
        expect(emittedStates[0].isLoading, true);
        expect(emittedStates[1].isLoading, false);
        expect(emittedStates[1].errorMessage, failure.message);
      },
    );
  });
}

