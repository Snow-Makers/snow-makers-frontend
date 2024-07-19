import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart' as time;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:snowmakers/core/components/background.dart';
import 'package:snowmakers/core/components/drawer.dart';
import 'package:snowmakers/core/components/text_input_field.dart';
import 'package:snowmakers/core/utilities/enums.dart';
import 'package:snowmakers/core/utilities/extensions.dart';
import 'package:snowmakers/core/utilities/logic_helpers.dart';
import 'package:snowmakers/core/utilities/ui_alerts.dart';
import 'package:snowmakers/features/reservation/models/reservation.dart';
import 'package:snowmakers/features/reservation/providers/reservation_notifier.dart';
import 'package:snowmakers/features/units/data/interface/i_units_service.dart';
import 'package:snowmakers/features/units/models/unit.dart';
import 'package:snowmakers/features/units/providers/delete_unit_provider.dart';
import 'package:snowmakers/features/units/providers/units_holder.dart';
import 'package:snowmakers/features/units/providers/update_unit_provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part '../widgets/advanced_settings.dart';
part '../widgets/calendar_unit.dart';
part '../widgets/header.dart';
part '../widgets/page_content.dart';
part '../widgets/timer_unit.dart';
part '../widgets/unit_functions.dart';
part '../widgets/unit_information.dart';
part '../widgets/units_body.dart';

class UnitsScreen extends StatelessWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: FadeIn(
        child: const Stack(
          children: [
            Background(),
            _UnitsBody(),
          ],
        ),
      ),
    );
  }
}
