import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:snowmakers/core/utilities/extensions.dart';
import 'package:snowmakers/core/utilities/ui_alerts.dart';
import 'package:snowmakers/features/authentication/providers/authentication_notifier.dart';
import 'package:snowmakers/features/authentication/providers/authentication_provider.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

import '../utilities/snackbar.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(AuthenticationNotifier.provider);
    ref.listen(AuthViewModel.provider, (previous, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.isSuccess) {
        context.loaderOverlay.hide();
        context.go('/login');
      } else if (next.isFailed) {
        context.loaderOverlay.hide();
        CustomSnackBar.showError(context, next.error.toString());
      }
    });
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.w,
          horizontal: 16.h,
        ),
        child: SafeArea(
          child: Column(
            children: [
              userState.when(
                data: (user) => Column(
                  children: [
                    user.photoUrl == null
                        ? CircleAvatar(
                            radius: 50.r,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              CupertinoIcons.person_alt_circle,
                              size: 50.h,
                            ),
                          )
                        : CircleAvatar(
                            radius: 50.r,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(user.photoUrl!),
                          ),
                    SizedBox(height: 10.h),
                    Text(
                      user.name ?? '',
                      style: context.appTextStyles.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                loading: () => const SizedBox(),
                error: (error) => Text(error),
              ),
              30.verticalSpace,
              ListTile(
                leading: const Icon(
                  CupertinoIcons.person_alt_circle,
                ),
                title: Text(
                  LocaleKeys.drawer_profile.tr(),
                  style: context.appTextStyles.bodyLarge,
                ),
                dense: false,
                onTap: () => context.push('/profile'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.ac_unit_rounded,
                ),
                title: Text(
                  LocaleKeys.drawer_addUnit.tr(),
                  style: context.appTextStyles.bodyLarge,
                ),
                dense: false,
                onTap: () => context.push('/addUnit',extra: false),
              ),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.calendar,
                ),
                title: Text(
                  LocaleKeys.drawer_reservations.tr(),
                  style: context.appTextStyles.bodyLarge,
                ),
                dense: false,
                onTap: () => context.push('/myReservations'),
              ),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.settings,
                ),
                title: Text(
                  LocaleKeys.drawer_settings.tr(),
                  style: context.appTextStyles.bodyLarge,
                ),
                dense: false,
                onTap: () => context.push('/settings'),
              ),
              const Spacer(),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text(
                  LocaleKeys.drawer_logout.tr(),
                  style: context.appTextStyles.bodyLarge,
                ),
                dense: false,
                onTap: () {
                  UiAlerts.logoutDialog(
                    context,
                    onClick: () {
                      ref.read(AuthViewModel.provider.notifier).logout();
                    },
                    title: LocaleKeys.logout_title.tr(),
                    content: LocaleKeys.logout_subTitle.tr(),
                    onClickTitle: LocaleKeys.logout_logout.tr(),
                  );
                },
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
