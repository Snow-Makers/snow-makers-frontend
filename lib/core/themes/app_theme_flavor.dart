import 'package:flutter/material.dart';
import 'package:snowmakers/core/themes/flavors/dark/dark_theme.dart';
import 'package:snowmakers/core/themes/flavors/light/light_theme.dart';
import 'package:snowmakers/core/utilities/enums.dart';

abstract class AppThemeFlavor {
  factory AppThemeFlavor(ThemeFlavor themeFlavor) {
    switch (themeFlavor) {
      case ThemeFlavor.light:
        return LightTheme();
      case ThemeFlavor.dark:
        return DarkTheme();
      default:
        return DarkTheme();
    }
  }

  Brightness get windowBrightness;

  ThemeData createThemeData(BuildContext context);

  @protected
  AppThemeFlavor.init();
}
