part of '../screens/units_screen.dart';

class _CalendarUnit extends ConsumerWidget {
  final String unitId;

  const _CalendarUnit({
    required this.unitId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationState = ref.watch(ReservationNotifier.provider(unitId));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: reservationState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (reservation) {
          if (reservation != null) {
            return Card(
              child: Column(
                children: [
                  16.verticalSpace,
                  Text(
                    "Calendar",
                    style: context.appTextStyles.titleLarge,
                  ),
                  16.verticalSpace,
                  _Calendar(reservation),
                  16.verticalSpace,
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
        error: (message) => Center(
          child: Text(message),
        ),
      ),
    );
  }
}

class _Calendar extends ConsumerWidget {
  final Reservation reservation;

  const _Calendar(
    this.reservation,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime startDate = DateTime.parse(reservation.dates.first);
    final DateTime endDate = reservation.dates.length == 1
        ? startDate
        : DateTime.parse(reservation.dates.last);
    return IgnorePointer(
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.range,
        headerStyle: const DateRangePickerHeaderStyle(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        initialSelectedRange: PickerDateRange(
          startDate,
          endDate,
        ),
      ),
    );
  }
}
