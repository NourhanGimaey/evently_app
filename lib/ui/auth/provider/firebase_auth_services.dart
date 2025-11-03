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

      print('Registration successful for user: ${credential.user?.uid}');
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

      print('Unhandled FirebaseAuthException code: ${e.code}');
      return AuthResponse(
        success: false,
        failure: AuthFailure.unknownAuthError,
      );
    } catch (e) {
      print(e);
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

      print('Login successful for user: ${credential.user?.uid}');
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

      print('Unhandled FirebaseAuthException code during login: ${e.code}');
      return AuthResponse(
        success: false,
        failure: AuthFailure.unknownAuthError,
      );
    } catch (e) {
      print(e);
      return AuthResponse(success: false, failure: AuthFailure.generalError);
    }
  }

  Future<User?> signInGoogle() async {
    GoogleSignIn.instance;
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    var cred = await FirebaseAuth.instance.signInWithCredential(credential);
    return cred.user;
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
