part of '../screens/register_screen.dart';

class _RegisterActions extends ConsumerWidget {
  const _RegisterActions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerController = ref.read(AuthViewModel.provider.notifier);
    return Column(
      children: [
        20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
            onPressed: () => registerController.register(),
            child: Text(
              LocaleKeys.signup_signup.tr(),
            ),
          ),
        ),
        30.verticalSpace,
        GestureDetector(
          onTap: () async => context.pop(),
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.signup_alreadyHaveAnAccount.tr(),
              style: context.appTextStyles.bodySmall,
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: LocaleKeys.signup_login.tr(),
                  style: context.appTextStyles.bodyLarge.copyWith(
                    fontSize: 14,
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
