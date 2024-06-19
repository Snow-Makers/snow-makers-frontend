import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/units/data/interface/i_units_service.dart';
import 'package:snowmakers/features/units/models/unit.dart';
import 'package:snowmakers/features/units/providers/units_holder.dart';

class UpdateUnitProvider extends StateNotifier<GlobalStates<bool>> {
  static final provider =
      StateNotifierProvider<UpdateUnitProvider, GlobalStates<bool>>(
    (ref) => UpdateUnitProvider(
      ref.watch(IUnitsService.provider),
      ref.watch(UnitsHolder.provider),
    ),
  );

  UpdateUnitProvider(this._service,this._unitsHolder)
      : super(GlobalStates.initial());

  final IUnitsService _service;
  final UnitsHolder _unitsHolder;


  Future<void> updateUnit(Unit unit) async {
    final result = Unit(
      modelId: unit.modelId,
      password: unit.password,
      location: unit.location,
      userId: unit.userId,
      unitFunction: _unitsHolder.functions.value,
      temperature: unit.temperature,
      humidity: unit.humidity,
      isActive: _unitsHolder.isActive,
    );

    try {
      state = GlobalStates.loading();
      await _service.updateUnit(result);
      state = GlobalStates.success(true);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }

  }


}
