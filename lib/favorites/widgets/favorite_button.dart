import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_and_friends/favorites/logic/providers.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref
        .watch(favoritesDataProvider.select((value) => value.contains(event)));
    return IconButton(
      onPressed: () {
        ref.read(favoritesDataProvider.notifier).toggleFavorite(event);
        HapticFeedback.mediumImpact();
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.pinkAccent : null,
      ),
    );
  }
}
