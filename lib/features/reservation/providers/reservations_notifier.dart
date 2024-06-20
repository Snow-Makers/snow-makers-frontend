import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/reservation/data/interface/i_reservation_service.dart';
import 'package:snowmakers/features/reservation/models/reservation.dart';


class ReservationsNotifier extends StateNotifier<GlobalStates<List<Reservation>>> {
  static final provider =
      StateNotifierProvider.autoDispose<ReservationsNotifier, GlobalStates<List<Reservation>>>(
    (ref) => ReservationsNotifier(
      ref.watch(IReservationService.provider),
    ),
  );

  final IReservationService _service;

  ReservationsNotifier(
    this._service,
  ) : super(GlobalStates.initial()) {
    getReservations();
  }

  Future<void> getReservations() async {
    try {
      state = GlobalStates.loading();
      final result = await _service.getMyReservations();
      state = GlobalStates.success(result);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }
}
