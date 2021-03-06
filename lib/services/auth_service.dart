import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_android_setup/models/users_model.dart';

class AuthService {
  /// firebase obj
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser => User

  Users? _usersFromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  // auth change use stream

  Stream<Users?> get user {
    return _auth.authStateChanges().map(_usersFromFirebaseUser);

    ///.map(_usersFromFirebaseUser);
  }

  /// sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _usersFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// sing in with email & password
  Future signWithMailPassword(String? mail, String? password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: mail!, password: password!);
      User user = result.user!;
      return _usersFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// register with email & password
  Future registerWithMailPassword(String? mail, String? password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: mail!, password: password!);
      User user = result.user!;
      return _usersFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// sign out
  Future signOut() async {
    try {
      print('sign out');
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      print('sign out failed');
    }
  }
}
