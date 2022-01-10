import 'package:equatable/equatable.dart';

class MainScreenState extends Equatable {
  const MainScreenState({required this.bottomNavigationBarIndex});

  const MainScreenState.initial({this.bottomNavigationBarIndex = 0});

  final int bottomNavigationBarIndex;

  @override
  List<Object?> get props => [bottomNavigationBarIndex];
}
