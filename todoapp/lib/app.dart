import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/presentation/HomePage.dart';
import 'package:todoapp/features/login/data/repositories/authorization_repository.dart';
import 'package:todoapp/features/login/presentation/pages/login_page/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthorizationRepository>(
            create: (context) => AuthorizationRepository()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const HomePage(title: 'Siemanko!'),
        home: const LoginPage(),
        routes: {
          '/home': (context) => const HomePage(title: 'Siemanko, to /home!'),
          '/login': (context) => const LoginPage(),
        },
      ),
    );
  }
}
