# Hady Al-nabi Initial Architecture Design

## Purpose

Create a production-ready Flutter foundation for the Islamic Hadith app **Hady Al-nabi** (`هدي النبي`). This phase establishes startup, theming, routing, dependency injection, localization, and placeholder presentation only. It intentionally excludes models, repositories, APIs, databases, persistence, JSON loading, and seed data.

## Naming

- Rename the Dart package from `hadeath` to `hady_alnabi`.
- Use `Hady Al-nabi` as the English display name and `هدي النبي` as the localized in-app title.
- Update Android, iOS, and web display metadata.
- Keep existing native bundle identifiers until a production organization identifier is provided. Renaming them to another `com.example` value would create churn without producing release-ready identifiers.

## Architecture

Use a pragmatic feature-first structure under `lib/src`. Shared application concerns live in `app/` and `core/`; each screen lives in its own feature presentation directory. Do not introduce `domain/` or `data/` layers in this phase because no business entities or data access exist yet.

The root `App` owns composition only. GetIt creates long-lived application services, `MultiBlocProvider` injects state into the widget tree, and `MaterialApp.router` binds theme, localization, and routing.

## Application Composition

- `main.dart` initializes Flutter, configures GetIt, and starts `App`.
- `service_locator.dart` registers `AppRouter` as a lazy singleton and `ThemeCubit` as a factory.
- `app_bloc_providers.dart` creates the root providers from GetIt.
- `app.dart` rebuilds `MaterialApp.router` when `ThemeMode` changes.
- Theme preference remains in memory and defaults to `ThemeMode.system`.

## Routing

Use `go_router` with `StatefulShellRoute.indexedStack`. Four branches expose `/home`, `/categories`, `/favorites`, and `/settings`. The indexed stack preserves each tab's navigation state and gives future nested feature routes a clean branch boundary.

`AppScaffold` receives the navigation shell and renders a localized Material 3 `NavigationBar`. Selecting the active destination returns that branch to its initial location; selecting another destination switches branches.

## Localization

Use Flutter's generated `AppLocalizations` from ARB files in `lib/l10n`. Arabic and English are supported, Arabic is selected by default, and Flutter's localization delegates provide RTL directionality automatically.

All visible copy is sourced from localization keys. The initial keys cover app identity, tab labels, welcome content, placeholder content, empty states, theme choices, and the future-language placeholder.

## Theme System

Create complete Material 3 light and dark themes from explicit `ColorScheme` values. The shared identity uses forest green `#1F5E4A` and gold `#D4A857`; light surfaces use warm cream and white, while dark surfaces use deep green-black tones.

`AppTheme` configures typography, app bars, navigation bars, cards, elevated/outlined/text buttons, inputs, dialogs, and snack bars. `AppTextStyles` centralizes readable Arabic-friendly styles using Google Fonts. Components use rounded corners and comfortable spacing without decorative complexity.

## Screens

- Home presents a localized welcome card and a clearly empty Hadith-of-the-day section.
- Categories presents localized placeholder cards without inventing category data.
- Favorites presents a localized empty state.
- Settings presents three localized theme choices and a disabled future-language row.

Large screens are split into private widget classes in their feature directories. No function widgets are used.

## Environment

Add `.env.example` containing `API_BASE_URL` and `REPOSITORY_MODE=PRODUCTION`, add `.env` to `.gitignore`, and create a local `.env`. No loader is added because this phase has no environment-dependent service; that remains a deliberate future boundary.

## Error Handling

No external I/O exists in this phase. Routing starts at `/home`, uses typed enum-backed route metadata where practical, and exposes no error-prone asynchronous operations. Future data failures belong in feature Cubits and localized presentation states rather than the app shell.

## Testing

Follow test-first development for behavior:

- Unit-test `ThemeCubit` transitions among system, light, and dark modes.
- Widget-test Arabic startup and RTL directionality.
- Widget-test bottom navigation and route switching.
- Widget-test settings theme selection.
- Retain static verification through `dart format`, localization generation, `flutter test`, and `flutter analyze`.

## Future Data Extension

When JSON and local storage arrive, add focused `data/` and optional `domain/` directories inside the affected feature only. Define repository interfaces around feature needs, register implementations in GetIt, and inject them into feature Cubits. The app shell, theme, localization, and shell routing remain unchanged.

## Out of Scope

- Hadith/category models and business rules
- JSON assets, parsing, and seed orchestration
- Local database engines or schemas
- Repositories and data sources
- API clients and network handling
- Persisted theme or locale selection
