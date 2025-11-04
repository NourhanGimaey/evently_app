import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService extends ChangeNotifier {
  static User? getUserData() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<AuthResponse> signUpEmailPassword(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await credential.user?.updateDisplayName(name);

      log('Registration successful for user: ${credential.user?.uid}');
      return AuthResponse(success: true, credential: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthFailure.weakPassword.code) {
        return AuthResponse(success: false, failure: AuthFailure.weakPassword);
      } else if (e.code == AuthFailure.emailAlreadyInUse.code) {
        return AuthResponse(
          success: false,
          failure: AuthFailure.emailAlreadyInUse,
        );
      }

      log('Unhandled FirebaseAuthException code: ${e.code}');
      return AuthResponse(
        success: false,
        failure: AuthFailure.unknownAuthError,
      );
    } catch (e) {
      log(e.toString());
      return AuthResponse(success: false, failure: AuthFailure.generalError);
    }
  }

  Future<AuthResponse> signInEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      log('Login successful for user: ${credential.user?.uid}');
      return AuthResponse(success: true, credential: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthFailure.userNotFound.code) {
        return AuthResponse(success: false, failure: AuthFailure.userNotFound);
      } else if (e.code == AuthFailure.invalidCredential.code) {
        return AuthResponse(
          success: false,
          failure: AuthFailure.invalidCredential,
        );
      }

      log('Unhandled FirebaseAuthException code during login: ${e.code}');
      return AuthResponse(
        success: false,
        failure: AuthFailure.unknownAuthError,
      );
    } catch (e) {
      log(e.toString());
      return AuthResponse(success: false, failure: AuthFailure.generalError);
    }
  }

  Future<void> signInGoogle() async {
    try {

      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(
        serverClientId: "40572729229-3qsr712vjlb64uf166et58eaahdmhk6a.apps.googleusercontent.com",
      );
      final GoogleSignInAccount? googleUser = await googleSignIn
          .authenticate();

    if ( googleUser == null) return;   

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (exception) {
      log(exception.toString());
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn.instance.signOut();
  }

}

class AuthResponse {
  final bool success;
  final UserCredential? credential;
  final AuthFailure? failure;

  AuthResponse({required this.success, this.credential, this.failure});
}

enum AuthFailure {
  weakPassword('weak-password'),
  emailAlreadyInUse('email-already-in-use'),
  userNotFound('user-not-found'),
  invalidCredential('invalid-credential'),
  unknownAuthError('An unknown Firebase authentication error occurred.'),
  generalError('An unexpected error occurred.');

  final String code;
  const AuthFailure(this.code);
}
