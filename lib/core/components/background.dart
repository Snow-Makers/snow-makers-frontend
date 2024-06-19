import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:snowmakers/core/themes/app_assets.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      AppAssets.darkBackground,
      fit: BoxFit.cover,
      height: context.height,
      width: context.width,
    );
  }
}
