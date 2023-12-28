import 'package:flutter_and_friends/config/config.dart';
import 'package:flutter_and_friends/settings/logic/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

part 'providers.g.dart';

@riverpod
ShorebirdCodePush codePush(CodePushRef ref) {
  return ShorebirdCodePush();
}

@riverpod
class SettingsData extends _$SettingsData {
  @override
  Future<SettingsState> build() async {
    final patchNumber = await ref.watch(codePushProvider).currentPatchNumber();
    return SettingsState(patchNumber: patchNumber, version: version);
  }
}

@riverpod
Future<String> versionNum(VersionNumRef ref) async {
  final state = await ref.watch(settingsDataProvider.future);
  final packageVersion =
      '''${state.version.major}.${state.version.minor}.${state.version.patch}''';
  final buildNumber = '${state.version.build.singleOrNull ?? 0}';
  final patchNumber = state.patchNumber != null ? ' #${state.patchNumber}' : '';
  return '$packageVersion ($buildNumber)$patchNumber';
}

@riverpod
Future<int> patchNumber(PatchNumberRef ref) async {
  return ref
      .watch(settingsDataProvider.selectAsync((data) => data.patchNumber ?? 0));
}
