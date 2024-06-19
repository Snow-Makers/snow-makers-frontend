import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:snowmakers/core/components/text_input_field.dart';
import 'package:snowmakers/core/components/widget_life_cycle_listener.dart';
import 'package:snowmakers/core/utilities/extensions.dart';
import 'package:snowmakers/core/utilities/snackbar.dart';
import 'package:snowmakers/core/utilities/ui_alerts.dart';
import 'package:snowmakers/core/utilities/validations.dart';
import 'package:snowmakers/features/reservation/models/reservation.dart';
import 'package:snowmakers/features/reservation/providers/reservation_holder.dart';
import 'package:snowmakers/features/reservation/providers/reservation_notifier.dart';
import 'package:snowmakers/features/reservation/providers/reservation_provider.dart';
import 'package:snowmakers/features/reservation/providers/reservations_notifier.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

part '../widgets/edit_reservation_action.dart';

part '../widgets/edit_reservation_form.dart';

class EditReservationScreen extends ConsumerWidget {
  final Reservation reservation;

  const EditReservationScreen({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      ReservationProvider.provider,
      (previous, next) {
        if (next.isLoading) {
          context.loaderOverlay.show();
        } else if (next.isSuccess) {
          context.loaderOverlay.hide();
          CustomSnackBar.showSuccess(context, "Unit Updated successfully");
          ref.read(ReservationsNotifier.provider.notifier).getReservations();
          ref.read(ReservationNotifier.provider(reservation.unitId).notifier).getReservationForUnit();
          context.go('/');
        } else if (next.isFailed) {
          context.loaderOverlay.hide();
          CustomSnackBar.showError(
            context,
            next.error.toString(),
          );
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Reservation',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              UiAlerts.logoutDialog(context, onClick: () async {
                context.pop();
                await ref
                    .read(ReservationProvider.provider.notifier)
                    .deleteReservation(reservation.id);
              },
                  title: LocaleKeys.deleteReservation_title.tr(),
                  content: LocaleKeys.deleteReservation_subTitle.tr(),
                  onClickTitle: LocaleKeys.deleteReservation_delete.tr());
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: FadeIn(
        child: Center(
          child: Column(
            children: [
              _EditReservationForm(reservation),
              const Spacer(),
              _EditReservationAction(reservation),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
