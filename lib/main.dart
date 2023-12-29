import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_and_friends/launchpad/launchpad.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:flutter_and_friends/updater/updater.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  if (kDebugMode) await HydratedBloc.storage.clear();
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeDataProvider).toThemeMode();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UpdateListener(child: LaunchpadPage()),
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
