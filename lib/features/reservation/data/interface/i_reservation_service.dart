import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/features/reservation/data/service/reservation_service.dart';
import 'package:snowmakers/features/reservation/models/reservation.dart';
import 'package:snowmakers/features/units/data/interface/i_units_service.dart';

abstract class IReservationService {
  static final provider = Provider(
    (ref) => ReservationService(
      FirebaseFirestore.instance,
      ref.watch(IUnitsService.provider),
    ),
  );

  Future<List<Reservation>> getReservationsPerUnit(String unitId);

  Future<List<Reservation>> getMyReservations();

  Future<void> addReservation(Reservation reservation);

  Future<void> updateReservation(Reservation reservation);

  Future<void> deleteReservation(String id);

  Future<bool> checkReservationExists(String unitId);
}
