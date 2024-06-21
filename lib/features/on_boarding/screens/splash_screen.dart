import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:snowmakers/core/themes/app_assets.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => context.go('/login'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LottieBuilder.asset(
        AppAssets.snow,
        fit: BoxFit.cover,
        width: context.width,
        height: context.height,
      ),
    );
  }
}
