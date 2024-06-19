import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:snowmakers/core/utilities/snackbar.dart';
import 'package:snowmakers/core/utilities/ui_alerts.dart';
import 'package:snowmakers/features/authentication/providers/authentication_provider.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(AuthViewModel.provider.notifier);

    ref.listen(AuthViewModel.provider, (previous, next) {
      if(next.isLoading){
        context.loaderOverlay.show();
      } else if (next.isSuccess) {
        context.loaderOverlay.hide();
        CustomSnackBar.showSuccess(context, "user deleted successfully");
        context.go('/login');
      } else if (next.isFailed) {
        context.loaderOverlay.hide();
        CustomSnackBar.showError(context, next.error.toString());
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.settings_title.tr(),
        ),
      ),
      body: FadeIn(
        child: SafeArea(
          child: Column(
            children: [
              // rate us
              ListTile(
                leading: const Icon(
                  Icons.rate_review_outlined,
                ),
                title: Text(
                  LocaleKeys.drawer_rateApp.tr(),
                ),
                onTap: () async {
                  final InAppReview inAppReview = InAppReview.instance;
                   inAppReview.requestReview();
                },
              ),
              // delete account
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                ),
                title: Text(
                  LocaleKeys.drawer_deleteAccount.tr(),
                ),
                onTap: () {
                  UiAlerts.logoutDialog(
                    context,
                    onClick: () {
                      authController.deleteAccount();
                    },
                    title: LocaleKeys.drawer_deleteAccount.tr(),
                    content: LocaleKeys.settings_deleteAccountSubTitle.tr(),
                    onClickTitle: LocaleKeys.settings_delete.tr(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
