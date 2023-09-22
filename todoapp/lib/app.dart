import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/data/repositories/location_repository.dart';
import 'package:todoapp/features/home/presentation/pages/add_note_page/add_note_page.dart';
import 'package:todoapp/features/home/presentation/pages/home_page/home_page.dart';
import 'package:todoapp/features/login/data/repositories/authorization_repository.dart';
import 'package:todoapp/features/login/presentation/pages/login_page/login_page.dart';
import 'package:todoapp/features/theme/data/repositories/theme_repository.dart';
import 'package:todoapp/features/theme/presentation/theme_bloc.dart';
import 'package:todoapp/features/theme/presentation/theme_state.dart';
import 'package:todoapp/services/repository_firestore.dart';

final AuthorizationRepository authorizationRepository =
    AuthorizationRepository();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<AuthorizationRepository>(
        //   create: (context) => AuthorizationRepository(),
        // ),
        RepositoryProvider<RepositoryFirestore>(
          create: (context) => RepositoryFirestore(),
        ),
        RepositoryProvider<LocationRepository>(
          create: (context) => LocationRepository(),
        ),
        RepositoryProvider<ThemeRepository>(
            create: (context) => ThemeRepository())
      ],
      child: BlocProvider(
        create: (context) => ThemeBloc(
          themeRepository: context.read<ThemeRepository>(),
        ),
        child: BlocBuilder<ThemeBloc, bool>(
          builder: (context, isDarkMode) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeState(ThemeData(
                colorScheme: isDarkMode
                    ? const ColorScheme.dark()
                    : const ColorScheme.light(),
                useMaterial3: true,
              )).themeData,
              //? Change so that the user is logged in
              // home: const HomePage(title: 'Temporary no user!'),
              home: Builder(builder: (context) {
                // authorizationRepository.authStatusStream.listen((status) {
                //   status.when(
                //     unauthorized: () => Navigator.pushReplacementNamed(
                //         context, LoginPage.route),
                //     authorized: (_) =>
                //         Navigator.pushReplacementNamed(context, HomePage.route),
                //   );
                // });

                return const LoginPage();
              }),

              routes: {
                HomePage.route: (context) => const HomePage(title: 'Welcome'),
                LoginPage.route: (context) => const LoginPage(),
                AddNotePage.route: (context) => const AddNotePage(
                      title: "Adding new note",
                    ),
              },
            );
          },
        ),
      ),
    );
  }
}
