import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/service/local/interface/i_simple_user_data.dart';
import 'package:snowmakers/core/utilities/defs.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SimpleLocalData implements ISimpleUserData {
  static final provider = Provider<SimpleLocalData>((ref) {
    return const SimpleLocalData();
  });

  const SimpleLocalData();

  Future<SharedPreferences> get _pref async =>
      await SharedPreferences.getInstance();

  @override
  FutureOr<bool> delete(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.remove(key);
  }

  @override
  Future<String?> readString(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.getString(key);
  }

  @override
  Future<int?> readInt(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.getInt(key);
  }

  @override
  Future<bool?> readBool(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.getBool(key);
  }

  @override
  Future<JsonMap?> readJsonMap(String key) async {
    final sharedPreference = await _pref;
    final data = sharedPreference.getString(key);
    return data != null ? jsonDecode(data) as JsonMap : null;
  }

  @override
  FutureOr<bool> writeBool(String key, bool value) async {
    final sharedPreference = await _pref;
    return sharedPreference.setBool(key, value);
  }

  @override
  FutureOr<bool> writeInt(String key, int value) async {
    final sharedPreference = await _pref;
    return sharedPreference.setInt(key, value);
  }

  @override
  FutureOr<bool> writeString(String key, String value) async {
    final sharedPreference = await _pref;
    return sharedPreference.setString(key, value);
  }

  @override
  FutureOr<bool> writeJsonMap(String key, JsonMap value) async {
    final sharedPreference = await _pref;
    final data = jsonEncode(value);
    return sharedPreference.setString(key, data);
  }

  @override
  Future<bool> containKey(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.containsKey(key);
  }
}
