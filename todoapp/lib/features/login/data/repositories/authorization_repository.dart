import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:todoapp/features/login/domain/entities/user_entity.dart';

class AuthorizationRepository {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: const [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<UserEntity?> loginWithGoogle() async {
    try {
      final result = await _googleSignIn.signIn();

      if (result != null) {
        return UserEntity(
          id: result.id,
          displayName: result.displayName,
          email: result.email,
          photoUrl: result.photoUrl,
        );
      } else {
        log('Logging with Google has failed. Result is null.');
      }
    } catch (e) {
      log('Logging with Google has failed. Error: $e');
    }

    return null;
  }
}
