part of '../screens/login_screen.dart';

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginHolder = ref.read(LoginHolder.provider.notifier);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Form(
        key: loginHolder.formKey,
        child: Column(
          children: [
            20.verticalSpace,
            Text(
              LocaleKeys.login_title.tr(),
              style: context.appTextStyles.displayLarge.copyWith(height: 0),
            ),
            Text(
              LocaleKeys.login_subtitle.tr(),
              style: context.appTextStyles.titleMedium.copyWith(
                color: Colors.grey,
              ),
            ),
            20.verticalSpace,
            TextInputField(
              label: LocaleKeys.login_username.tr(),
              hint: 'example@example.com',
              controller: loginHolder.email,
              validator: (value) => value!.validate([validateRequired,validateEmail]),

            ),
            20.verticalSpace,
            TextInputField(
              label: LocaleKeys.login_password.tr(),
              isPassword: true,
              hint: '********',
              controller: loginHolder.password,
              validator: (value) => value!.validate([validateRequired]),

            ),
          ],
        ),
      ),
    );
  }
}
