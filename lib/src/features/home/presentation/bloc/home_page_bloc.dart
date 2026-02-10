import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_template/core/errors/failure.dart';
import 'package:app_template/core/logger/app_logger.dart';
import 'package:app_template/core/result/result.dart';
import 'package:app_template/src/features/home/domain/entity/home_entity.dart';
import 'package:app_template/src/features/home/domain/use_cases/get_home_data_use_case.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({required GetHomeDataUseCase getHomeDataUseCase})
    : _getHomeDataUseCase = getHomeDataUseCase,
      super(const HomePageState.initial()) {
    on<HomePageInitialEvent>(_onInitial);
  }

  final GetHomeDataUseCase _getHomeDataUseCase;

  Future<void> _onInitial(
    HomePageInitialEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final Result<HomeEntity> result = await _getHomeDataUseCase();

    result.fold(
      (HomeEntity data) => emit(
        state.copyWith(
          isLoading: false,
          title: data.title,
          description: data.description,
          errorMessage: null,
        ),
      ),
      (Failure failure) {
        AppLogger.warning(
          'HomePageBloc.getHomeData failed: ${failure.message}',
        );
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
    );
  }
}
