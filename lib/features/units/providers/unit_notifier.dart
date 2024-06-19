import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/units/data/interface/i_units_service.dart';
import 'package:snowmakers/features/units/models/unit.dart';

class UnitNotifier extends StateNotifier<GlobalStates<Unit>> {
  static final provider =
      StateNotifierProvider<UnitNotifier, GlobalStates<Unit>>(
    (ref) => UnitNotifier(
      ref.watch(IUnitsService.provider),
    ),
  );

  final IUnitsService _service;

  UnitNotifier(
    this._service,
  ) : super(GlobalStates.initial());

  Future<void> getUnitUser(String id) async {
    try {
      state = GlobalStates.loading();
      final result = await _service.getUnit(id);
      state = GlobalStates.success(result);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }
}
