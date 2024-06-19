import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

mixin AppLocale {
  static const arabic = Locale('ar', 'EG');
  static const english = Locale('en', 'US');
  static const locales = [arabic, english];
}

extension LocaleUtils on BuildContext {
  Locale get langCodeLocale {
    return Locale(locale.languageCode);
  }
}
