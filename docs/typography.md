# Typography

## Purpose

This app uses the local Cairo font family for both Arabic and English text so typography stays consistent without depending on the `google_fonts` package.

## Source of Truth

- `pubspec.yaml` registers the Cairo family from `assets/fonts/`.
- `lib/src/core/theme/app_text_styles.dart` applies the family to the shared `TextTheme`.
- `lib/src/core/theme/app_theme.dart` sets the app-wide `fontFamily` to Cairo.

## Included Weights

- `Cairo-Regular.ttf` for weight `400`
- `Cairo-Medium.ttf` for weight `500`
- `Cairo-SemiBold.ttf` for weight `600`
- `Cairo-Bold.ttf` for weight `700`

## Size Decision

Unused Cairo weights are intentionally removed from the bundle to reduce app size. If a future screen needs a heavier or lighter weight, add that exact file back to `assets/fonts/` and register it in `pubspec.yaml` before using the new `FontWeight`.
