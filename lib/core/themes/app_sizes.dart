import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes extends ThemeExtension<AppSizes> {
  final double kRadius4;
  final double kRadius8;
  final double kRadius10;
  final double kRadius12;
  final double kRadius16;
  final double kRadius14;
  final double kRadius18;
  final double kRadius20;
  final double kRadius28;
  final double kRadius32;
  final double kRadius36;
  final double kRadius45;
  final double kRadius54;
  final double kDefaultRadius;

//* <---------------------  Sizes

  final double kVerticalSize2;
  final double kVerticalSize4;
  final double kVerticalSize6;
  final double kVerticalSize8;
  final double kVerticalSize10;
  final double kVerticalSize12;
  final double kVerticalSize14;
  final double kVerticalSize16;
  final double kVerticalSize18;
  final double kVerticalSize20;
  final double kVerticalSize22;
  final double kVerticalSize24;
  final double kVerticalSize28;
  final double kVerticalSize32;
  final double kVerticalSize36;
  final double kVerticalSize38;
  final double kVerticalSize40;
  final double kVerticalSize42;
  final double kVerticalSize46;
  final double kVerticalSize48;
  final double kVerticalSize54;
  final double kVerticalSize56;
  final double kVerticalSize60;
  final double kVerticalSize64;
  final double kVerticalSize68;
  final double kVerticalSize72;
  final double kVerticalSize76;
  final double kVerticalSize84;
  final double kVerticalSize96;
  final double kHorizontalSize2;
  final double kHorizontalSize4;
  final double kHorizontalSize6;
  final double kHorizontalSize8;
  final double kHorizontalSize10;
  final double kHorizontalSize12;
  final double kHorizontalSize14;
  final double kHorizontalSize16;
  final double kHorizontalSize18;
  final double kHorizontalSize20;
  final double kHorizontalSize22;
  final double kHorizontalSize24;
  final double kHorizontalSize28;
  final double kHorizontalSize32;
  final double kHorizontalSize36;
  final double kHorizontalSize38;
  final double kHorizontalSize40;
  final double kHorizontalSize42;
  final double kHorizontalSize48;
  final double kHorizontalSize54;
  final double kHorizontalSize56;
  final double kHorizontalSize60;
  final double kHorizontalSize64;
  final double kHorizontalSize68;
  final double kHorizontalSize72;
  final double kHorizontalSize76;
  final double kHorizontalSize84;
  final double kHorizontalSize96;
  final double kHorizontalScreenPadding;
  final double kHorizontalLoginPadding;
  final double kHorizontalNoCirclesPadding;

  AppSizes._({
    required this.kRadius4,
    required this.kRadius8,
    required this.kRadius10,
    required this.kRadius12,
    required this.kRadius16,
    required this.kRadius14,
    required this.kRadius18,
    required this.kRadius20,
    required this.kRadius28,
    required this.kRadius32,
    required this.kRadius36,
    required this.kRadius45,
    required this.kRadius54,
    required this.kDefaultRadius,
    required this.kVerticalSize2,
    required this.kVerticalSize4,
    required this.kVerticalSize6,
    required this.kVerticalSize8,
    required this.kVerticalSize10,
    required this.kVerticalSize12,
    required this.kVerticalSize14,
    required this.kVerticalSize16,
    required this.kVerticalSize18,
    required this.kVerticalSize20,
    required this.kVerticalSize22,
    required this.kVerticalSize24,
    required this.kVerticalSize28,
    required this.kVerticalSize32,
    required this.kVerticalSize36,
    required this.kVerticalSize38,
    required this.kVerticalSize40,
    required this.kVerticalSize42,
    required this.kVerticalSize46,
    required this.kVerticalSize48,
    required this.kVerticalSize54,
    required this.kVerticalSize56,
    required this.kVerticalSize60,
    required this.kVerticalSize64,
    required this.kVerticalSize68,
    required this.kVerticalSize72,
    required this.kVerticalSize76,
    required this.kVerticalSize84,
    required this.kVerticalSize96,
    required this.kHorizontalSize2,
    required this.kHorizontalSize4,
    required this.kHorizontalSize6,
    required this.kHorizontalSize8,
    required this.kHorizontalSize10,
    required this.kHorizontalSize12,
    required this.kHorizontalSize14,
    required this.kHorizontalSize16,
    required this.kHorizontalSize18,
    required this.kHorizontalSize20,
    required this.kHorizontalSize22,
    required this.kHorizontalSize24,
    required this.kHorizontalSize28,
    required this.kHorizontalSize32,
    required this.kHorizontalSize36,
    required this.kHorizontalSize38,
    required this.kHorizontalSize40,
    required this.kHorizontalSize42,
    required this.kHorizontalSize48,
    required this.kHorizontalSize54,
    required this.kHorizontalSize56,
    required this.kHorizontalSize60,
    required this.kHorizontalSize64,
    required this.kHorizontalSize68,
    required this.kHorizontalSize72,
    required this.kHorizontalSize76,
    required this.kHorizontalSize84,
    required this.kHorizontalSize96,
    required this.kHorizontalScreenPadding,
    required this.kHorizontalLoginPadding,
    required this.kHorizontalNoCirclesPadding,
  });

  factory AppSizes.tablet() {
    return AppSizes._(
      kDefaultRadius: 40.r,
      kHorizontalSize10: 18.w,
      kHorizontalSize12: 20.w,
      kHorizontalSize14: 22.w,
      kHorizontalSize16: 28.w,
      kHorizontalSize18: 30.w,
      kHorizontalSize2: 4.w,
      kHorizontalSize20: 32.w,
      kHorizontalSize22: 40.w,
      kHorizontalSize24: 48.w,
      kHorizontalSize28: 52.w,
      kHorizontalSize32: 56.w,
      kHorizontalSize36: 66.w,
      kHorizontalSize38: 76.w,
      kHorizontalSize4: 8.w,
      kHorizontalSize40: 80.w,
      kHorizontalSize42: 88.w,
      kHorizontalSize48: 96.w,
      kHorizontalSize54: 98.w,
      kHorizontalSize56: 102.w,
      kHorizontalSize6: 12.w,
      kHorizontalSize60: 103.w,
      kHorizontalSize64: 104.w,
      kHorizontalSize68: 108.w,
      kHorizontalSize72: 112.w,
      kHorizontalSize76: 118.w,
      kHorizontalSize8: 16.w,
      kHorizontalSize84: 124.w,
      kHorizontalSize96: 130.w,
      kRadius10: 20.r,
      kRadius12: 24.r,
      kRadius14: 28.r,
      kRadius16: 32.r,
      kRadius18: 36.r,
      kRadius20: 40.r,
      kRadius28: 56.r,
      kRadius32: 64.r,
      kRadius36: 72.r,
      kRadius4: 8.r,
      kRadius45: 90.r,
      kRadius54: 108.r,
      kRadius8: 16.r,
      kVerticalSize10: 18.h,
      kVerticalSize12: 20.h,
      kVerticalSize14: 22.h,
      kVerticalSize16: 26.h,
      kVerticalSize18: 25.h,
      kVerticalSize2: 4.h,
      kVerticalSize20: 32.h,
      kVerticalSize22: 30.h,
      kVerticalSize24: 38.h,
      kVerticalSize28: 42.h,
      kVerticalSize32: 46.h,
      kVerticalSize36: 56.h,
      kVerticalSize38: 58.h,
      kVerticalSize4: 6.h,
      kVerticalSize40: 60.h,
      kVerticalSize42: 68.h,
      kVerticalSize46: 72.h,
      kVerticalSize48: 76.h,
      kVerticalSize54: 88.h,
      kVerticalSize56: 94.h,
      kVerticalSize6: 12.h,
      kVerticalSize60: 103.h,
      kVerticalSize64: 104.h,
      kVerticalSize68: 108.h,
      kVerticalSize72: 112.h,
      kVerticalSize76: 118.h,
      kVerticalSize8: 12.h,
      kVerticalSize84: 124.h,
      kVerticalSize96: 130.h,
      kHorizontalScreenPadding: 56.w,
      kHorizontalLoginPadding: 128.w,
      kHorizontalNoCirclesPadding: 128.w,
    );
  }

  factory AppSizes.mobile() {
    return AppSizes._(
      kDefaultRadius: 20.r,
      kHorizontalSize10: 10.w,
      kHorizontalSize12: 12.w,
      kHorizontalSize14: 14.w,
      kHorizontalSize16: 16.w,
      kHorizontalSize18: 18.w,
      kHorizontalSize2: 2.w,
      kHorizontalSize20: 20.w,
      kHorizontalSize22: 22.w,
      kHorizontalSize24: 24.w,
      kHorizontalSize28: 28.w,
      kHorizontalSize32: 32.w,
      kHorizontalSize36: 36.w,
      kHorizontalSize38: 38.w,
      kHorizontalSize4: 4.w,
      kHorizontalSize40: 40.w,
      kHorizontalSize42: 42.w,
      kHorizontalSize48: 48.w,
      kHorizontalSize54: 54.w,
      kHorizontalSize56: 56.w,
      kHorizontalSize6: 6.w,
      kHorizontalSize60: 60.w,
      kHorizontalSize64: 64.w,
      kHorizontalSize68: 68.w,
      kHorizontalSize72: 72.w,
      kHorizontalSize76: 76.w,
      kHorizontalSize8: 8.w,
      kHorizontalSize84: 84.w,
      kHorizontalSize96: 96.w,
      kRadius10: 10.r,
      kRadius12: 12.r,
      kRadius14: 14.r,
      kRadius16: 16.r,
      kRadius18: 18.r,
      kRadius20: 20.r,
      kRadius28: 28.r,
      kRadius32: 32.r,
      kRadius36: 36.r,
      kRadius4: 4.r,
      kRadius45: 45.r,
      kRadius54: 54.r,
      kRadius8: 8.r,
      kVerticalSize10: 10.h,
      kVerticalSize12: 12.h,
      kVerticalSize14: 14.h,
      kVerticalSize16: 16.h,
      kVerticalSize18: 18.h,
      kVerticalSize2: 2.h,
      kVerticalSize20: 20.h,
      kVerticalSize22: 22.h,
      kVerticalSize24: 24.h,
      kVerticalSize28: 28.h,
      kVerticalSize32: 32.h,
      kVerticalSize36: 36.h,
      kVerticalSize38: 38.h,
      kVerticalSize4: 4.h,
      kVerticalSize40: 40.h,
      kVerticalSize42: 42.h,
      kVerticalSize46: 46.h,
      kVerticalSize48: 48.h,
      kVerticalSize54: 54.h,
      kVerticalSize56: 56.h,
      kVerticalSize6: 6.h,
      kVerticalSize60: 60.h,
      kVerticalSize64: 64.h,
      kVerticalSize68: 68.h,
      kVerticalSize72: 72.h,
      kVerticalSize76: 76.h,
      kVerticalSize8: 8.h,
      kVerticalSize84: 84.h,
      kVerticalSize96: 96.h,
      kHorizontalScreenPadding: 16.w,
      kHorizontalLoginPadding: 16.w,
      kHorizontalNoCirclesPadding: 44.w,
    );
  }

  @override
  AppSizes copyWith() {
    return this;
  }

  @override
  AppSizes lerp(AppSizes? other, double t) {
    double lerpDouble(double? t1, double t2) {
      if (t1 == null) return t2;
      return t1 + (t2 - t1) * t;
    }

    return AppSizes._(
      kDefaultRadius: lerpDouble(other?.kDefaultRadius, kDefaultRadius),
      kHorizontalSize10:
      lerpDouble(other?.kHorizontalSize10, kHorizontalSize10),
      kHorizontalSize12:
      lerpDouble(other?.kHorizontalSize12, kHorizontalSize12),
      kHorizontalSize14:
      lerpDouble(other?.kHorizontalSize14, kHorizontalSize14),
      kHorizontalSize16:
      lerpDouble(other?.kHorizontalSize16, kHorizontalSize16),
      kHorizontalSize18:
      lerpDouble(other?.kHorizontalSize18, kHorizontalSize18),
      kHorizontalSize2: lerpDouble(other?.kHorizontalSize2, kHorizontalSize2),
      kHorizontalSize20:
      lerpDouble(other?.kHorizontalSize20, kHorizontalSize20),
      kHorizontalSize22:
      lerpDouble(other?.kHorizontalSize22, kHorizontalSize22),
      kHorizontalSize24:
      lerpDouble(other?.kHorizontalSize24, kHorizontalSize24),
      kHorizontalSize28:
      lerpDouble(other?.kHorizontalSize28, kHorizontalSize28),
      kHorizontalSize32:
      lerpDouble(other?.kHorizontalSize32, kHorizontalSize32),
      kHorizontalSize36:
      lerpDouble(other?.kHorizontalSize36, kHorizontalSize36),
      kHorizontalSize38:
      lerpDouble(other?.kHorizontalSize38, kHorizontalSize38),
      kHorizontalSize4: lerpDouble(other?.kHorizontalSize4, kHorizontalSize4),
      kHorizontalSize40:
      lerpDouble(other?.kHorizontalSize40, kHorizontalSize40),
      kHorizontalSize42:
      lerpDouble(other?.kHorizontalSize42, kHorizontalSize42),
      kHorizontalSize48:
      lerpDouble(other?.kHorizontalSize48, kHorizontalSize48),
      kHorizontalSize54:
      lerpDouble(other?.kHorizontalSize54, kHorizontalSize54),
      kHorizontalSize56:
      lerpDouble(other?.kHorizontalSize56, kHorizontalSize56),
      kHorizontalSize6: lerpDouble(other?.kHorizontalSize6, kHorizontalSize6),
      kHorizontalSize60:
      lerpDouble(other?.kHorizontalSize60, kHorizontalSize60),
      kHorizontalSize64:
      lerpDouble(other?.kHorizontalSize64, kHorizontalSize64),
      kHorizontalSize68:
      lerpDouble(other?.kHorizontalSize68, kHorizontalSize68),
      kHorizontalSize72:
      lerpDouble(other?.kHorizontalSize72, kHorizontalSize72),
      kHorizontalSize76:
      lerpDouble(other?.kHorizontalSize76, kHorizontalSize76),
      kHorizontalSize8: lerpDouble(other?.kHorizontalSize8, kHorizontalSize8),
      kHorizontalSize84:
      lerpDouble(other?.kHorizontalSize84, kHorizontalSize84),
      kHorizontalSize96:
      lerpDouble(other?.kHorizontalSize96, kHorizontalSize96),
      kRadius10: lerpDouble(other?.kRadius10, kRadius10),
      kRadius12: lerpDouble(other?.kRadius12, kRadius12),
      kRadius14: lerpDouble(other?.kRadius14, kRadius14),
      kRadius16: lerpDouble(other?.kRadius16, kRadius16),
      kRadius18: lerpDouble(other?.kRadius18, kRadius18),
      kRadius20: lerpDouble(other?.kRadius20, kRadius20),
      kRadius28: lerpDouble(other?.kRadius28, kRadius28),
      kRadius32: lerpDouble(other?.kRadius32, kRadius32),
      kRadius36: lerpDouble(other?.kRadius36, kRadius36),
      kRadius4: lerpDouble(other?.kRadius4, kRadius4),
      kRadius45: lerpDouble(other?.kRadius45, kRadius45),
      kRadius54: lerpDouble(other?.kRadius54, kRadius54),
      kRadius8: lerpDouble(other?.kRadius8, kRadius8),
      kVerticalSize10: lerpDouble(other?.kVerticalSize10, kVerticalSize10),
      kVerticalSize12: lerpDouble(other?.kVerticalSize12, kVerticalSize12),
      kVerticalSize14: lerpDouble(other?.kVerticalSize14, kVerticalSize14),
      kVerticalSize16: lerpDouble(other?.kVerticalSize16, kVerticalSize16),
      kVerticalSize18: lerpDouble(other?.kVerticalSize18, kVerticalSize18),
      kVerticalSize2: lerpDouble(other?.kVerticalSize2, kVerticalSize2),
      kVerticalSize20: lerpDouble(other?.kVerticalSize20, kVerticalSize20),
      kVerticalSize22: lerpDouble(other?.kVerticalSize22, kVerticalSize22),
      kVerticalSize24: lerpDouble(other?.kVerticalSize24, kVerticalSize24),
      kVerticalSize28: lerpDouble(other?.kVerticalSize28, kVerticalSize28),
      kVerticalSize32: lerpDouble(other?.kVerticalSize32, kVerticalSize32),
      kVerticalSize36: lerpDouble(other?.kVerticalSize36, kVerticalSize36),
      kVerticalSize38: lerpDouble(other?.kVerticalSize38, kVerticalSize38),
      kVerticalSize4: lerpDouble(other?.kVerticalSize4, kVerticalSize4),
      kVerticalSize40: lerpDouble(other?.kVerticalSize40, kVerticalSize40),
      kVerticalSize42: lerpDouble(other?.kVerticalSize42, kVerticalSize42),
      kVerticalSize46: lerpDouble(other?.kVerticalSize46, kVerticalSize46),
      kVerticalSize48: lerpDouble(other?.kVerticalSize48, kVerticalSize48),
      kVerticalSize54: lerpDouble(other?.kVerticalSize54, kVerticalSize54),
      kVerticalSize56: lerpDouble(other?.kVerticalSize56, kVerticalSize56),
      kVerticalSize6: lerpDouble(other?.kVerticalSize6, kVerticalSize6),
      kVerticalSize60: lerpDouble(other?.kVerticalSize60, kVerticalSize60),
      kVerticalSize64: lerpDouble(other?.kVerticalSize64, kVerticalSize64),
      kVerticalSize68: lerpDouble(other?.kVerticalSize68, kVerticalSize68),
      kVerticalSize72: lerpDouble(other?.kVerticalSize72, kVerticalSize72),
      kVerticalSize76: lerpDouble(other?.kVerticalSize76, kVerticalSize76),
      kVerticalSize8: lerpDouble(other?.kVerticalSize8, kVerticalSize8),
      kVerticalSize84: lerpDouble(other?.kVerticalSize84, kVerticalSize84),
      kVerticalSize96: lerpDouble(other?.kVerticalSize96, kVerticalSize96),
      kHorizontalScreenPadding: lerpDouble(
        other?.kHorizontalScreenPadding,
        kHorizontalScreenPadding,
      ),
      kHorizontalLoginPadding: lerpDouble(
        other?.kHorizontalLoginPadding,
        kHorizontalLoginPadding,
      ),
      kHorizontalNoCirclesPadding: lerpDouble(
        other?.kHorizontalNoCirclesPadding,
        kHorizontalNoCirclesPadding,
      ),
    );
  }
}
