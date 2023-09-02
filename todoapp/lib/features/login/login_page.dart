import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// A login page
///
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: const [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final userData = await _googleSignIn.signIn();
              if (userData == null) {
                return log('User data is null', name: 'Login error');
              }
              log(userData!.email.toString());
              Navigator.pushReplacementNamed(context, '/home');
            } catch (error) {
              log(error.toString(), name: 'Login error', time: DateTime.now());
            }
          },
          child: const Text('Login with Google'),
        ),
      ),
    );
  }
}
