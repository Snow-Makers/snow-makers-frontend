import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage fadeAnimationPage({
  required LocalKey pageKey,
  required Widget screen,
}) =>
    CustomTransitionPage(
      key: pageKey,
      child: screen,
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
