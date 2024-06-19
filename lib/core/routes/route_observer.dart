import 'package:flutter/cupertino.dart';

class AppRouteObserver extends NavigatorObserver {

  final List<Route> _routes = [];

  bool get isEmpty => _routes.isEmpty;

  Route? get current {
    if (_routes.isNotEmpty) {
      return _routes.last;
    }
    return null;
  }

  Route? get last {
    if (_routes.length > 1) {
      return _routes[_routes.length - 2];
    }
    return null;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _addRoute(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routes.remove(route);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routes.remove(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (oldRoute != null) {
      if (_routes.contains(oldRoute)) {
        final index = _routes.indexOf(oldRoute);
        if (newRoute != null) {
          _routes[index] = newRoute;
        } else {
          _routes.remove(oldRoute);
        }
      }
    } else if (newRoute != null) {
      _addRoute(newRoute);
    }
  }

  void _addRoute(Route<dynamic> route) {
    if (!_routes.contains(route)) {
      _routes.add(route);
    }
  }
}
