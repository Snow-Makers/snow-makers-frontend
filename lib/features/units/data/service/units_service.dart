import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snowmakers/features/units/data/interface/i_units_service.dart';
import 'package:snowmakers/features/units/models/unit.dart';

class UnitsService extends IUnitsService {
  UnitsService(
    this._fireStore,
  );

  final FirebaseFirestore _fireStore;

  @override
  Future<bool> addUnit(Unit unit) async {
    await _fireStore.collection('units').doc(unit.modelId).set(unit.toJson());
    return true;
  }

  @override
  Future<void> deleteUnit(String id) async {
    await _fireStore.collection('units').doc(id).delete();
    await _fireStore
        .collection('reservations')
        .where('unitId', isEqualTo: id)
        .get()
        .then((value) {
      for (final element in value.docs) {
        _fireStore.collection('reservations').doc(element.id).delete();
      }
    });
  }

  @override
  Future<Unit> getUnit(String id) async {
    final doc = await _fireStore.collection('units').doc(id).get();
    return Unit.fromJson(doc.data() as Map<String, dynamic>);
  }

  @override
  Stream<List<Unit>> getUnits() {
    final querySnapshot = _fireStore
        .collection('units')
        .where(
          'userId',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .snapshots();

    return querySnapshot.map((snapshot) =>
        snapshot.docs.map((doc) => Unit.fromJson(doc.data())).toList());
  }

  @override
  Future<void> updateUnit(Unit unit) async {
    await _fireStore
        .collection('units')
        .doc(unit.modelId)
        .update(unit.toJson());
  }

  @override
  Future<bool> checkUnitExists(String id) async {
    final doc = await _fireStore.collection('units').doc(id).get();
    if (doc.exists && doc.data()?['userId'] != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> haveUnits() async {
    final querySnapshot = await _fireStore
        .collection('units')
        .where(
          'userId',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Future<bool> checkUnitCredentials(String id, String password) async {
    final doc = await _fireStore.collection('units').doc(id).get();
    if (doc.data()?['password'] == password) {
      return true;
    } else {
      return false;
    }
  }

}
