part of '../screens/login_screen.dart';

class _LoginActions extends ConsumerWidget {
  const _LoginActions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.read(AuthViewModel.provider.notifier);

    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              context.push('/forgetPassword');
            },
            child: Text(
              LocaleKeys.login_forgotPassword.tr(),
              style: context.appTextStyles.titleLarge,
            ),
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
            onPressed: () => loginController.login(),
            child: Text(
              LocaleKeys.login_login.tr(),
            ),
          ),
        ),
        20.verticalSpace,
        Row(
          children: [
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
            20.horizontalSpace,
            Text(
              LocaleKeys.login_or.tr(),
              style: context.appTextStyles.titleLarge,
            ),
            20.horizontalSpace,
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
          ],
        ),
        10.verticalSpace,
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             if(Platform.isIOS) IconButton(
                onPressed: () => loginController.loginWithApple(),
                icon: const Icon(
                  Icons.apple,
                  color: Colors.white,
                ),
              ),
              if(Platform.isIOS) 30.horizontalSpace,
              IconButton(
                onPressed: () => loginController.loginWithGoogle(),
                icon: SvgPicture.asset(
                  AppAssets.google,
                  color: Colors.white,
                  height: 18.h,
                  width: 18.w,
                ),
              ),
            ],
          ),
        ),
        30.verticalSpace,
        GestureDetector(
          onTap: () async => context.push('/register'),
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.login_alreadyHaveAnAccount.tr(),
              style: context.appTextStyles.bodySmall,
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: LocaleKeys.login_signUp.tr(),
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
