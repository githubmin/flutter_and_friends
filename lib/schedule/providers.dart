import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

enum ScheduleState { day1, day2, day3 }

@riverpod
class ScheduleTab extends _$ScheduleTab {
  @override
  ScheduleState build() => ScheduleState.day1;

  void toggleTab(int index) => state = ScheduleState.values[index];
}
