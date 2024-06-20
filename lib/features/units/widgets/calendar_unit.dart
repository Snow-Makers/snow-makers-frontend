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
          if (reservation.isNotEmpty) {
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
  final List<Reservation> reservations;

  const _Calendar(
    this.reservations,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialSelectedRanges = reservations.expand((reservation) {
      return reservation.dates.map((date) {
        final startDate = DateTime.parse(date.split(' - ')[0]);
        final endDate = DateTime.parse(date.split(' - ')[1]);
        return PickerDateRange(startDate, endDate);
      });
    }).toList();

    return IgnorePointer(
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.multiRange,
        headerStyle: const DateRangePickerHeaderStyle(
          backgroundColor: Colors.transparent,
        ),
        // show the nearest date
        initialDisplayDate: DateTime.parse(
          initialSelectedRanges
              .map((e) => e.endDate)
              .reduce((min, max) => min)
              .toString(),
        ),
        
        backgroundColor: Colors.transparent,
        initialSelectedRanges: initialSelectedRanges,
        showTodayButton: false,
        showActionButtons: false,
        showNavigationArrow: false,
      ),
    );
  }
}
