import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:snowmakers/core/components/inherited_widget_ref.dart';
import 'package:snowmakers/core/routes/guards/route_guard.dart';
import 'package:snowmakers/features/units/providers/units_provider.dart';

class AuthenticationGuard extends RouteGuard {
  const AuthenticationGuard();

  @override
  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    final ref = InheritedWidgetRef.of(context);
    if (FirebaseAuth.instance.currentUser != null) {
      final haveUnits =
          await ref.read(UnitsProvider.provider.notifier).haveUnit();
      if (haveUnits) {
        return '/';
      } else {
        return '/addUnit';
      }
    }
    return null;
  }
}
