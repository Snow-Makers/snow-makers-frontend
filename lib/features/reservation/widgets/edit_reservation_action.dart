part of '../screens/edit_reservation_screen.dart';

class _EditReservationAction extends ConsumerWidget {
  final Reservation reservation;

  const _EditReservationAction(this.reservation);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              ref.read(ReservationProvider.provider.notifier).updateReservation(
                    reservation,
                  );
            },
            child: Text(
              LocaleKeys.addReservation_save.tr(),
            ),
          ),
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              LocaleKeys.addReservation_skip.tr(),
            ),
          )
        ],
      ),
    );
  }
}
