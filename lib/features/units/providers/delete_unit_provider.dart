import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/units/data/interface/i_units_service.dart';

class DeleteUnitProvider extends StateNotifier<GlobalStates<bool>> {
  static final provider =
      StateNotifierProvider<DeleteUnitProvider, GlobalStates<bool>>(
    (ref) => DeleteUnitProvider(
      ref.watch(IUnitsService.provider),
    ),
  );

  DeleteUnitProvider(this._service)
      : super(GlobalStates.initial());

  final IUnitsService _service;


  Future<void> deleteUnit(String id) async {
    try {
      state = GlobalStates.loading();
      await _service.deleteUnit(id);
      state = GlobalStates.success(true);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }

}
