import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/units/data/interface/i_units_service.dart';
import 'package:snowmakers/features/units/models/location.dart';
import 'package:snowmakers/features/units/models/unit.dart';
import 'package:snowmakers/features/units/providers/units_holder.dart';

class UnitsProvider extends StateNotifier<GlobalStates<bool>> {
  static final provider =
      StateNotifierProvider<UnitsProvider, GlobalStates<bool>>(
    (ref) => UnitsProvider(
      ref.watch(IUnitsService.provider),
      ref.watch(UnitsHolder.provider),
    ),
  );

  UnitsProvider(this._service, this._unitsHolder)
      : super(GlobalStates.initial());

  final IUnitsService _service;
  final UnitsHolder _unitsHolder;

  Future<void> addUnit() async {
    if (_unitsHolder.formKey.currentState!.validate() &&
        _unitsHolder.latitude != 0 &&
        _unitsHolder.longitude != 0 &&
        _unitsHolder.addressName.isNotEmpty &&
        _unitsHolder.locationName.isNotEmpty) {
      try {
        final unit = Unit(
          modelId: _unitsHolder.unitId.text,
          password: _unitsHolder.unitPassword.text,
          location: Location(
            locationName: _unitsHolder.locationName,
            addressName: _unitsHolder.addressName,
            latitude: _unitsHolder.latitude,
            longitude: _unitsHolder.longitude,
          ),
          userId: FirebaseAuth.instance.currentUser!.uid,
        );

        state = GlobalStates.loading();
        final result = await _service.addUnit(unit);
        if (result) {
          state = GlobalStates.success(true);
        } else {
          state = GlobalStates.fail('modelId already exists');
        }
      } on FirebaseException catch (e) {
        state = GlobalStates.fail(e.message.toString());
      }
    }
  }

  Future<bool> haveUnit() async {
    return await _service.haveUnits();
  }
}
