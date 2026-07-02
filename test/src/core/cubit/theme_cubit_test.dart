import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hady_alnabi/src/core/cubit/theme_cubit.dart';

/// Verifies the theme controller's public behavior before UI integration.
void main() {
  group('ThemeCubit', () {
    test('starts with the system theme', () {
      final cubit = ThemeCubit();
      addTearDown(cubit.close);

      expect(cubit.state.themeMode, ThemeMode.system);
    });

    test('switches among light, dark, and system themes', () {
      final cubit = ThemeCubit();
      addTearDown(cubit.close);

      expect(
        cubit.stream,
        emitsInOrder(<dynamic>[
          isA<ThemeState>().having(
            (ThemeState state) => state.themeMode,
            'themeMode',
            ThemeMode.light,
          ),
          isA<ThemeState>().having(
            (ThemeState state) => state.themeMode,
            'themeMode',
            ThemeMode.dark,
          ),
          isA<ThemeState>().having(
            (ThemeState state) => state.themeMode,
            'themeMode',
            ThemeMode.system,
          ),
        ]),
      );

      cubit
        ..setThemeMode(ThemeMode.light)
        ..setThemeMode(ThemeMode.dark)
        ..setThemeMode(ThemeMode.system);
    });
  });
}
