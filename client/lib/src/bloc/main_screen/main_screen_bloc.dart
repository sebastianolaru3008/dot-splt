import 'package:bloc/bloc.dart';

import 'main_screen_event.dart';
import 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(const MainScreenState.initial()) {
    on<SetBottomNavigationIndexEvent>(
        (SetBottomNavigationIndexEvent event, Emitter<MainScreenState> emit) =>
            _changeBottomNavigationBarIndex(event, emit));
  }

  void _changeBottomNavigationBarIndex(
      SetBottomNavigationIndexEvent event, Emitter<MainScreenState> emit) {
    emit(
      MainScreenState(
        bottomNavigationBarIndex: event.currentBottomNavigationBarIndex,
      ),
    );
  }
}
