part of '../screens/add_reservation_screen.dart';

class _AddReservationAction extends ConsumerWidget {
  final String unitId;

  const _AddReservationAction(this.unitId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(ReservationProvider.provider.notifier)
                  .addReservation(unitId);
            },
            child: Text(
              LocaleKeys.addReservation_save.tr(),
            ),
          ),
          TextButton(
            onPressed: () => context.go('/'),
            child: Text(
              LocaleKeys.addReservation_skip.tr(),
            ),
          )
        ],
      ),
    );
  }
}
