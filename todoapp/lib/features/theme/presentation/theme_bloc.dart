import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/theme/data/repositories/theme_repository.dart';

enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  final ThemeRepository themeRepository;

  ThemeBloc({required this.themeRepository}) : super(false) {
    _initTheme();

    on<ThemeEvent>((event, emit) async {
      if (event == ThemeEvent.toggle) {
        final currentState = state;
        log("ThemeBloc.on<ThemeEvent>() $currentState", name: "ThemeBloc");
        await themeRepository.setDarkMode(!currentState);
        emit(!currentState);
      }
    });
  }

  void _initTheme() async {
    log("ThemeBloc._initTheme()");
    final isDarkMode = await themeRepository.isDarkMode();
    emit(isDarkMode);
  }
}
