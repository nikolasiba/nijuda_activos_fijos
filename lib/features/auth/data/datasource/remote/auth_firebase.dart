import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  Future<bool> loginFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      return false;
    }
    return true;
  }
}
