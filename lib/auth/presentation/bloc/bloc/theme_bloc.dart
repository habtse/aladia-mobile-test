import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.system)) {
    // Register the event handler for ToggleThemeEvent
    on<ToggleThemeEvent>((event, emit) {
      // Toggle between light and dark theme
      final newThemeMode =
          state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      emit(ThemeState(themeMode: newThemeMode));
    });
  }
}
