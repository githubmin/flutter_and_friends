import 'package:flutter_and_friends/settings/settings.dart';
import 'package:flutter_and_friends/updater/models.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class UpdaterC extends _$UpdaterC {
  @override
  UpdaterState build() {
    Future.delayed(Duration.zero, init);
    return const UpdaterState();
  }

  Future<void> init() async {
    await PusherBeams.instance.start('cdd88306-52d6-4264-b082-e62fd453cf25');
    await PusherBeams.instance.addDeviceInterest('patch_available');
    await PusherBeams.instance.onMessageReceivedInTheForeground(
      (_) => checkForUpdates(),
    );
    await checkForUpdates();
  }

  Future<void> checkForUpdates() async {
    state = state.copyWith(status: UpdaterStatus.updateCheckInProgress);
    try {
      final codePush = ref.watch(codePushProvider);
      final updateAvailable = await codePush.isNewPatchAvailableForDownload();
      state = state.copyWith(
        status: UpdaterStatus.idle,
        updateAvailable: updateAvailable,
      );
      if (updateAvailable) await _downloadUpdate();
    } catch (error, stackTrace) {
      // TODO, addError(error, stackTrace);
      state = state.copyWith(status: UpdaterStatus.idle);
    }
  }

  Future<void> _downloadUpdate() async {
    state = state.copyWith(status: UpdaterStatus.downloadInProgress);
    final codePush = ref.watch(codePushProvider);
    try {
      await codePush.downloadUpdateIfAvailable();
    } catch (error, stackTrace) {
      // TODO, addError(error, stackTrace);
    }
    try {
      final isNewPatchReadyToInstall =
          await codePush.isNewPatchReadyToInstall();
      state = state.copyWith(
        isNewPatchReadyToInstall: isNewPatchReadyToInstall,
        status: UpdaterStatus.idle,
      );
    } catch (error, stackTrace) {
      // TODO, addError(error, stackTrace);
      state = state.copyWith(
        isNewPatchReadyToInstall: false,
        status: UpdaterStatus.idle,
      );
    }
  }
}
