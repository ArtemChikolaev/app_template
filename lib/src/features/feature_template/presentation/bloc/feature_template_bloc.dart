import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'feature_template_event.dart';
part 'feature_template_state.dart';

class FeatureTemplateBloc
    extends Bloc<FeatureTemplateEvent, FeatureTemplateState> {
  FeatureTemplateBloc() : super(FeatureTemplateState()) {
    on<FeatureTemplateInitialEvent>(_onInitial);
  }

  void _onInitial(
    FeatureTemplateInitialEvent event,
    Emitter<FeatureTemplateState> emit,
  ) {
    // Add loading/data logic and use cases when needed.
  }
}
