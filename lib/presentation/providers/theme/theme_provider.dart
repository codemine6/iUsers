import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/presentation/providers/theme/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeState>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier() : super(LightTheme()) {
    getInitialTheme();
  }

  getInitialTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final darkTheme = prefs.getBool('darkTheme');
    if (darkTheme == true) {
      state = DarkTheme();
    } else {
      state = LightTheme();
    }
  }

  setLightTheme() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkTheme', false);
    state = LightTheme();
  }

  setDarkTheme() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkTheme', true);
    state = DarkTheme();
  }
}
