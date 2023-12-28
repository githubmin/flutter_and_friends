// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: strict_raw_type, require_trailing_commas, cast_nullable_to_non_nullable, lines_longer_than_80_chars

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$codePushHash() => r'29aff13a2304b8bb4178f67974fcabce3c7d93ce';

/// See also [codePush].
@ProviderFor(codePush)
final codePushProvider = AutoDisposeProvider<ShorebirdCodePush>.internal(
  codePush,
  name: r'codePushProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$codePushHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CodePushRef = AutoDisposeProviderRef<ShorebirdCodePush>;
String _$versionNumHash() => r'4e2620675161ddc62c866739e06bedc37d0fe588';

/// See also [versionNum].
@ProviderFor(versionNum)
final versionNumProvider = AutoDisposeFutureProvider<String>.internal(
  versionNum,
  name: r'versionNumProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$versionNumHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VersionNumRef = AutoDisposeFutureProviderRef<String>;
String _$patchNumberHash() => r'a2706776ad59c2a835fea45ba420efd99e843dea';

/// See also [patchNumber].
@ProviderFor(patchNumber)
final patchNumberProvider = AutoDisposeFutureProvider<int>.internal(
  patchNumber,
  name: r'patchNumberProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$patchNumberHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PatchNumberRef = AutoDisposeFutureProviderRef<int>;
String _$settingsDataHash() => r'98f7946e590bc9444fddc3204b77fd80b2ab9339';

/// See also [SettingsData].
@ProviderFor(SettingsData)
final settingsDataProvider =
    AutoDisposeAsyncNotifierProvider<SettingsData, SettingsState>.internal(
  SettingsData.new,
  name: r'settingsDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settingsDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingsData = AutoDisposeAsyncNotifier<SettingsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
