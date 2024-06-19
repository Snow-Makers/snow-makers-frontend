import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:snowmakers/core/components/text_input_field.dart';
import 'package:snowmakers/core/themes/app_assets.dart';
import 'package:snowmakers/core/utilities/extensions.dart';
import 'package:snowmakers/core/utilities/snackbar.dart';
import 'package:snowmakers/core/utilities/validations.dart';
import 'package:snowmakers/features/authentication/providers/authentication_provider.dart';
import 'package:snowmakers/features/authentication/providers/login_holder.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

part '../widgets/login_form.dart';
part '../widgets/login_actions.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.listen(AuthViewModel.provider, (previous, next) {
      if(next.isLoading){
        context.loaderOverlay.show();
      }
      else if (next.isSuccess) {
        context.loaderOverlay.hide();
        CustomSnackBar.showSuccess(
            context, "Login Successful");
        context.go('/');
      } else if (next.isFailed) {
        context.loaderOverlay.hide();
        CustomSnackBar.showError(
          context,
          next.error.toString(),
        );
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FadeIn(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            30.verticalSpace,
            Image.asset(
              context.appTheme.logo,
              height: 200.h,
              width: 200.w,
            ),
            FadeInUp(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SizedBox(
                    width: context.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: const SafeArea(
                        top: false,
                        child: Column(
                          children: [
                            _LoginForm(),
                            _LoginActions(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
