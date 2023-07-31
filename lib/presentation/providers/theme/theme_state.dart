import 'package:equatable/equatable.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class LightTheme extends ThemeState {
  @override
  List<Object?> get props => [];
}

class DarkTheme extends ThemeState {
  @override
  List<Object?> get props => [];
}
