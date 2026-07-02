import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTextStyles {
  /// Applies one Arabic-friendly type family across both supported locales.
  static TextTheme from(ColorScheme colorScheme) {
    final baseTheme = GoogleFonts.cairoTextTheme();
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
      labelLarge: baseTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
