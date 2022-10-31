import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

//SIGN UP METHOD
  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHODJ
  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await _auth.signOut();

    log('signout');
  }

  //SEND LINK TO EMAIL METHOD
  Future<String?> sendPass({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //reauth
  Future<String?> reauth({required String email, required password}) async {
    try {
      _auth.currentUser?.reauthenticateWithCredential(
          EmailAuthProvider.credential(email: email, password: password));
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //updateemail
  Future<String?> updateEmail({required String email}) async {
    try {
      _auth.currentUser?.updateEmail(email);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }

  //updateemail
  Future<String?> updatePassword({required String password}) async {
    try {
      _auth.currentUser?.updatePassword(password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }

//userChanges
  Future<String?> userChanges(
      {required String email,
      required String password,
      required String setPassword}) async {
        user.updatePassword(password).then((_) {
                FirebaseAuth.instance.authStateChanges().listen((User? user) {
                  if (user == null) {
                    log('User is currently signed out!');
                  } else {
                    log('User password update');
                  }
                });
                log("User password update");
                });
    try {
      final emailChange = EmailAuthProvider.credential(
          email: _auth.currentUser!.email.toString(), password: setPassword);

      user.reauthenticateWithCredential(emailChange).then((value) {
        user.updateEmail(email).then((_) {
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              log('User is currently signed out!');
            } else {
              log('User email update');
            }
          });
          log("User email update Succes");
        });
      });
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

    
    return null;
  }
}
