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
import 'package:snowmakers/features/authentication/providers/register_holder.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

part '../widgets/register_form.dart';

part '../widgets/register_actions.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(AuthViewModel.provider, (previous, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.isSuccess) {
        context.loaderOverlay.hide();
        CustomSnackBar.showSuccess(context, "Registration Successful");
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
      body: Align(
        alignment: Alignment.bottomCenter,
        child: FadeIn(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  context.appTheme.logo,
                  height: 200.h,
                  width: 200.w,
                ),
                30.verticalSpace,
                FadeInUp(
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
                              _RegisterForm(),
                              _RegisterActions(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
