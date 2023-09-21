import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todoapp/features/home/presentation/pages/home_page/home_page.dart';
import 'package:todoapp/features/login/domain/entities/auth_status.dart';
import 'package:todoapp/features/login/domain/entities/user_entity.dart';
import 'package:todoapp/features/login/presentation/pages/login_page/login_page.dart';

class AuthorizationRepository {
  AuthorizationRepository()
      : _authSubject = BehaviorSubject.seeded(const AuthStatus.unauthorized());
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: const [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final BehaviorSubject<AuthStatus> _authSubject;

  Stream<AuthStatus> get authStatusStream => _authSubject.stream;

  Future<UserEntity?> loginWithGoogle() async {
    try {
      final result = await _googleSignIn.signIn();

      if (result != null) {
        final UserEntity user = UserEntity(
          id: result.id,
          displayName: result.displayName,
          email: result.email,
          photoUrl: result.photoUrl,
        );

        _authSubject.add(AuthStatus.authorized(user));
        return user;
      } else {
        log('Logging with Google has failed. Result is null.');
      }
    } catch (e) {
      log('Logging with Google has failed. Error: $e');
    }

    return null;
  }
}
