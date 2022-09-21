import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_app/model/users.dart';

class AuthSerives {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _usersFromFirebaseUser(User user) {
    return user != null ? Users() : null;
  }

  Future signMailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _usersFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print('error : ${e.code}');
      return null;
    }
  }

  Future registerMailPasword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      return _usersFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print('error : ${e.code}');
      return null;
    }
  }

  Future logOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print('error : ${e.code}');
    }
  }

  Stream<Users> get user {
    return _auth.authStateChanges().map(_usersFromFirebaseUser);
  }
}
