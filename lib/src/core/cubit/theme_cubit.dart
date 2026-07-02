import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

final class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  /// Keeps appearance changes centralized for every screen in the app.
  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
