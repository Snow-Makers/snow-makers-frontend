import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snowmakers/features/reservation/data/interface/i_reservation_service.dart';
import 'package:snowmakers/features/reservation/models/reservation.dart';
import 'package:snowmakers/features/units/data/interface/i_units_service.dart';

class ReservationService extends IReservationService {
  ReservationService(
    this._fireStore,
    this.unitsService,
  );

  final FirebaseFirestore _fireStore;
  final IUnitsService unitsService;

  @override
  Future<void> addReservation(Reservation reservation) async {
    await _fireStore
        .collection('reservations')
        .doc(reservation.id)
        .set(reservation.toJson());
  }

  @override
  Future<bool> checkReservationExists(String unitId) async {
    final doc = await _fireStore
        .collection('reservations')
        .where('ownerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('unitId', isEqualTo: unitId)
        .get();
    return doc.docs.isNotEmpty;
  }

  @override
  Future<void> deleteReservation(String id) async {
    await _fireStore.collection('reservations').doc(id).delete();
  }

  @override
  Future<Reservation?> getReservation(String unitId) async {
    final doc = await _fireStore
        .collection('reservations')
        .where('ownerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('unitId', isEqualTo: unitId)
        .get();
    if (doc.docs.isNotEmpty) {
      return Reservation.fromJson(doc.docs.first.data());
    } else{
      return null;
    }
  }

  @override
  Future<void> updateReservation(Reservation reservation) async {
    await _fireStore
        .collection('reservations')
        .doc(reservation.id)
        .update(reservation.toJson());
  }

  @override
  Future<List<Reservation>> getMyReservations() async {
    final doc = await _fireStore
        .collection('reservations')
        .where('ownerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    return doc.docs.map((e) => Reservation.fromJson(e.data())).toList();
  }
}
