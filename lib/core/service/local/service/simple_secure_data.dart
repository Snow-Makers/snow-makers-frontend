import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:snowmakers/core/service/local/interface/i_simple_user_data.dart';
import 'package:snowmakers/core/utilities/defs.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

class SimpleSecureData extends ISimpleUserData {
  static final provider = Provider<SimpleSecureData>((ref) {
    return SimpleSecureData(const FlutterSecureStorage());
  });

  final FlutterSecureStorage _pref;

  SimpleSecureData(this._pref);

  @override
  FutureOr<bool> delete(String key) async {
    try {
      await _pref.delete(key: key);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String?> _read(String key) async {
    try {
      return _pref.read(key: key);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<String?> readString(String key) async {
    return _read(key);
  }

  @override
  Future<int?> readInt(String key) async {
    final value = await _read(key);
    return value.let(int.tryParse);
  }

  @override
  Future<bool?> readBool(String key) async {
    final value = await _read(key);
    if (value == null) return null;
    return value == 'true';
  }

  @override
  Future<JsonMap?> readJsonMap(String key) async {
    final value = await _read(key);
    return value.let((data) => jsonDecode(data) as JsonMap);
  }

  FutureOr<bool> _write(String key, String value) async {
    try {
      await _pref.write(key: key, value: value);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  FutureOr<bool> writeBool(String key, bool value) async {
    return _write(key, value.toString());
  }

  @override
  FutureOr<bool> writeInt(String key, int value) async {
    return _write(key, value.toString());
  }

  @override
  FutureOr<bool> writeString(String key, String value) async {
    return _write(key, value);
  }

  @override
  FutureOr<bool> writeJsonMap(String key, JsonMap value) async {
    final data = jsonEncode(value);
    return _write(key, data);
  }

  @override
  Future<bool> containKey(String key) async {
    return _pref.read(key: key).then((value) => value != null);
  }
}
