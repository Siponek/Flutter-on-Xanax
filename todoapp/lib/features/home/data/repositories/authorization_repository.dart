import 'package:google_sign_in/google_sign_in.dart';

class AuthorizatonRepository {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: const [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> loginWithGoogle() async {
    final result = await _googleSignIn.signIn();
  }
}
