import 'package:flutter/material.dart';

mixin UiHelpers {
  static void postBuildCallback(void Function(Duration) callback) {
    WidgetsBinding.instance.addPostFrameCallback(callback);
  }
}
