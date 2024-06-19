part of '../screens/units_screen.dart';

class _Header extends StatelessWidget {
  final Unit unit;

  const _Header(this.unit);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            40.verticalSpace,
            Text(
              unit.location.locationName,
              style: context.appTextStyles.displayMedium.copyWith(height: 0),
              maxLines: 1,
            ),
            if (unit.temperature != null)
              Text(
                '${unit.temperature!.toStringAsFixed(2)}° C',
                style: context.appTextStyles.displayLarge.copyWith(
                  fontSize: 30.sp,
                  height: 0,
                ),
              ),
            8.verticalSpace,
            if (unit.temperature != null)
              Text(
                'Mostly Clear',
                style: context.appTextStyles.titleMedium,
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (unit.temperature != null)
                  Text(
                    'F: ${LogicHelpers.convertDegreeFromCelsiusToFahrenheit(unit.temperature!).toStringAsFixed(2)}°',
                    style: context.appTextStyles.titleMedium,
                  ),
                20.horizontalSpace,
                if (unit.humidity != null)
                  Text(
                    'H: ${unit.humidity}%',
                    style: context.appTextStyles.titleMedium,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Options extends ConsumerWidget {
  final Unit unit;
  final bool isReservationExists;

  const _Options({
    required this.unit,
    required this.isReservationExists,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isReservationExists)
            TextButton(
              onPressed: () {
                context.pop();
                context.push('/addReservation', extra: unit.modelId);
              },
              child: const Text('Add Reservation'),
            ),
          if (!isReservationExists)
            Divider(
              color: context.appTheme.white.withOpacity(0.2),
            ),
          TextButton(
            onPressed: () {
              UiAlerts.logoutDialog(
                context,
                onClick: () {
                  ref
                      .read(DeleteUnitProvider.provider.notifier)
                      .deleteUnit(unit.modelId)
                      .whenComplete(() {
                    context.pop();
                    context.pop();
                  });
                },
                title: 'Delete Unit',
                content: 'Are you sure you want to delete this unit?',
                onClickTitle: 'Delete',
              );
            },
            child: const Text('Delete Unit'),
          ),
        ],
      ),
    );
  }
}
