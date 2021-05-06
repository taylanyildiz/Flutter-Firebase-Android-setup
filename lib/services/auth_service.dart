import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  /// firebase obj
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sing in with email & password

  // register with email & password

  // sign out

}
