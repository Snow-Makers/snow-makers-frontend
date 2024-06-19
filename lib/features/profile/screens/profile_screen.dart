import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:snowmakers/core/components/text_input_field.dart';
import 'package:snowmakers/core/components/widget_life_cycle_listener.dart';
import 'package:snowmakers/core/utilities/input_formatters.dart';
import 'package:snowmakers/core/utilities/snackbar.dart';
import 'package:snowmakers/core/utilities/ui_alerts.dart';
import 'package:snowmakers/core/utilities/validations.dart';
import 'package:snowmakers/features/authentication/providers/authentication_notifier.dart';
import 'package:snowmakers/features/profile/providers/edit_profile_holder.dart';
import 'package:snowmakers/features/profile/providers/edit_profile_provider.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(AuthenticationNotifier.provider);
    final editProfileDataHolder = ref.read(EditProfileHolder.provider.notifier);

    ref.listen(
      EditProfileProvider.provider,
      (previous, next) {
        if (next.isLoading) {
          context.loaderOverlay.show();
        } else if (next.isSuccess) {
          context.loaderOverlay.hide();
          CustomSnackBar.showSuccess(context, "Profile updated successfully");
          ref.read(AuthenticationNotifier.provider.notifier).getCurrentUser();
          context.pop();
        } else if (next.isFailed) {
          context.loaderOverlay.hide();
          CustomSnackBar.showError(
            context,
            next.error.toString(),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.profile_title.tr(),
        ),
      ),
      body: FadeIn(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SafeArea(
            child: authState.when(
              data: (user) => WidgetLifecycleListener(
                onInit: () {
                  editProfileDataHolder.emailController.text = user.email ?? '';
                  editProfileDataHolder.nameController.text = user.name ?? '';
                },
                onDispose: () {
                  editProfileDataHolder.clearImage();
                },
                child: Form(
                  key: editProfileDataHolder.formKey,
                  onChanged: () {
                    ref.read(isProfileChangedProvider.notifier).state =
                        editProfileDataHolder.formKey.currentState!.validate();
                  },
                  child: Column(
                    children: [
                      30.verticalSpace,
                      _Image(user.photoUrl),
                      20.verticalSpace,
                      TextInputField(
                        controller: editProfileDataHolder.nameController,
                        label: LocaleKeys.addReservation_name.tr(),
                        hint: 'Snow Makers',
                        validator: (value) =>
                            value!.validate([validateRequired,validateName]),
                      ),
                      20.verticalSpace,
                      TextInputField(
                        label: LocaleKeys.addReservation_email.tr(),
                        hint: 'example@example.com',
                        readOnly: true,
                        controller: editProfileDataHolder.emailController,
                        validator: (value) =>
                            value!.validate([validateRequired,validateEmail]),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ref
                                      .watch(isProfileChangedProvider) ||
                                  ref.watch(EditProfileHolder.provider).image !=
                                      null
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                        onPressed: () {
                          ref.read(EditProfileProvider.provider.notifier).edit();
                        },
                        child: Text(
                          LocaleKeys.profile_save.tr(),
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.pop(),
                        child: Text(
                          LocaleKeys.profile_cancel.tr(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e) => Text(
                e.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final isProfileChangedProvider = StateProvider<bool>((ref) => false);

class _Image extends ConsumerWidget {
  final String? image;

  const _Image(
    this.image,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileImage = ref.watch(EditProfileHolder.provider).image;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            UiAlerts.pickImageDialog(context, ref);
          },
          child: fileImage != null
              ? CircleAvatar(
                  radius: 70.r,
                  backgroundImage: FileImage(
                    fileImage,
                  ),
                )
              : image != null
                  ? CircleAvatar(
                      radius: 70.r,
                      backgroundImage: NetworkImage(
                        image!,
                      ),
                    )
                  : CircleAvatar(
                      radius: 70.r,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        CupertinoIcons.person_alt_circle,
                        size: 50.h,
                      ),
                    ),
        ),
        Positioned(
          bottom: 5.h,
          right: 5.w,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: Colors.blueAccent,
            child: Icon(
              CupertinoIcons.camera,
              size: 15.h,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
