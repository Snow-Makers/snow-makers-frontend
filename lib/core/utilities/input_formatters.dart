import 'package:flutter/services.dart';

class InputFormatters {
  static final phoneInputFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r"^\+?0[0-9]{10}$")),
  ];

  static final nameInputFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
  ];
}
