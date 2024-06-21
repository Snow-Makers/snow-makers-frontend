import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/reservation/data/interface/i_reservation_service.dart';
import 'package:snowmakers/features/reservation/models/reservation.dart';
import 'package:snowmakers/features/reservation/providers/reservation_holder.dart';
import 'package:uuid/uuid.dart';

class ReservationProvider extends StateNotifier<GlobalStates<bool>> {
  static final provider =
  StateNotifierProvider<ReservationProvider, GlobalStates<bool>>(
        (ref) =>
        ReservationProvider(
          ref.watch(IReservationService.provider),
          ref.watch(ReservationHolder.provider),
        ),
  );

  ReservationProvider(this._service, this._reservationHolder)
      : super(GlobalStates.initial());

  final IReservationService _service;
  final ReservationHolder _reservationHolder;

  Future<void> addReservation(String unitId) async {
    if (_reservationHolder.formKey.currentState!.validate() &&
        _reservationHolder.dates.isNotEmpty) {
      try {
        final id = const Uuid().v4();
        final reservation = Reservation(
          id: id,
          unitId: unitId,
          email: _reservationHolder.email.text,
          name: _reservationHolder.name.text,
          phone: _reservationHolder.phone.text,
          dates: _reservationHolder.dates,
          ownerId: FirebaseAuth.instance.currentUser!.uid,
        );

        state = GlobalStates.loading();
        await _service.addReservation(reservation);
        state = GlobalStates.success(true);
      } on FirebaseException catch (e) {
        state = GlobalStates.fail(e.message.toString());
      }
    }
  }

  Future<void> deleteReservation(String id) async {
    try {
      state = GlobalStates.loading();
      await _service.deleteReservation(id);
      state = GlobalStates.success(true);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }

  Future<void> updateReservation(Reservation reservation) async {
    if (_reservationHolder.editFormKey.currentState!.validate()) {
      final result = Reservation(
        unitId: reservation.unitId,
        id: reservation.id,
        email: _reservationHolder.email.text,
        name: _reservationHolder.name.text,
        dates: _reservationHolder.dates,
        ownerId: reservation.ownerId,
        phone: _reservationHolder.phone.text,
      );
      try {
        state = GlobalStates.loading();
        await _service.updateReservation(result);
        state = GlobalStates.success(true);
      } on FirebaseException catch (e) {
        state = GlobalStates.fail(e.message.toString());
      }
    }
  }

  Future<void> updateDate(Reservation reservation) async {
    if (_reservationHolder.editFormKey.currentState!.validate()) {
      final result = Reservation(
        unitId: reservation.unitId,
        id: reservation.id,
        email: _reservationHolder.email.text,
        name: _reservationHolder.name.text,
        dates: _reservationHolder.dates,
        ownerId: reservation.ownerId,
        phone: _reservationHolder.phone.text,
      );
      try {
        await _service.updateReservation(result);
      } on FirebaseException catch (e) {
        state = GlobalStates.fail(e.message.toString());
      }
    }
  }


}
