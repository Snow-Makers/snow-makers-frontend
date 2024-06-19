import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/authentication/data/remote/interface/i_auth_service.dart';
import 'package:snowmakers/features/authentication/model/user_model.dart';

class AuthenticationNotifier extends StateNotifier<GlobalStates<UserModel>> {
  static final provider =
      StateNotifierProvider.autoDispose<AuthenticationNotifier, GlobalStates<UserModel>>(
    (ref) => AuthenticationNotifier(
      ref.watch(IAuthService.provider),
    ),
  );

  final IAuthService _service;

  AuthenticationNotifier(
    this._service,
  ) : super(GlobalStates.initial()){
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    try {
      state = GlobalStates.loading();
      final result = await _service.getCurrentUserData();
      state =  GlobalStates.success(result);
    } on FirebaseAuthException catch (e) {
      state = GlobalStates.fail(e.message.toString());
    }
  }
}
