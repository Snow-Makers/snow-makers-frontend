import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/authentication/data/remote/interface/i_auth_service.dart';
import 'package:snowmakers/features/authentication/providers/forget_password_holder.dart';
import 'package:snowmakers/features/authentication/providers/login_holder.dart';
import 'package:snowmakers/features/authentication/providers/register_holder.dart';

class AuthViewModel extends StateNotifier<GlobalStates<bool>> {
  static final provider =
      StateNotifierProvider<AuthViewModel, GlobalStates<bool>>(
    (ref) => AuthViewModel(
      ref.read(LoginHolder.provider),
      ref.watch(ForgetPasswordHolder.provider),
      ref.watch(RegisterHolder.provider),
      ref.watch(IAuthService.provider),
    ),
  );

  final LoginHolder _loginHolder;
  final RegisterHolder _registerHolder;

  final ForgetPasswordHolder _forgetPasswordHolder;
  final IAuthService _service;

  AuthViewModel(
    this._loginHolder,
    this._forgetPasswordHolder,
    this._registerHolder,
    this._service,
  ) : super(GlobalStates.initial());

  Future<void> login() async {
    if (_loginHolder.formKey.currentState!.validate()) {
      try {
        state = GlobalStates.loading();
        await _service.loginWithEmailAndPassword(
          _loginHolder.email.text,
          _loginHolder.password.text,
        );
        state =  GlobalStates.success(true);
      } on FirebaseAuthException catch (e) {
        state = GlobalStates.fail(e.message.toString());
      }
    }
  }

  Future<void> register() async {
    if (_registerHolder.formKey.currentState!.validate()) {
      try {
        state = GlobalStates.loading();
        await _service.registerWithEmailAndPassword(
          _registerHolder.email.text,
          _registerHolder.password.text,
          _registerHolder.name.text,
        );
        state =  GlobalStates.success(true);
      } on FirebaseAuthException catch (e) {
        state = GlobalStates.fail(e.message.toString());
      }
    }
  }

  Future<void> resetPassword() async {
    if (_forgetPasswordHolder.formKey.currentState!.validate()) {
      try {
        state = GlobalStates.loading();
        await _service.resetPassword(
          _forgetPasswordHolder.email.text,
        );
        state =  GlobalStates.success(true);
      } on FirebaseAuthException catch (e) {
        state = GlobalStates.fail(e.message.toString());
      }
    }
  }

  Future<void> deleteAccount() async {
    try {
      state = GlobalStates.loading();
      await _service.deleteAccount();
      state =  GlobalStates.success(true);
    } on FirebaseAuthException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }

  Future<void> logout() async {
    try {
      state = GlobalStates.loading();
      await _service.logout();
      state = GlobalStates.success(true);
    } on FirebaseAuthException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }

  Future<void> loginWithApple() async {
    try {
      state = GlobalStates.loading();
      await _service.loginWithApple();
      state = GlobalStates.success(true);
    } on FirebaseAuthException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    } on SignInWithAppleAuthorizationException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      state = GlobalStates.loading();
      final result = await _service.loginWithGoogle();
      if (!result) {
        state = GlobalStates.fail('Something went wrong');
      }
      state = GlobalStates.success(true);
    } on FirebaseAuthException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }
}
