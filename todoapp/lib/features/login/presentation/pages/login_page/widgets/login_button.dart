import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/presentation/pages/home_page/home_page.dart';
import 'package:todoapp/features/login/presentation/cubits/login_cubit.dart';
import 'package:todoapp/features/login/presentation/cubits/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  static const String _loginButtonText = 'Login with Google';

  // Login button on-press action
  void _onPressed(BuildContext context) => context.read<LoginCubit>().login();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: context.read<LoginCubit>(),
      listener: (context, state) {
        state.whenOrNull(
          success: (user) {
            log("${user.displayName} logged in", name: 'LoginPage');
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login successful')));
            Navigator.pushReplacementNamed(
                context, HomePage.route); // TODO chyba do wywalenia
          },
          failure: (message) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Failed')),
          ),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const CircularProgressIndicator(),
          orElse: () => ElevatedButton(
            onPressed: () => _onPressed(context),
            child: const Text(_loginButtonText, style: TextStyle(fontSize: 22)),
          ),
        );
      },
    );
  }
}
