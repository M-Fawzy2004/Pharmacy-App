// ignore_for_file: void_checks

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pharmacy_app/core/errors/failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Abstract Repository Interface
abstract class AuthRepository {
  // Methods to be implemented

  // Sign Up
  Future<Either<Failures, void>> signUp(
    String email,
    String password,
  );
  // Sign In
  Future<Either<Failures, void>> signIn(
    String email,
    String password,
  );
  // Sign In With Google
  Future<Either<Failures, void>> signInWithGoogle();
  // Sign Out
  Future<Either<Failures, void>> signOut();
}

// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient supabase;

  AuthRepositoryImpl(this.supabase);

  // Methods to be implemented
  // Sign Up
  @override
  Future<Either<Failures, void>> signUp(
    String email,
    String password,
  ) async {
    try {
      final res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (res.user == null) {
        return left(ServerFailure(message: "User creation failed."));
      }
      log('Sign Up Success: ${res.user?.id}');
      return right(res);
    } catch (e) {
      return left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  // Sign In
  @override
  Future<Either<Failures, void>> signIn(String email, String password) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (res.user == null) {
        return left(ServerFailure(message: "Sign in failed."));
      }
      log('Sign In Success: ${res.user?.id}');
      return right(res);
    } catch (e) {
      return left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  // Sign in with Google
  @override
  Future<Either<Failures, void>> signInWithGoogle() async {
    try {
      const webClientId =
          '362884712086-om1kcrakksbn95c2r443dslick7sljeo.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      final res = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      return right(res);
    } catch (e) {
      return left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  // sign out
  @override
  Future<Either<Failures, void>> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await googleSignIn.signOut();
      await supabase.auth.signOut();
      return right(null);
    } catch (e) {
      return left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  // is logged in
  bool isLoggedIn() => supabase.auth.currentUser != null;
}
