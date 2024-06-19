part of '../screens/register_screen.dart';

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerHolder = ref.watch(RegisterHolder.provider.notifier);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Form(
        key: registerHolder.formKey,
        child: Column(
          children: [
            20.verticalSpace,
            Text(
              LocaleKeys.signup_title.tr(),
              style: context.appTextStyles.displayLarge.copyWith(height: 0),
            ),
            Text(
              LocaleKeys.signup_subtitle.tr(),
              style: context.appTextStyles.titleMedium.copyWith(
                color: Colors.grey,
              ),
            ),
            20.verticalSpace,
            TextInputField(
              label: LocaleKeys.signup_name.tr(),
              hint: 'Snow Makers',
              controller: registerHolder.name,
              inputType: TextInputType.name,
              validator: (value) =>
                  value!.validate([validateRequired, validateName]),
            ),
            20.verticalSpace,
            TextInputField(
              label: LocaleKeys.login_username.tr(),
              hint: 'example@example.com',
              controller: registerHolder.email,
              validator: (value) => value!.validate([
                validateRequired,
                validateEmail,
              ]),
            ),
            20.verticalSpace,
            TextInputField(
              label: LocaleKeys.login_password.tr(),
              isPassword: true,
              hint: '********',
              controller: registerHolder.password,
              validator: (value) => value!.validate([validateRequired]),
            ),
          ],
        ),
      ),
    );
  }
}
