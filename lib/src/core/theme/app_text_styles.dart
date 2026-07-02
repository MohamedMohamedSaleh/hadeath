import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static const String fontFamily = 'Cairo';

  /// Applies one Arabic-friendly type family across both supported locales.
  static TextTheme from(ColorScheme colorScheme) {
    final baseTheme = Typography.material2021().black.apply(
      fontFamily: fontFamily,
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return baseTheme.copyWith(
      displaySmall: baseTheme.displaySmall?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: baseTheme.headlineSmall?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: baseTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: baseTheme.titleMedium?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: baseTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurface,
        height: 1.7,
      ),
      bodyMedium: baseTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
        height: 1.6,
      ),
      labelMedium: baseTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      labelLarge: baseTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
