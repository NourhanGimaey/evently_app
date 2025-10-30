import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  Future<AuthResponse> register(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    try {
      // 1. Create the user with email and password
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. Update user profile with display name (name)
      await credential.user?.updateDisplayName(name);

      print('Registration successful for user: ${credential.user?.uid}');
      return AuthResponse(success: true, credential: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthFailure.weakPassword.code) {
        return AuthResponse(success: false, failure: AuthFailure.weakPassword);
      } else if (e.code == AuthFailure.emailAlreadyInUse.code) {
        return AuthResponse(success: false, failure: AuthFailure.emailAlreadyInUse);
      }
      
      print('Unhandled FirebaseAuthException code: ${e.code}');
      return AuthResponse(success: false, failure: AuthFailure.unknownAuthError);
    } catch (e) {
      print(e);
      return AuthResponse(success: false, failure: AuthFailure.generalError);
    }
  }

  Future<AuthResponse> login(String email, String password) async {
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
        return AuthResponse(success: false, failure: AuthFailure.invalidCredential);
      }

      print('Unhandled FirebaseAuthException code during login: ${e.code}');
      return AuthResponse(success: false, failure: AuthFailure.unknownAuthError);
    } catch (e) {
      print(e);
      return AuthResponse(success: false, failure: AuthFailure.generalError);
    }
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
