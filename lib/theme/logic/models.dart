import 'package:flutter/material.dart';

enum ThemeState { light, dark }

extension ThemeStateEx on ThemeState {
  ThemeMode toThemeMode() {
    return this == ThemeState.dark ? ThemeMode.dark : ThemeMode.light;
  }
}
