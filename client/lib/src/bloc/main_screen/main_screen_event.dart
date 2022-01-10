import 'package:equatable/equatable.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

class SetBottomNavigationIndexEvent extends MainScreenEvent {
  const SetBottomNavigationIndexEvent(
      {required this.currentBottomNavigationBarIndex});

  final int currentBottomNavigationBarIndex;

  @override
  List<Object?> get props => [currentBottomNavigationBarIndex];
}
