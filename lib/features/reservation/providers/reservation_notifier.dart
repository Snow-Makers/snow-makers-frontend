import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/reservation/data/interface/i_reservation_service.dart';
import 'package:snowmakers/features/reservation/models/reservation.dart';

class ReservationNotifier extends StateNotifier<GlobalStates<List<Reservation>>> {
  static final provider = StateNotifierProvider.family<ReservationNotifier,
      GlobalStates<List<Reservation>>, String>(
    (ref, unitId) => ReservationNotifier(
      ref.watch(IReservationService.provider),
      unitId,
    ),
  );

  final IReservationService _service;
  final String unitId;

  ReservationNotifier(
    this._service,
    this.unitId,
  ) : super(GlobalStates.initial()) {
    getReservationForUnit();
  }

  Future<void> getReservationForUnit() async {
    try {
      state = GlobalStates.loading();
      final result = await _service.getReservationsPerUnit(unitId);
      state = GlobalStates.success(result);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }
}
