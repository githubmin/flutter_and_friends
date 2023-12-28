import 'package:flutter/material.dart';
import 'package:flutter_and_friends/favorites/logic/providers.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:flutter_and_friends/theme/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) => const FavoritesView();
}

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesDataProvider);
    return Scaffold(
      appBar: FFAppBar(),
      body: favorites.isEmpty
          ? const EmptyFavorites()
          : FavoritesListView(events: favorites),
    );
  }
}

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.heart_broken_sharp,
              color: Colors.pinkAccent,
              size: 64,
            ),
            const SizedBox(height: 24),
            Text(
              "You don't have any favorites",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the heart icon to add an event to your favorites',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({required this.events, super.key});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      padding: const EdgeInsets.all(12),
      itemCount: events.length,
      itemBuilder: (context, index) => EventCard(event: events[index]),
    );
  }
}
