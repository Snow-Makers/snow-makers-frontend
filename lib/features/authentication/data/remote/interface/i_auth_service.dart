import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/features/authentication/data/remote/service/auth_service.dart';
import 'package:snowmakers/features/authentication/model/user_model.dart';

abstract class IAuthService {
  static final provider =
      Provider<AuthService>((ref) => AuthService(FirebaseAuth.instance));

  Future<bool> loginWithGoogle();

  Future<void> loginWithApple();

  Future<void> loginWithEmailAndPassword(String email, String password);

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<void> logout();

  Future<void> deleteAccount();

  Future<bool> checkIfAuth();

  Future<void> resetPassword(String email);

  Future<UserModel> getCurrentUserData();

  Future<bool> hasRegisterBefore();

  Future<void> updateUser(UserModel user, File? image);
}
