# Hady Al-nabi Architecture

## Purpose

The current codebase is the presentation foundation for Hady Al-nabi. It starts the app, provides Arabic and English localization, switches light and dark themes in memory, and hosts four persistent navigation branches. It intentionally contains no Hadith models, repositories, database, API, JSON loading, or seed process.

## Structure

- `lib/main.dart` initializes Flutter and the service locator.
- `lib/src/app` composes global Cubits and `MaterialApp.router`.
- `lib/src/core` contains shared constants, dependency injection, localization access, routing, themes, and shell widgets.
- `lib/src/features` contains feature-local presentation code. Each feature can grow independently without moving its UI into a global layer.
- `lib/l10n` is the source and generated output for Arabic and English strings.

## State and Dependencies

GetIt defines object lifetimes. `AppRouter` is a lazy singleton because one router must retain branch navigation state. `ThemeCubit` is a factory dependency supplied once at the app root through `MultiBlocProvider`. Its single immutable state stores `ThemeMode`; persistence is intentionally deferred.

Future feature Cubits should also expose one immutable state class, use enums for substates, and provide `copyWith` updates.

## Routing

`AppRouter.routes` exposes a `GoRouter` configured with `StatefulShellRoute.indexedStack`. Home, categories, favorites, and settings each own a branch. This preserves tab state and leaves room for nested routes such as a Hadith details screen inside a feature branch.

## Localization

`app_ar.arb` and `app_en.arb` own all visible strings. Flutter generates `AppLocalizations`, and `BuildContextL10nX` provides concise typed access from widgets. Arabic is the current default locale, so Flutter supplies RTL directionality automatically.

When runtime locale switching is added, introduce a locale Cubit beside `ThemeCubit` and bind its state to `MaterialApp.router.locale`. The ARB and feature UI structure do not need to change.

## Adding JSON and a Local Database

Add data capabilities only inside the feature that needs them:

1. Add feature entities and repository interfaces under `lib/src/features/<feature>/domain` when business rules justify that boundary.
2. Add JSON DTOs, mappers, local data sources, and repository implementations under `lib/src/features/<feature>/data`.
3. Keep asset seeding behind a dedicated data source so UI and Cubits never parse JSON directly.
4. Register production and mock implementations in `service_locator.dart`, selected through a feature-specific `<FEATURE_NAME>_REPOSITORY_MODE` environment variable.
5. Inject the repository into a feature Cubit and map failures to enum-backed presentation substates.

This extension leaves app startup, themes, localization, and shell navigation intact. A database engine should be selected only when the schema and query requirements are known.

## Environment

`.env.example` documents `API_BASE_URL` and `REPOSITORY_MODE`. The local `.env` is ignored. No environment loader exists yet because no current service consumes these values; add one alongside the first repository implementation rather than creating unused infrastructure.
