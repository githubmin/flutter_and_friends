import 'package:flutter_and_friends/launchpad/logic/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class LaunchpadTab extends _$LaunchpadTab {
  @override
  LaunchpadState build() => LaunchpadState.schedule;

  void toggleTab(int index) => state = LaunchpadState.values[index];
}
