import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snowmakers/core/components/map_view.dart';
import 'package:snowmakers/features/units/providers/units_holder.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

class MapViewScreen extends ConsumerWidget {
  const MapViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsHolder = ref.read(UnitsHolder.provider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          LocaleKeys.mapView_title.tr(),
        ),
      ),
      body: MapView(
        onPicked: (place) {
          unitsHolder.addressName = place.addressName;
          unitsHolder.locationName = place.location;
          unitsHolder.latitude = place.latLong.latitude;
          unitsHolder.longitude = place.latLong.longitude;
          context.pop();
        },
      ),
    );
  }
}
