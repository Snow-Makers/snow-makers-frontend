import 'package:flutter/material.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (context.isDesktop) {
      return desktop;
    } else if (context.isTablet && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
