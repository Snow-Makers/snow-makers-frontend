import 'package:firebase_auth/firebase_auth.dart';


mixin FirebaseExceptions {
  static String handleAuthException(FirebaseAuthException e) {
    return e.toString();
  }

  static String handleFirebaseException(FirebaseExceptions e) {
    return e.toString();
  }
}
