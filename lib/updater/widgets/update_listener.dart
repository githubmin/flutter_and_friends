import 'package:flutter/material.dart';
import 'package:flutter_and_friends/updater/updater.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restart_app/restart_app.dart';

class UpdateListener extends ConsumerWidget {
  const UpdateListener({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      updaterCProvider,
      (prev, next) {
        if (prev?.status == UpdaterStatus.downloadInProgress &&
            next.status == UpdaterStatus.idle &&
            next.isNewPatchReadyToInstall) {
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showMaterialBanner(
              const MaterialBanner(
                content: Text('An update is available!'),
                actions: [
                  TextButton(
                    onPressed: Restart.restartApp,
                    child: Text('Restart Now'),
                  ),
                ],
              ),
            );
        } else if (prev?.status != next.status &&
            next.status == UpdaterStatus.idle &&
            next.updateAvailable == false) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('No update available'),
              ),
            );
        }
      },
    );
    return child;
  }
}
