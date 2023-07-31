import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/presentation/providers/theme/theme_provider.dart';
import 'package:iusers/presentation/providers/theme/theme_state.dart';
import 'package:iusers/presentation/screens/home/home_screen.dart';
import 'package:iusers/utils/custom_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);

    return MaterialApp(
      home: const HomeScreen(),
      theme: themeState is LightTheme
          ? CustomTheme.lightTheme
          : CustomTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
