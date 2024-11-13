part of '../screens/edit_reservation_screen.dart';

class _EditReservationForm extends ConsumerWidget {
  final Reservation reservation;

  const _EditReservationForm(
    this.reservation,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationController = ref.read(ReservationHolder.provider.notifier);
    final reservations =
        ref.watch(ReservationNotifier.provider(reservation.unitId)).getData();
    return WidgetLifecycleListener(
      onInit: () {
        reservationController.name.text = reservation.name;
        reservationController.email.text = reservation.email;
        reservationController.phone.text = reservation.phone ?? '';
        reservationController.dates = reservation.dates;
        reservationController.selectedDates =
            reservations?.expand((reservation) {
                  return reservation.dates;
                }).toList() ??
                [];
      },
      child: Form(
        key: reservationController.editFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              20.verticalSpace,
              TextInputField(
                controller: reservationController.name,
                label: LocaleKeys.addReservation_name.tr(),
                hint: 'SnowBnB',
                inputType: TextInputType.name,
                validator: (value) => value!.validate([
                  validateRequired,
                  validateName,
                ]),
              ),
              20.verticalSpace,
              TextInputField(
                label: LocaleKeys.addReservation_email.tr(),
                hint: 'example@example.com',
                controller: reservationController.email,
                validator: (value) => value!.validate([
                  validateRequired,
                  validateEmail,
                ]),
              ),
              20.verticalSpace,
              TextInputField(
                label: LocaleKeys.addReservation_phone.tr(),
                hint: '+1 123 456 7890',
                controller: reservationController.phone,
                inputType: TextInputType.phone,
                validator: (value) => value!.validate([
                  validateRequired,
                  validatePhoneNumber,
                ]),
              ),
              20.verticalSpace,
              _DateField(reservation),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _DateField extends ConsumerStatefulWidget {
  final Reservation reservation;

  const _DateField(this.reservation);

  @override
  ConsumerState<_DateField> createState() => _DateFieldState();
}

class _DateFieldState extends ConsumerState<_DateField> {
  @override
  Widget build(BuildContext context) {
    final reservationController = ref.read(ReservationHolder.provider.notifier);

    Future<void> selectDateRange() async {
      final dateRange = await showDateRangePicker(
        context: context,
        initialDateRange: DateTimeRange(
          start: DateTime.now(),
          end: DateTime.now().add(const Duration(days: 1)),
        ),
        firstDate: DateTime.now(),
        lastDate: DateTime(3000),
      );
      if (dateRange != null) {
        reservationController.addDateRange(
          DateFormat('yyyy-MM-dd').format(dateRange.start),
          DateFormat('yyyy-MM-dd').format(dateRange.end),
          context,
        );
      }
    }

    // check if any changes were made
    return FormField<List<String>>(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select at least one date';
        }
        return null;
      },
      initialValue: reservationController.dates,
      builder: (FormFieldState<List<String>> state) {
        return Column(children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: state.hasError ? Colors.red : null,
            ),
            onPressed: () async {
              await selectDateRange();
              state.didChange(reservationController.dates);
            },
            icon: const Icon(Icons.calendar_month),
            label: const Text("Add Date"),
          ),
          20.verticalSpace,
          SizedBox(
            height: 30.h,
            width: context.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: reservationController.dates
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        label: Text(e),
                        onDeleted: () {
                          reservationController.removeDate(e);
                          ref
                              .read(ReservationProvider.provider.notifier)
                              .updateDate(
                                widget.reservation.copyWith(
                                  dates: reservationController.dates,
                                ),
                              );
                          ref
                              .read(ReservationsNotifier.provider.notifier)
                              .getReservations();
                          ref
                              .read(ReservationNotifier.provider(
                                      widget.reservation.unitId)
                                  .notifier)
                              .getReservationForUnit();
                          setState(() {});
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]);
      },
    );
  }
}
