import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snowmakers/core/routes/animation/fade_animation_page.dart';
import 'package:snowmakers/core/routes/guards/authentication_guard.dart';
import 'package:snowmakers/core/routes/guards/units_guard.dart';
import 'package:snowmakers/core/routes/route_observer.dart';
import 'package:snowmakers/features/authentication/screens/forget_password_screen.dart';
import 'package:snowmakers/features/authentication/screens/login_screen.dart';
import 'package:snowmakers/features/authentication/screens/register_screen.dart';
import 'package:snowmakers/features/on_boarding/screens/splash_screen.dart';
import 'package:snowmakers/features/profile/screens/profile_screen.dart';
import 'package:snowmakers/features/profile/screens/settings_screen.dart';
import 'package:snowmakers/features/reservation/models/reservation.dart';
import 'package:snowmakers/features/reservation/screens/add_reservation_screen.dart';
import 'package:snowmakers/features/reservation/screens/edit_reservation_screen.dart';
import 'package:snowmakers/features/reservation/screens/my_reservations_screen.dart';
import 'package:snowmakers/features/units/screens/add_unit_screen.dart';
import 'package:snowmakers/features/units/screens/units_screen.dart';
import 'package:snowmakers/features/units/widgets/map_screen.dart';

mixin AppRouter {
  static final observerProvider = Provider((ref) {
    return AppRouteObserver();
  });
  static final navigatorKey = GlobalKey<NavigatorState>();

  static String getInitialRoute() {
    if (kIsWeb) {
      return '/login';
    } else {
      return '/splash';
    }
  }

  static final provider = Provider(
    (ref) {
      final observer = ref.watch(observerProvider);
      return GoRouter(
        initialLocation: getInitialRoute(),
        observers: [observer],
        navigatorKey: navigatorKey,
        routes: [
          GoRoute(
            path: '/splash',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: const SplashScreen(),
              );
            },
          ),
          GoRoute(
            path: '/login',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: const LoginScreen(),
              );
            },
            redirect: (context, state) {
              if (!kIsWeb) {
                return const AuthenticationGuard().call(context, state);
              }
              return null;
            },
          ),
          GoRoute(
            path: '/register',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: const RegisterScreen(),
              );
            },
          ),
          GoRoute(
            path: '/forgetPassword',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: const ForgetPasswordScreen(),
              );
            },
          ),
          GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: const UnitsScreen(),
              );
            },
            redirect: (context, state) {
              return const UnitsGuard().call(context, state);
            },
          ),
          GoRoute(
            path: '/addUnit',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: AddUnitScreen(
                  isFirstUnit: (state.extra ?? true) as bool,
                ),
              );
            },
          ),
          GoRoute(
            path: '/maps',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: const MapViewScreen(),
              );
            },
          ),
          GoRoute(
            path: '/addReservation',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: AddReservationScreen(
                  unitId: state.extra as String,
                ),
              );
            },
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: const ProfileScreen(),
              );
            },
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: const SettingsScreen(),
              );
            },
          ),
          GoRoute(
            path: '/myReservations',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: const MyReservationScreen(),
              );
            },
          ),
          GoRoute(
            path: '/editReservation',
            pageBuilder: (context, state) {
              return fadeAnimationPage(
                pageKey: state.pageKey,
                screen: EditReservationScreen(
                  reservation:
                      Reservation.fromJson(state.extra as Map<String, dynamic>),
                ),
              );
            },
          ),
        ],
        redirect: (context, state) {
          if (kIsWeb) {
            return const AuthenticationGuard().call(context, state);
          }

          return null;
        },
      );
    },
  );
}
