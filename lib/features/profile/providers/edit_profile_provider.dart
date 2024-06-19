import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/notifiers/global_state.dart';
import 'package:snowmakers/features/authentication/data/remote/interface/i_auth_service.dart';
import 'package:snowmakers/features/authentication/model/user_model.dart';

import 'package:snowmakers/features/profile/providers/edit_profile_holder.dart';
import 'package:snowmakers/features/profile/screens/profile_screen.dart';

class EditProfileProvider extends StateNotifier<GlobalStates<bool>> {
  static final provider =
      StateNotifierProvider<EditProfileProvider, GlobalStates<bool>>(
    (ref) => EditProfileProvider(
      ref.watch(EditProfileHolder.provider),
      ref.watch(IAuthService.provider),
      ref.watch(isProfileChangedProvider),
    ),
  );

  final EditProfileHolder _editProfileHolder;
  final IAuthService _service;
  final bool _isProfileChanged;

  EditProfileProvider(
    this._editProfileHolder,
    this._service,
    this._isProfileChanged,
  ) : super(GlobalStates.initial());

  Future<void> edit() async {
    if (_editProfileHolder.formKey.currentState!.validate() ||
        _isProfileChanged) {
      final user = UserModel(
        name: _editProfileHolder.nameController.text.trim(),
        email: _editProfileHolder.emailController.text.trim(),
      );
      try {
        state = GlobalStates.loading();
        await _service.updateUser(
          user,
          _editProfileHolder.image,
        );
        state = GlobalStates.success(true);
      } on FirebaseAuthException catch (e) {
        state = GlobalStates.fail(e.message.toString());
      }
    }
  }
}
