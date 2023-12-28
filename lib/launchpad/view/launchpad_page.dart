import 'package:flutter/material.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_and_friends/launchpad/launchpad.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:flutter_and_friends/sponsors/sponsors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LaunchpadPage extends StatelessWidget {
  const LaunchpadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LaunchpadView();
  }
}

class LaunchpadView extends StatelessWidget {
  const LaunchpadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, shadowColor: Colors.transparent),
      body: const _LaunchpadBody(),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _LaunchpadBody extends ConsumerWidget {
  const _LaunchpadBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(launchpadTabProvider);
    switch (state) {
      case LaunchpadState.favorites:
        return const FavoritesPage();
      case LaunchpadState.schedule:
        return const SchedulePage();
      case LaunchpadState.sponsors:
        return const SponsorsPage();
    }
  }
}

class _BottomNavigationBar extends ConsumerWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(launchpadTabProvider);
    return BottomNavigationBar(
      useLegacyColorScheme: false,
      enableFeedback: true,
      onTap: ref.read(launchpadTabProvider.notifier).toggleTab,
      currentIndex: state.index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Sponsors',
        ),
      ],
    );
  }
}
