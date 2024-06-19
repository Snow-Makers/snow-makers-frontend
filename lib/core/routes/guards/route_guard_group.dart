import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:snowmakers/core/routes/guards/route_guard.dart';

class RouteGuardGroup extends RouteGuard {

  const RouteGuardGroup(this._guards);
  final List<RouteGuard> _guards;

  @override
  FutureOr<String?> call(BuildContext context, GoRouterState state) {
    for (final guard in _guards) {
      final redirect = guard(context, state);
      if (redirect != null) return redirect;
    }
    return null;
  }
}
