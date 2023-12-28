import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class FavoritesData extends _$FavoritesData {
  @override
  List<Event> build() {
    // TODO, read favorites from storage

    return const [];
  }

  void toggleFavorite(Event event) {
    final events = [...state];
    events.contains(event) ? events.remove(event) : events.add(event);
    events.sort((a, b) => a.startTime.compareTo(b.startTime));
    state = [...events];

    // TODO, save favorites to storage
  }
}
