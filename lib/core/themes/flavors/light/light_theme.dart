import 'package:flutter/material.dart';
import 'package:snowmakers/core/themes/app_assets.dart';
import 'package:snowmakers/core/themes/app_sizes.dart';
import 'package:snowmakers/core/themes/app_text_styles.dart';
import 'package:snowmakers/core/themes/app_theme_flavor.dart';
import 'package:snowmakers/core/themes/data.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

part 'light_color.dart';

class LightTheme extends AppThemeFlavor {
  LightTheme() : super.init();

  @override
  ThemeData createThemeData(BuildContext context) {
    final appSizes = context.isTablet ? AppSizes.tablet() : AppSizes.mobile();
    final appTextStyle =
        context.isTablet ? AppTextStyles.tablet() : AppTextStyles.mobile();

    final textTheme = appTextStyle.toTextTheme().apply(
          fontFamily: 'Inter',
          displayColor: _LightColors.black,
          bodyColor: _LightColors.black,
          decorationColor: _LightColors.black,
        );
    return ThemeData.from(colorScheme: ColorScheme.fromSwatch()).copyWith(
      scaffoldBackgroundColor: _LightColors.secondaryLightColor,
      secondaryHeaderColor: _LightColors.sky,
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.green),
      textTheme: textTheme,
      extensions: [
        appTextStyle,
        appSizes,
        AppThemeData(
          white: _LightColors.white,
          black: _LightColors.black,
          moon: _LightColors.sky,
          colorSplash: _LightColors.sky,
          button: _LightColors.buttonLight,
          drawer: _LightColors.drawerLight,
          secondaryColor: _LightColors.drawerLight,
          sky: _LightColors.sky,
          logo: AppAssets.logo,
          backgroundAnimation: AppAssets.lightBackground,
        ),
      ],
    );
  }

  @override
  Brightness get windowBrightness => Brightness.dark;
}
