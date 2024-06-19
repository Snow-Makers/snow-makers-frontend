part of '../screens/add_unit_screen.dart';

class _AddUnitAction extends ConsumerWidget {
  const _AddUnitAction();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
        onPressed: () async {
          await ref.read(UnitsProvider.provider.notifier).addUnit();
        },
        child: Text(
          LocaleKeys.addUnit_save.tr(),
        ),
      ),
    );
  }
}
