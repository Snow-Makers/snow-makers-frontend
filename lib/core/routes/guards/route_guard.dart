import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class RouteGuard {
  const RouteGuard();

  FutureOr<String?> call(BuildContext context, GoRouterState state);
}

/// for example
/*
class AuthenticationGuard extends RouteGuard {


  const AuthenticationGuard();

  @override
  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    final isExpired = ServiceLocator.instance<SessionExpiredController>();
    if (isExpired) {
      return LoginRoute().location;
    }
    return null;
  }

/// example
@override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
     return const AuthenticationGuard().call(context, state);
   }

}
 */
