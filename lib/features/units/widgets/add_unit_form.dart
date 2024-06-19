part of '../screens/add_unit_screen.dart';

class _AddUnitForm extends ConsumerWidget {
  const _AddUnitForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsHolder = ref.read(UnitsHolder.provider.notifier);
    return Form(
      key: unitsHolder.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            20.verticalSpace,
            Text(
              LocaleKeys.addUnit_title.tr(),
              style: context.appTextStyles.displayLarge.copyWith(height: 0),
            ),
            8.verticalSpace,
            Text(
              LocaleKeys.addUnit_subTitle.tr(),
              style: context.appTextStyles.titleMedium.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            TextInputField(
              label: LocaleKeys.addUnit_modelId.tr(),
              hint: 'Example: ABC123',
              controller: unitsHolder.unitId,
              validator: (value) => value!.validate([validateRequired]),
            ),
            20.verticalSpace,
            TextInputField(
              label: LocaleKeys.addUnit_password.tr(),
              isPassword: true,
              hint: '********',
              controller: unitsHolder.unitPassword,
              validator: (value) => value!.validate([validateRequired]),
            ),
            20.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextInputField(
                    label: LocaleKeys.addUnit_location.tr(),
                    hint: 'Example: San Diego, California, USA',
                    controller: TextEditingController(text: ref.watch(UnitsHolder.provider).addressName),
                    readOnly: true,
                    validator: (value) => value!.validate([validateRequired]),
                  ),
                ),
                20.horizontalSpace,
                Padding(
                  padding: EdgeInsets.only(bottom: 6.h),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/maps');
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 20.r,
                      child: const Center(
                        child: Icon(
                          Icons.my_location_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            60.verticalSpace,
          ],
        ),
      ),
    );
  }
}
