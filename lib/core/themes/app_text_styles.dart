import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  static const fontLineHeightMultiplier = 1.8;
  static const fontFamily = 'Inter';

  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle subDisplayLarge;
  final TextStyle subDisplayMedium;
  final TextStyle subDisplaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle subheadLarge;
  final TextStyle subheadMedium;
  final TextStyle subheadSmall;
  final TextStyle bodyMedium;
  final TextStyle labelLarge;
  final TextStyle bodySmall;
  final TextStyle labelSmall;
  final TextStyle labelMedium;

  const AppTextStyles._({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.subDisplaySmall,
    required this.subDisplayLarge,
    required this.subDisplayMedium,
    required this.headlineSmall,
    required this.subheadLarge,
    required this.subheadMedium,
    required this.subheadSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.labelLarge,
    required this.bodySmall,
    required this.labelMedium,
    required this.labelSmall,
  });

  factory AppTextStyles.mobile() {
    return AppTextStyles._(
      bodyLarge: TextStyle(
        fontSize: 14.spMin,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.spMin,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontSize: 14.spMin,
        fontWeight: FontWeight.normal,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.6,
      ),
      displayLarge: TextStyle(
        fontSize: 24.spMin,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 2.6,
      ),
      displayMedium: TextStyle(
        fontSize: 24.spMin,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 2.1,
      ),
      displaySmall: TextStyle(
        fontSize: 24.spMin,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      subDisplayLarge: TextStyle(
        fontSize: 22.spMin,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 2.6,
      ),
      subDisplayMedium: TextStyle(
        fontSize: 22.spMin,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 2.1,
      ),
      subDisplaySmall: TextStyle(
        fontSize: 22.spMin,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      headlineLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      headlineMedium: TextStyle(
        fontSize: 20.spMin,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.spMin,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.18,
      ),
      subheadLarge: TextStyle(
        fontSize: 18.spMin,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      subheadMedium: TextStyle(
        fontSize: 18.spMin,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      subheadSmall: TextStyle(
        fontSize: 18.spMin,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.18,
      ),
      labelLarge: TextStyle(
        fontSize: 12.spMin,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      labelSmall: TextStyle(
        fontSize: 12.spMin,
        fontWeight: FontWeight.normal,
        textBaseline: TextBaseline.ideographic,
        height: fontLineHeightMultiplier,
        fontFamily: fontFamily,
      ),
      labelMedium: TextStyle(
        fontSize: 12.spMin,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        height: fontLineHeightMultiplier,
        fontFamily: fontFamily,
      ),
      titleLarge: TextStyle(
        fontSize: 16.spMin,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.14,
      ),
      titleMedium: TextStyle(
        fontSize: 16.spMin,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.4,
      ),
      titleSmall: TextStyle(
        fontSize: 16.spMin,
        fontWeight: FontWeight.normal,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.16,
      ),
    );
  }

  factory AppTextStyles.tablet() {
    return const AppTextStyles._(
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.6,
      ),
      displayLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 2.6,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 2.1,
      ),
      displaySmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      headlineLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      headlineSmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.18,
      ),
      subheadLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      subheadMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      subheadSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.18,
      ),
      subDisplayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 2.6,
      ),
      subDisplayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 2.1,
      ),
      subDisplaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.5,
      ),
      labelSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: fontLineHeightMultiplier,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.14,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.4,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        textBaseline: TextBaseline.ideographic,
        fontFamily: fontFamily,
        height: 1.16,
      ),
    );
  }

  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      labelLarge: labelLarge,
      bodySmall: bodySmall,
      labelSmall: labelSmall,
    );
  }

  @override
  ThemeExtension<AppTextStyles> copyWith() {
    return this;
  }

  /*
  The 'lerp' method is used to linearly interpolate between two 'AppTextStyles' instances.
  It takes in another 'AppTextStyles' instance 'other' and a double 't' which represents
  The interpolation fraction.

  Overall, it's facilitating the blending of text styles based on the linear interpolation of their properties.
  Allowing for smooth transitions or transformations between two text styles.
   */

  @override
  AppTextStyles lerp(AppTextStyles? other, double t) {
    TextStyle lerpStyle(TextStyle? style1, TextStyle style2) {
      return TextStyle.lerp(style1, style2, t) ?? style2;
    }

    return AppTextStyles._(
      displayLarge: lerpStyle(other?.displayLarge, displayLarge),
      displayMedium: lerpStyle(other?.displayMedium, displayMedium),
      displaySmall: lerpStyle(other?.displaySmall, displaySmall),
      subDisplayLarge: lerpStyle(other?.subDisplayLarge, subDisplayLarge),
      subDisplayMedium: lerpStyle(other?.subDisplayMedium, subDisplayMedium),
      subDisplaySmall: lerpStyle(other?.subDisplaySmall, subDisplaySmall),
      headlineLarge: lerpStyle(other?.headlineLarge, headlineLarge),
      headlineMedium: lerpStyle(other?.headlineMedium, headlineMedium),
      headlineSmall: lerpStyle(other?.headlineSmall, headlineSmall),
      subheadLarge: lerpStyle(other?.subheadLarge, subheadLarge),
      subheadMedium: lerpStyle(other?.subheadMedium, subheadMedium),
      subheadSmall: lerpStyle(other?.subheadSmall, subheadSmall),
      titleLarge: lerpStyle(other?.titleLarge, titleLarge),
      titleMedium: lerpStyle(other?.titleMedium, titleMedium),
      titleSmall: lerpStyle(other?.titleSmall, titleSmall),
      bodyLarge: lerpStyle(other?.bodyLarge, bodyLarge),
      bodyMedium: lerpStyle(other?.bodyMedium, bodyMedium),
      labelLarge: lerpStyle(other?.labelLarge, labelLarge),
      labelMedium: lerpStyle(other?.labelMedium, labelMedium),
      bodySmall: lerpStyle(other?.bodySmall, bodySmall),
      labelSmall: lerpStyle(other?.labelSmall, labelSmall),
    );
  }
}
