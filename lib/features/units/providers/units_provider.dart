import 'package:cloud_firestore/cloud_firestore.dart';
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

        final isUnitExist = await _service.checkUnitExists(unit.modelId);
        final isInvalidCredentials =
            await _service.checkUnitCredentials(unit.modelId, unit.password);
        final units = await FirebaseFirestore.instance.collection('units').doc(unit.modelId).get();
        final isNotExist = !units.exists;
        if (isNotExist) {
          state = GlobalStates.fail('Unit does not exist');
        }
        else if (isUnitExist) {
          state = GlobalStates.fail('Unit already exists');
          return;
        } else if (!isInvalidCredentials) {
          state = GlobalStates.fail(
              'Invalid credentials, please check model id and password');
          return;
        } else {
          await _service.addUnit(unit);
          state = GlobalStates.success(true);
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
