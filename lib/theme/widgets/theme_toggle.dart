import 'package:flutter/material.dart';
import 'package:flutter_and_friends/theme/logic/models.dart';
import 'package:flutter_and_friends/theme/logic/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(themeDataProvider);
    final label = state == ThemeState.light ? 'Light Mode' : 'Dark Mode';
    final icon = state == ThemeState.light ? Icons.light_mode : Icons.dark_mode;
    return SwitchListTile(
      title: Text(label),
      value: state == ThemeState.light,
      onChanged: (_) => ref.read(themeDataProvider.notifier).toggleTheme(),
      secondary: Icon(icon),
    );
  }
}
