import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snowmakers/core/utilities/extensions.dart';
import 'package:snowmakers/features/profile/providers/edit_profile_holder.dart';

mixin UiAlerts {
  static void logoutDialog(
    BuildContext context, {
    required void Function()? onClick,
    required String title,
    required String content,
    required String onClickTitle,
  }) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
          ),
          content: Text(
            content,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Cancel', style: context.appTextStyles.bodyMedium),
            ),
            TextButton(
              onPressed: onClick,
              child: Text(
                onClickTitle,
                style: context.appTextStyles.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  static void pickImageDialog(BuildContext context, WidgetRef ref) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(
            'Pick Image',
          ),
          content: const Text(
            'Choose from gallery or camera',
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
                ref.read(EditProfileHolder.provider.notifier).pickGallery();
              },
              child: Text('Gallery', style: context.appTextStyles.bodyMedium),
            ),
            TextButton(
              onPressed: () {
                context.pop();
                ref.read(EditProfileHolder.provider.notifier).pickCamera();
              },
              child: Text('Camera', style: context.appTextStyles.bodyMedium),
            ),
          ],
        );
      },
    );
  }
}
