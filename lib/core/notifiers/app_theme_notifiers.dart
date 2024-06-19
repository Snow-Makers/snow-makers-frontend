import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/service/local/interface/i_simple_user_data.dart';
import 'package:snowmakers/core/themes/app_theme_flavor.dart';
import 'package:snowmakers/core/utilities/app_secrets_key.dart';
import 'package:snowmakers/core/utilities/enums.dart';


class AppThemeNotifier extends ChangeNotifier {
  static final provider = ChangeNotifierProvider<AppThemeNotifier>(
    (ref) {
      return AppThemeNotifier(
        ref.watch(
          ISimpleUserData.provider(LocalDataType.defaultValue),
        ),
      );
    },
  );

  ThemeFlavor _themeFlavor = ThemeFlavor.defaultValue;
  late AppThemeFlavor _appThemeFlavour = AppThemeFlavor(_themeFlavor);

  ThemeFlavor get themeFlavor => _themeFlavor;

  bool get isDarkMode => _themeFlavor == ThemeFlavor.dark;

  Brightness get windowBrightness => _appThemeFlavour.windowBrightness;

  final ISimpleUserData _iSimpleUserData;

  ThemeData createTheme(BuildContext context) {
    return _appThemeFlavour.createThemeData(context);
  }

  AppThemeNotifier(this._iSimpleUserData) {
    init();
  }

  Future<void> init() async {
    final savedFlavorValue =
        await _iSimpleUserData.readString(AppSecretsKey.themeKey);
    setThemeFlavor(ThemeFlavor.fromString(savedFlavorValue));
  }

  Future<void> toggleTheme() async {
    final newTheme = _themeFlavor == ThemeFlavor.light
        ? ThemeFlavor.dark
        : ThemeFlavor.light;
    await setThemeFlavor(newTheme);
  }

  Future<void> setThemeFlavor(ThemeFlavor flavor) async {
    _themeFlavor = flavor;
    await _iSimpleUserData.writeString(AppSecretsKey.themeKey, flavor.name);
    _updateTheme();
  }

  void _updateTheme() {
    _appThemeFlavour = AppThemeFlavor(_themeFlavor);
    notifyListeners();
  }
}
