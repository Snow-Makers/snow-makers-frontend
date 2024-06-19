import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/utilities/enums.dart';

class UnitsHolder extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((ref) => UnitsHolder());

  final TextEditingController unitId = TextEditingController();
  final TextEditingController unitPassword = TextEditingController();
  String _addressName = '';
  String _locationName = '';
  num _latitude = 0;
  num _longitude = 0;
  bool? _isActive;

  bool? get isActive => _isActive;

  set isActive(bool? value) {
    _isActive = value;
    notifyListeners();
  }


  final formKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();

  String get addressName => _addressName;

  num get latitude => _latitude;

  num get longitude => _longitude;

  String get locationName => _locationName;

  UnitFunctions _functions = UnitFunctions.none;

  UnitFunctions get functions => _functions;

  set functions(UnitFunctions value) {
    _functions = value;
    notifyListeners();
  }

  set locationName(String value) {
    _locationName = value;
    notifyListeners();
  }

  set addressName(String value) {
    _addressName = value;
    notifyListeners();
  }

  set latitude(num value) {
    _latitude = value;
    notifyListeners();
  }

  set longitude(num value) {
    _longitude = value;
    notifyListeners();
  }

  void clear() {
    unitId.clear();
    unitPassword.clear();
    addressName = '';
    locationName = '';
    latitude = 0;
    longitude = 0;
  }

  @override
  void dispose() {
    super.dispose();
    unitId.dispose();
    unitPassword.dispose();
    addressName = '';
    locationName = '';
    latitude = 0;
    longitude = 0;
  }
}
