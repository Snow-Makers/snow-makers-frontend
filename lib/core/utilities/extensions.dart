import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:snowmakers/core/themes/app_sizes.dart';
import 'package:snowmakers/core/themes/app_text_styles.dart';
import 'package:snowmakers/core/themes/app_theme.dart';
import 'package:snowmakers/core/themes/data.dart';
import 'package:snowmakers/core/utilities/locale.dart';

extension BuildContextUtils on BuildContext {
  //* MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  //* Dimensions Extensions
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  Size get screenSize => MediaQuery.of(this).size;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get shortestSide => MediaQuery.of(this).size.shortestSide;

  double get longestSide => MediaQuery.of(this).size.longestSide;

  Orientation get orientation => MediaQuery.of(this).orientation;

  double heightR(double value) => MediaQuery.of(this).size.height * value;

  double widthR(double value) => MediaQuery.of(this).size.width * value;

  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;

  //* Device Breakpoints
  bool get isMobile => width >= 0 && width <= 450;

  bool get isTablet => width > 451 && width <= 800;

  bool get isDesktop => width > 801 && width <= 1920;

  bool get isLargeMobile => isMobile && height > 750;

  bool get isSmallMobile => isMobile && height < 550;

  //* Theme Extensions
  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  AppThemeData get appTheme => AppTheme.of(this);

  AppSizes get appSizes => AppTheme.sizesOf(this);

  AppTextStyles get appTextStyles => AppTheme.textStyleOf(this);

  bool get isArabic => locale == AppLocale.arabic;

  Size calculateDesignSize() {
    if (isMobile) {
      return const Size(450, 762);
    } else if (isTablet) {
      return const Size(800, 800);
    } else {
      return const Size(1920, 1080);
    }
  }
}

extension TConst<T> on T {
  T get vara => this;
}

extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  List<T> sorted(Comparator<T> compare) => [...this]..sort(compare);
}

extension IterableNullableExtension<T extends Object> on Iterable<T?> {
  /// The non-`null` elements of this `Iterable`.
  ///
  /// Returns an iterable which emits all the non-`null` elements
  /// of this iterable, in their original iteration order.
  ///
  /// For an `Iterable<X?>`, this method is equivalent to `.whereType<X>()`.
  Iterable<T> whereNotNull() sync* {
    for (final element in this) {
      if (element != null) yield element;
    }
  }
}

extension NullableObjectUtils<T> on T? {
  /// Apply the [mapper] to the value if it's not null,
  /// then return the result of the mapping operation.
  S? let<S>(S? Function(T it) mapper) {
    if (this is T) {
      return mapper(this as T);
    }
    return null;
  }

  /// Apply the [mapper] if provided and return the result.
  /// If the no mapper was provided return the object if it is of type [S]
  S? maybeLet<S>([S? Function(T it)? mapper]) {
    final value = this;
    if (value is T) {
      return mapper?.call(value);
    }
    if (value is S) {
      return value;
    }
    return null;
  }
}

extension ObjectUtils<T> on T {
  T get varValue {
    return this;
  }

  S map<S>(S Function(T it) mapper) {
    return mapper(this);
  }
}

extension IterableUtils<T, D extends Iterable<T>> on D {
  S mapIterable<S>(S Function(D it) mapper) {
    return mapper(this);
  }
}
