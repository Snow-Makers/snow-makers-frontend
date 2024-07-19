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

class _Calendar extends StatelessWidget {
  final List<Reservation> reservations;

  const _Calendar(
    this.reservations,
  );

  @override
  Widget build(BuildContext context) {
    final initialSelectedRanges = reservations.expand((reservation) {
      return reservation.dates.map((date) {
        final startDate = DateTime.parse(date.split(' - ')[0]);
        final endDate = DateTime.parse(date.split(' - ')[1]);
        return PickerDateRange(startDate, endDate);
      });
    }).toList();

    final colors = reservations.expand((reservation) {
      return reservation.colors;
    }).toList();

    return SfDateRangePicker(
      view: DateRangePickerView.month,
      selectionMode: DateRangePickerSelectionMode.multiRange,
      headerStyle: const DateRangePickerHeaderStyle(
        backgroundColor: Colors.transparent,
      ),
      startRangeSelectionColor: Colors.transparent,
      endRangeSelectionColor: Colors.transparent,
      initialDisplayDate: DateTime.parse(
        // display nearest date based on DateTime.now()
        reservations
            .map((reservation) => reservation.dates
                .map((date) => DateTime.parse(date.split(' - ')[0]))
                .toList())
            .expand((element) => element)
            // display nearest date based on DateTime.now()
            .reduce((value, element) => value.difference(element).abs() >
                    value.difference(DateTime.now()).abs()
                ? value
                : element)
            .toString(),
      ),
      backgroundColor: Colors.transparent,
      initialSelectedRanges: initialSelectedRanges,
      todayHighlightColor: Colors.white,
      rangeSelectionColor: Colors.transparent,
      selectionColor: Colors.transparent,
      showTodayButton: false,
      showActionButtons: false,
      showNavigationArrow: false,
      cellBuilder: (
        context,
        details,
      ) {
        return CustomPaint(
          painter:
              _MultiRangeSelection(details.date, initialSelectedRanges, colors),
          size: Size(details.bounds.width, details.bounds.height),
        );
      },
    );
  }
}

class _MultiRangeSelection extends CustomPainter {
  _MultiRangeSelection(this.date, this.selectedRanges, this.selectedColors);

  final DateTime date;
  final List<PickerDateRange> selectedRanges;
  final List<Color> selectedColors;
  final TextPainter _textPainter = TextPainter();

  bool isSameDate(DateTime start, DateTime end) {
    return start.year == end.year &&
        start.month == end.month &&
        start.day == end.day;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    double x = size.width / 2;
    double y = size.height / 2;
    double radius = x > y ? y : x;
    radius = radius - 1;

    // Check each range for overlap
    for (int i = 0; i < selectedRanges.length; i++) {
      Color selectedColor = selectedColors[i % selectedColors.length];
      PickerDateRange range = selectedRanges[i];
      DateTime startDate = range.startDate!;
      DateTime endDate = range.endDate ?? startDate;

      Paint paint = Paint()..color = selectedColor.withOpacity(0.25);

      if (isSameDate(startDate, endDate) && isSameDate(startDate, date)) {
        canvas.drawCircle(Offset(x, y), radius, Paint()..color = selectedColor);
      } else if (isSameDate(startDate, date)) {
        canvas.drawCircle(Offset(x, y), radius, Paint()..color = selectedColor);
        canvas.drawRect(
            Rect.fromLTRB(x, y - radius, size.width, y + radius), paint);
      } else if (isSameDate(endDate, date)) {
        canvas.drawCircle(Offset(x, y), radius, Paint()..color = selectedColor);
        canvas.drawRect(Rect.fromLTRB(0, y - radius, x, y + radius), paint);
      } else if (startDate.isBefore(date) && endDate.isAfter(date)) {
        canvas.drawRect(
            Rect.fromLTRB(0, y - radius, size.width, y + radius), paint);
      }
    }

    final TextSpan dayTextSpan = TextSpan(
      text: date.day.toString(),
    );

    _textPainter.text = dayTextSpan;
    _textPainter.textDirection = TextDirection.ltr;
    _textPainter.textAlign = TextAlign.center;
    _textPainter.maxLines = 1;
    _textPainter.layout(minWidth: size.width, maxWidth: size.width);

    double xPosition = (size.width - _textPainter.width) / 2;
    double yPosition = (size.height - _textPainter.height) / 2;
    _textPainter.paint(canvas, Offset(xPosition, yPosition));
  }

  @override
  bool shouldRepaint(_MultiRangeSelection oldDelegate) {
    return oldDelegate.date != date ||
        oldDelegate.selectedRanges != selectedRanges ||
        oldDelegate.selectedColors != selectedColors;
  }
}
