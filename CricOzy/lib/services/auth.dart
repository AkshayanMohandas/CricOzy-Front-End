import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser {
  final String uid;

  CurrentUser({required this.uid});
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CurrentUser? _userFromFirebaseUser(User user) {
    return user != null ? CurrentUser(uid: user.uid) : null;
  }

  //Register
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        return _userFromFirebaseUser(user);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //LogIn
  Future logIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        return _userFromFirebaseUser(user);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //LogOut
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
