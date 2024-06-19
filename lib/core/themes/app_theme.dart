import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/app_theme_notifiers.dart';
import 'package:snowmakers/core/themes/app_sizes.dart';
import 'package:snowmakers/core/themes/app_text_styles.dart';
import 'package:snowmakers/core/themes/data.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

class AppTheme extends StatelessWidget {
  final Widget Function(ThemeData theme) builder;

  const AppTheme({super.key, required this.builder});

  static AppThemeData? maybeOf(BuildContext context) {
    return context.theme.extension<AppThemeData>();
  }

  static AppThemeData of(BuildContext context) {
    return maybeOf(context)!;
  }

  static AppSizes? maybeSizesOf(BuildContext context) {
    return context.theme.extension<AppSizes>();
  }

  static AppSizes sizesOf(BuildContext context) {
    return maybeSizesOf(context)!;
  }

  static AppTextStyles? maybeTextStyleOf(BuildContext context) {
    return context.theme.extension<AppTextStyles>();
  }

  static AppTextStyles textStyleOf(BuildContext context) {
    return maybeTextStyleOf(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final theme = ref.watch(
          AppThemeNotifier.provider.select(
            (value) => value.createTheme(context),
          ),
        );
        return builder(theme);
      },
    );
  }
}
