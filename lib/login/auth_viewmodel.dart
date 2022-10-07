import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pentexe/user/user.dart' as app;

class AuthViewModel extends ChangeNotifier {
  bool? isLogged;
  late FirebaseAuth _auth;
  app.User? user;

  AuthViewModel() {
    _initFirebaseAuth();
  }

  _initFirebaseAuth() async {
    _auth = FirebaseAuth.instanceFor(
        app: Firebase.app(), persistence: Persistence.LOCAL);

    _auth.userChanges().listen(_onUserUpdated);
    // _auth.authStateChanges().listen((user) {
    //   _onUserUpdated(user);
    // });
  }

  _onUserUpdated(User? user) {
    isLogged = user != null;
    if (user == null) {
      this.user = null;
    } else {
      this.user = app.User(user.uid, user.displayName, user.email);
    }

    notifyListeners();
  }

  logout() async {
    await _auth.signOut();
  }

  logInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');

      await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } else {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await _auth.signInWithCredential(credential);
    }
  }
}
