import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snowmakers/core/utilities/enums.dart';
import 'package:snowmakers/features/authentication/data/remote/interface/i_auth_service.dart';
import 'package:snowmakers/features/authentication/model/user_model.dart';
import 'package:snowmakers/firebase_options.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService extends IAuthService {
  final FirebaseAuth auth;

  AuthService(this.auth);

  @override
  Future<void> loginWithApple() async {
   try {
     final String rawNonce = _generateNonce();
     final String nonce = _sha256ofString(rawNonce);

     final AuthorizationCredentialAppleID appleCredential =
     await SignInWithApple.getAppleIDCredential(
       scopes: <AppleIDAuthorizationScopes>[
         AppleIDAuthorizationScopes.email,
         AppleIDAuthorizationScopes.fullName,
       ],
       nonce: nonce,
     );

     final OAuthCredential oauthCredential =
     OAuthProvider("apple.com").credential(
       idToken: appleCredential.identityToken,
       rawNonce: rawNonce,
     );

     final user = await auth.signInWithCredential(oauthCredential);
     final isRegisterBefore = await hasRegisterBefore();
     if (!isRegisterBefore) {
       _createUser(
         UserModel(
           email: user.user?.email ?? "",
           name: user.user?.displayName ?? "",
           photoUrl: user.user?.photoURL ?? "",
         ),
       );
     }
   } on SignInWithAppleAuthorizationException catch (e) {
     rethrow;
   }
  }

  String _generateNonce([int length = 32]) {
    const String charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final Random random = Random.secure();
    return List<String>.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    final List<int> bytes = utf8.encode(input);
    final Digest digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<bool> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
    ).signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final user = await auth.signInWithCredential(credential);
      final isRegisterBefore = await hasRegisterBefore();
      if (!isRegisterBefore) {
        _createUser(
          UserModel(
            email: user.user?.email ?? "",
            name: user.user?.displayName ?? "",
            photoUrl: user.user?.photoURL ?? "",
          ),
        );
      }
      return true;
    }
    return false;
  }

  @override
  Future<void> logout() async {
    final isUserLoggedInFromGoogle = await _checkAuthenticationType();
    if (isUserLoggedInFromGoogle == AuthenticationType.google) {
      await GoogleSignIn().disconnect();
    }
    await auth.signOut();
  }

  Future<AuthenticationType> _checkAuthenticationType() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      final userCredential = await user.getIdTokenResult();
      if (userCredential.signInProvider == "google.com") {
        return AuthenticationType.google;
      } else if (userCredential.signInProvider == "apple.com") {
        return AuthenticationType.apple;
      }
    }
    return AuthenticationType.defaultValue;
  }

  @override
  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<bool> checkIfAuth() async {
    return auth.currentUser != null;
  }

  @override
  Future<void> deleteAccount() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .delete();
    final unitsQuery = FirebaseFirestore.instance
        .collection('units')
        .where('userId', isEqualTo: auth.currentUser?.uid);
    final unitsSnapShot = await unitsQuery.get();
    final batch = FirebaseFirestore.instance.batch();
    for (final doc in unitsSnapShot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
    final reservationsQuery = FirebaseFirestore.instance
        .collection('reservations')
        .where('ownerId', isEqualTo: auth.currentUser?.uid);
    final reservationsSnapShot = await reservationsQuery.get();
    final batchReservation = FirebaseFirestore.instance.batch();
    for (final doc in reservationsSnapShot.docs) {
      batchReservation.delete(doc.reference);
    }
    await batchReservation.commit();
    await auth.currentUser?.delete();
    await logout();
  }

  @override
  Future<UserModel> getCurrentUserData() async {
    final userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();

    return UserModel.fromJson(userSnapshot.data()!);
  }

  @override
  Future<bool> hasRegisterBefore() async {
    final userSnapShot = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();
    if (userSnapShot.exists) {
      final user = UserModel.fromJson(userSnapShot.data()!);
      return user.name != null && user.email != null;
    } else {
      return false;
    }
  }

  Future<void> _createUser(UserModel user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .set(user.toJson());
  }

  @override
  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) {
    final user = UserModel(
      email: email,
      name: name,
    );
    _createUser(user);
    return loginWithEmailAndPassword(email, password);
  }

  @override
  Future<void> updateUser(UserModel user, File? image) async {
    String? result;
    if (image != null) {
      result = await _uploadImage(image);
      user.copyWith(photoUrl: result);
    }
    final currentUser = await getCurrentUserData();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .update(
          currentUser
              .copyWith(
                name: user.name ?? currentUser.name,
                email: user.email ?? currentUser.email,
                photoUrl: image != null ? result : currentUser.photoUrl,
                reservations: currentUser.reservations,
                units: currentUser.units,
              )
              .toJson(),
        );
  }

  Future<String> _uploadImage(File image) async {
      final ref = FirebaseStorage.instance
          .ref()
          .child('users/')
          .child(auth.currentUser!.uid);
      final result = await ref.putData(image.readAsBytesSync());
      final url = await result.ref.getDownloadURL();
      return url;
  }
}
