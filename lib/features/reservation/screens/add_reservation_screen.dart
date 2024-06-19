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
import 'package:snowmakers/core/utilities/validations.dart';
import 'package:snowmakers/features/reservation/providers/reservation_holder.dart';
import 'package:snowmakers/features/reservation/providers/reservation_notifier.dart';
import 'package:snowmakers/features/reservation/providers/reservation_provider.dart';
import 'package:snowmakers/features/reservation/providers/reservations_notifier.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

part '../widgets/add_reservation_action.dart';

part '../widgets/add_reservation_form.dart';

class AddReservationScreen extends ConsumerWidget {
  final String unitId;

  const AddReservationScreen({
    super.key,
    required this.unitId,
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
          CustomSnackBar.showSuccess(context, "Reservation added successfully");
          ref.read(ReservationNotifier.provider(unitId).notifier).getReservationForUnit();
          ref.read(ReservationsNotifier.provider.notifier).getReservations();
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
    return WidgetLifecycleListener(
      onInit: () {
        ref.read(ReservationHolder.provider.notifier).clear();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FadeIn(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              30.verticalSpace,
              Image.asset(
                context.appTheme.logo,
                height: 100.h,
                width: 100.w,
              ),
              FadeInUp(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SizedBox(
                      width: context.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                        ),
                        child: SafeArea(
                          top: false,
                          child: Column(
                            children: [
                              const _AddReservationForm(),
                              _AddReservationAction(unitId),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
