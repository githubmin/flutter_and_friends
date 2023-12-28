import 'package:flutter_and_friends/theme/logic/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class ThemeData extends _$ThemeData {
  @override
  ThemeState build() {
    // TODO, read from storage

    return ThemeState.light;
  }

  void toggleTheme() {
    state = (state == ThemeState.light) ? ThemeState.dark : ThemeState.light;

    // TODO, write to storage
  }
}
