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
import 'package:snowmakers/features/authentication/providers/authentication_notifier.dart';
import 'package:snowmakers/features/units/providers/units_holder.dart';
import 'package:snowmakers/features/units/providers/units_provider.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

part '../widgets/add_unit_action.dart';

part '../widgets/add_unit_form.dart';

class AddUnitScreen extends ConsumerWidget {
  final bool isFirstUnit;

  const AddUnitScreen({
    super.key,
    this.isFirstUnit = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitId = ref.watch(UnitsHolder.provider).unitId.text;
    ref.listen(
      UnitsProvider.provider,
      (previous, next) {
        if (next.isLoading) {
          context.loaderOverlay.show();
        } else if (next.isSuccess) {
          context.loaderOverlay.hide();
          CustomSnackBar.showSuccess(context, "Unit added successfully");
          ref.read(AuthenticationNotifier.provider.notifier).getCurrentUser();
          context.go('/addReservation', extra: unitId);
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
        ref.read(UnitsHolder.provider.notifier).clear();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: FadeIn(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: context.width,
                      child: Column(
                        children: [
                          50.verticalSpace,
                          Image.asset(
                            context.appTheme.logo,
                            height: 200.h,
                            width: 200.w,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: FadeInUp(
                              child: SizedBox(
                                width: context.width,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.r),
                                      topRight: Radius.circular(20.r),
                                    ),
                                  ),
                                  child: const SafeArea(
                                    top: false,

                                    child: Column(
                                      children: [
                                        _AddUnitForm(),
                                        _AddUnitAction(),
                                      ],
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
                ),
                if (!isFirstUnit)
                  Positioned(
                    left: 0,
                    top: 50.h,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: context.appTheme.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
