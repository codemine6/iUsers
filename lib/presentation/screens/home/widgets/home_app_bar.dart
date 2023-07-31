import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:iusers/presentation/providers/theme/theme_provider.dart';
import 'package:iusers/presentation/providers/theme/theme_state.dart';

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          'iUsers',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            if (themeState is LightTheme) {
              ref.read(themeProvider.notifier).setDarkTheme();
            } else {
              ref.read(themeProvider.notifier).setLightTheme();
            }
          },
          icon: Icon(
            themeState is LightTheme ? Ionicons.moon : Ionicons.sunny,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
