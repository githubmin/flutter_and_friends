import 'package:flutter/material.dart';
import 'package:flutter_and_friends/theme/theme.dart';

export 'cubit/theme_cubit.dart';

final lightTheme = ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
final darkTheme = ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF005AC1),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD8E2FF),
  onPrimaryContainer: Color(0xFF001A41),
  secondary: Color(0xFF575E71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFDBE2F9),
  onSecondaryContainer: Color(0xFF141B2C),
  tertiary: Color(0xFF715573),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFBD7FC),
  onTertiaryContainer: Color(0xFF29132D),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFEFBFF),
  onBackground: Color(0xFF1B1B1F),
  outline: Color(0xFF74777F),
  onInverseSurface: Color(0xFFF2F0F4),
  inverseSurface: Color(0xFF303033),
  inversePrimary: Color(0xFFADC6FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF005AC1),
  outlineVariant: Color(0xFFC4C6D0),
  scrim: Color(0xFF000000),
  surface: Color(0xFFFAF9FD),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFE1E2EC),
  onSurfaceVariant: Color(0xFF44474F),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFADC6FF),
  onPrimary: Color(0xFF002E69),
  primaryContainer: Color(0xFF004494),
  onPrimaryContainer: Color(0xFFD8E2FF),
  secondary: Color(0xFFBFC6DC),
  onSecondary: Color(0xFF293041),
  secondaryContainer: Color(0xFF3F4759),
  onSecondaryContainer: Color(0xFFDBE2F9),
  tertiary: Color(0xFFDEBCDF),
  onTertiary: Color(0xFF402843),
  tertiaryContainer: Color(0xFF583E5B),
  onTertiaryContainer: Color(0xFFFBD7FC),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE3E2E6),
  outline: Color(0xFF8E9099),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE3E2E6),
  inversePrimary: Color(0xFF005AC1),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFADC6FF),
  outlineVariant: Color(0xFF44474F),
  scrim: Color(0xFF000000),
  surface: Color(0xFF121316),
  onSurface: Color(0xFFC7C6CA),
  surfaceVariant: Color(0xFF44474F),
  onSurfaceVariant: Color(0xFFC4C6D0),
);

extension ThemeStateX on ThemeState {
  ThemeMode toThemeMode() {
    return this == ThemeState.dark ? ThemeMode.dark : ThemeMode.light;
  }
}
