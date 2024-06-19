import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:snowmakers/core/components/inherited_widget_ref.dart';
import 'package:snowmakers/core/routes/custom_routes.dart';
import 'package:snowmakers/core/themes/app_theme.dart';
import 'package:snowmakers/core/utilities/extensions.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final _appRouter = ref.watch(AppRouter.provider);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return InheritedWidgetRef(
      child: ScreenUtilInit(
        designSize: context.calculateDesignSize(),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return AppTheme(
            builder: (theme) {
              return GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: GlobalLoaderOverlay(
                  overlayColor: Colors.black54,
                  child: MaterialApp.router(
                    onGenerateTitle: (context) {
                      return LocaleKeys.appName.tr();
                    },
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    routeInformationProvider:
                    _appRouter.routeInformationProvider,
                    routerDelegate: _appRouter.routerDelegate,
                    routeInformationParser: _appRouter.routeInformationParser,
                    theme: theme,
                    builder: (context, child) => ResponsiveBreakpoints.builder(
                      child: child!,
                      breakpoints: [
                        const Breakpoint(start: 0, end: 450, name: MOBILE),
                        const Breakpoint(start: 451, end: 800, name: TABLET),
                        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
