import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/features/units/data/service/units_service.dart';
import 'package:snowmakers/features/units/models/unit.dart';

abstract class IUnitsService {
  static final provider = Provider(
    (ref) => UnitsService(
      FirebaseFirestore.instance,
    ),
  );

  Stream<List<Unit>> getUnits();

  Future<Unit> getUnit(String id);

  Future<bool> addUnit(Unit unit);

  Future<void> updateUnit(Unit unit);

  Future<void> deleteUnit(String id);

  Future<bool> checkUnitExists(String id);

  Future<bool> haveUnits();
}
