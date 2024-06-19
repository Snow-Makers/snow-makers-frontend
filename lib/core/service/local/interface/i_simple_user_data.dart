import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/service/local/service/simple_local_data.dart';
import 'package:snowmakers/core/service/local/service/simple_secure_data.dart';
import 'package:snowmakers/core/utilities/defs.dart';
import 'package:snowmakers/core/utilities/enums.dart';

abstract class ISimpleUserData {
  static final provider = Provider.family<ISimpleUserData, LocalDataType>(
    (ref, type) {
      switch (type) {
        case LocalDataType.secured:
          return ref.watch(SimpleSecureData.provider);
        case LocalDataType.simple:
          return ref.watch(SimpleLocalData.provider);
      }
    },
  );

  Future<bool> containKey(String key);

  Future<String?> readString(String key);

  Future<int?> readInt(String key);

  Future<bool?> readBool(String key);

  Future<JsonMap?> readJsonMap(String key);

  FutureOr<bool> writeString(String key, String value);

  FutureOr<bool> writeInt(String key, int value);

  FutureOr<bool> writeBool(String key, bool value);

  FutureOr<bool> writeJsonMap(String key, JsonMap value);

  FutureOr<bool> delete(String key);
}
