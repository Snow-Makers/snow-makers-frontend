import 'package:flutter/material.dart';

/*
Custom extension for appTheme to add all customizations for specific components inside this class.

For example:
If there is custom widget you need to specific color for it in light and dark mode.
You can easily call it with this extension from context by calling: 'context.appTheme.blue'
*/

typedef AppThemeExtension = ThemeExtension<AppThemeData>;

class AppThemeData extends AppThemeExtension {
  final Color black;
  final Color white;
  final Color sky;
  final Color moon;
  final Color colorSplash;
  final Color button;
  final Color drawer;
  final Color secondaryColor;
  final String logo;
  final String backgroundAnimation;

  const AppThemeData({
    required this.white,
    required this.black,
    required this.moon,
    required this.colorSplash,
    required this.button,
    required this.drawer,
    required this.secondaryColor,
    required this.sky,
    required this.logo,
    required this.backgroundAnimation,
  });

  @override
  ThemeExtension<AppThemeData> copyWith() {
    return this;
  }

  /*
  The 'lerp' method is used to linearly interpolate between two  instances.
  It takes in another  instance 'other' and a double 't' which represents
  The interpolation fraction.

  Overall, it's facilitating the blending of instance based on the linear interpolation of their properties.
  Allowing for smooth transitions or transformations between two instances.
   */

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeData) return this;

    final normT = t.clamp(0, 1).toDouble();
    Color lerpColor(Color color1, Color color2) {
      return Color.lerp(color1, color2, normT)!;
    }

    // cutsom lerp for images
    String lerpImage(String image1, String image2) {
      if (normT.abs() >= 0.5) return image2;
      return image1;
    }

    return AppThemeData(
      black: lerpColor(black, other.black),
      white: lerpColor(white, other.white),
      moon: lerpColor(moon, other.moon),
      colorSplash: lerpColor(colorSplash, other.colorSplash),
      button: lerpColor(button, other.button),
      drawer: lerpColor(drawer, other.drawer),
      secondaryColor: lerpColor(secondaryColor, other.secondaryColor),
      sky: lerpColor(sky, other.sky),
      logo: lerpImage(logo, other.logo),
      backgroundAnimation:
          lerpImage(backgroundAnimation, other.backgroundAnimation),
    );
  }

  List<Object?> get props => [
        black,
        white,
        moon,
        colorSplash,
        button,
        drawer,
        secondaryColor,
        sky,
        logo,
        backgroundAnimation
      ];
}
