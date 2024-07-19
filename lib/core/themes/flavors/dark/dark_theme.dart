import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snowmakers/core/themes/app_assets.dart';
import 'package:snowmakers/core/themes/app_sizes.dart';
import 'package:snowmakers/core/themes/app_text_styles.dart';
import 'package:snowmakers/core/themes/app_theme_flavor.dart';
import 'package:snowmakers/core/themes/data.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

part 'dark_color.dart';

class DarkTheme extends AppThemeFlavor {
  DarkTheme() : super.init();

  @override
  ThemeData createThemeData(BuildContext context) {
    final appSizes = context.isTablet ? AppSizes.tablet() : AppSizes.mobile();
    final appTextStyle =
        context.isTablet ? AppTextStyles.tablet() : AppTextStyles.mobile();

    final textTheme = appTextStyle.toTextTheme().apply(
          fontFamily: 'Inter',
          displayColor: _DarkColors.white,
          bodyColor: _DarkColors.white,
          decorationColor: _DarkColors.white,
        );
    return ThemeData.from(colorScheme: ColorScheme.fromSwatch()).copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.blue,
        onPrimary: _DarkColors.white,
        secondary: _DarkColors.moon,
        onSecondary: _DarkColors.white,
        error: Colors.red,
        onError: Colors.red,
        surface: _DarkColors.white,
        onSurface: _DarkColors.white,
      ),
      switchTheme: const SwitchThemeData(
        thumbColor: WidgetStatePropertyAll<Color>(
          _DarkColors.white,
        ),
        trackColor: WidgetStatePropertyAll<Color>(
          _DarkColors.moon,
        ),
      ),
      scaffoldBackgroundColor: _DarkColors.buttonDark,
      textTheme: textTheme,
      secondaryHeaderColor: _DarkColors.moon,
      drawerTheme: const DrawerThemeData(
        backgroundColor: _DarkColors.drawerDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _DarkColors.moon,
        foregroundColor: _DarkColors.white,
        elevation: 4,
        centerTitle: true,
        titleTextStyle: appTextStyle.titleLarge,
      ),
      cardTheme: const CardTheme(
        color: _DarkColors.moon,
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: _DarkColors.white,
          fixedSize: Size.fromWidth(
            context.width,
          ),
          textStyle: appTextStyle.titleLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8.r,
            ),
          ),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: _DarkColors.buttonDark,
        headerForegroundColor: _DarkColors.white,
        yearForegroundColor:
            const WidgetStatePropertyAll<Color>(_DarkColors.white),
        dayForegroundColor:
            const WidgetStatePropertyAll<Color>(_DarkColors.white),
        weekdayStyle: appTextStyle.bodyLarge,
        yearStyle: appTextStyle.bodyLarge,
        yearOverlayColor:
            const WidgetStatePropertyAll<Color>(_DarkColors.white),
        rangePickerHeaderForegroundColor: _DarkColors.white,
        rangeSelectionBackgroundColor: Colors.blueAccent.withOpacity(.5),
      ),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: _DarkColors.buttonDark,
        dayPeriodColor: _DarkColors.buttonDark,
        hourMinuteColor: _DarkColors.buttonDark,
        dayPeriodTextColor: _DarkColors.white,
        hourMinuteTextColor: _DarkColors.white,
        entryModeIconColor: _DarkColors.white,
        dialBackgroundColor: _DarkColors.secondaryDarkColor,
        dialTextColor: _DarkColors.white,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.blueAccent,
        deleteIconColor: _DarkColors.white,
        labelStyle: appTextStyle.labelLarge,
        secondarySelectedColor: _DarkColors.white,
        selectedColor: _DarkColors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: appTextStyle.titleLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _DarkColors.moon,
        suffixIconColor: _DarkColors.white,
        errorStyle: appTextStyle.titleMedium.copyWith(
          color: Colors.red,
          fontSize: 0,
          height: 0,
        ),
        hintStyle: textTheme.bodySmall!.copyWith(
          color: _DarkColors.white.withOpacity(0.5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: _DarkColors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: _DarkColors.white,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: _DarkColors.white,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: _DarkColors.white,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      extensions: [
        appTextStyle,
        appSizes,
        const AppThemeData(
          white: _DarkColors.white,
          black: _DarkColors.black,
          moon: _DarkColors.moon,
          colorSplash: _DarkColors.colorSplash,
          button: _DarkColors.buttonDark,
          drawer: _DarkColors.drawerDark,
          secondaryColor: _DarkColors.secondaryDarkColor,
          sky: _DarkColors.secondaryDarkColor,
          logo: AppAssets.darkLogo,
          backgroundAnimation: AppAssets.darkBackground,
        ),
      ],
    );
  }

  @override
  Brightness get windowBrightness => Brightness.dark;
}
