import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:snowmakers/core/components/text_input_field.dart';
import 'package:snowmakers/core/utilities/extensions.dart';
import 'package:snowmakers/core/utilities/snackbar.dart';
import 'package:snowmakers/core/utilities/validations.dart';
import 'package:snowmakers/features/authentication/providers/authentication_provider.dart';
import 'package:snowmakers/features/authentication/providers/forget_password_holder.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

class ForgetPasswordScreen extends ConsumerWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgetPasswordController = ref.read(AuthViewModel.provider.notifier);
    final forgetPasswordDataHolder =
        ref.read(ForgetPasswordHolder.provider.notifier);

    ref.listen(AuthViewModel.provider, (previous, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.isSuccess) {
        context.loaderOverlay.hide();
        CustomSnackBar.showSuccess(
            context, "Password reset link has been sent to your email address");
        context.pop();
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Center(
              child: Column(
                children: [
                  40.verticalSpace,
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  Image.asset(
                    context.appTheme.logo,
                    height: 200.h,
                    width: 200.w,
                  ),

                  Form(
                    key: forgetPasswordDataHolder.formKey,
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            20.verticalSpace,
                            Text(
                              LocaleKeys.forgetPassword_title.tr(),
                              style: context.appTextStyles.displayLarge
                                  .copyWith(height: 0),
                            ),
                            8.verticalSpace,
                            Text(
                              LocaleKeys.forgetPassword_subTitle.tr(),
                              style: context.appTextStyles.titleMedium.copyWith(
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            20.verticalSpace,
                            TextInputField(
                              label: LocaleKeys.forgetPassword_email.tr(),
                              hint: 'example@example.com',
                              controller: forgetPasswordDataHolder.email,
                              validator: (value) => value!.validate([
                                validateRequired,
                                validateEmail,
                              ]),
                            ),
                            20.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await forgetPasswordController.resetPassword();
                                },
                                child: Text(
                                  LocaleKeys.forgetPassword_forget.tr(),
                                ),
                              ),
                            ),
                            20.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
