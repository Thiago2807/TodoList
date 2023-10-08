import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/events/default_events.dart';
import '../../bloc/states/default_states.dart';

class DefaultScreenBloc extends Bloc<DefaultEvents, DefaultState> {
  DefaultScreenBloc() : super(StateDefault(indexScreen: 0)) {
    on<AlterScreenDefaultScreen>((event, emit) {
      emit(StateDefault(indexScreen: event.indexScreen));
    });
  }
}
