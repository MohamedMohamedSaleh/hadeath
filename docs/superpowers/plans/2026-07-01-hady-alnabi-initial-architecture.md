# Hady Al-nabi Initial Architecture Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a compilable Arabic-first Material 3 Flutter foundation with feature-first screens, generated localization, shell routing, dependency injection, and in-memory theme selection.

**Architecture:** Compose the app from shared `app` and `core` modules plus presentation-only feature modules. GetIt owns router and Cubit creation, while a `StatefulShellRoute.indexedStack` owns the persistent four-tab scaffold.

**Tech Stack:** Flutter, Dart, Material 3, flutter_bloc, bloc, get_it, go_router, equatable, intl, flutter_localizations, google_fonts, flutter_test

---

### Task 1: Package and Localization Foundation

**Files:**
- Modify: `pubspec.yaml`
- Create: `l10n.yaml`
- Create: `lib/l10n/app_ar.arb`
- Create: `lib/l10n/app_en.arb`
- Create: `.env`
- Create: `.env.example`
- Modify: `.gitignore`

- [ ] **Step 1: Configure package metadata and dependencies**

Rename the package to `hady_alnabi`, enable generated localization, preserve existing assets, and add only the approved packages.

- [ ] **Step 2: Add complete Arabic and English ARB catalogs**

Define every visible label used by the four tabs, placeholder states, theme selector, and language placeholder.

- [ ] **Step 3: Add localization and environment configuration**

Configure `l10n.yaml`, create non-secret environment examples, and ensure `.env` is ignored.

- [ ] **Step 4: Resolve packages and generate localizations**

Run: `flutter pub get`

Expected: dependencies resolve and `AppLocalizations` generation completes without errors.

### Task 2: Theme State Through TDD

**Files:**
- Create: `test/src/core/cubit/theme_cubit_test.dart`
- Create: `lib/src/core/cubit/theme_state.dart`
- Create: `lib/src/core/cubit/theme_cubit.dart`
- Create: `lib/src/core/theme/app_colors.dart`
- Create: `lib/src/core/theme/app_text_styles.dart`
- Create: `lib/src/core/theme/app_theme.dart`

- [ ] **Step 1: Write a failing ThemeCubit test**

Test the initial system mode and explicit transitions to light, dark, and system.

- [ ] **Step 2: Verify the test fails because ThemeCubit is absent**

Run: `flutter test test/src/core/cubit/theme_cubit_test.dart`

Expected: FAIL because production theme state files do not exist.

- [ ] **Step 3: Implement immutable enum-backed theme state and Cubit**

Use one Equatable state with `copyWith`, an enum with boolean extension getters, and a documented `setThemeMode` method.

- [ ] **Step 4: Verify ThemeCubit tests pass**

Run: `flutter test test/src/core/cubit/theme_cubit_test.dart`

Expected: PASS.

- [ ] **Step 5: Implement Material 3 theme tokens**

Create explicit light/dark color schemes and component themes for app bars, navigation, cards, buttons, inputs, dialogs, and snack bars.

### Task 3: Router, Composition, and Screens Through TDD

**Files:**
- Replace: `test/widget_test.dart`
- Replace: `lib/main.dart`
- Create: `lib/src/app/app.dart`
- Create: `lib/src/app/app_bloc_providers.dart`
- Create: `lib/src/core/constants/app_constants.dart`
- Create: `lib/src/core/di/service_locator.dart`
- Create: `lib/src/core/localization/l10n.dart`
- Create: `lib/src/core/router/app_routes.dart`
- Create: `lib/src/core/router/app_router.dart`
- Create: `lib/src/core/widgets/app_scaffold.dart`
- Create: `lib/src/features/home/presentation/pages/home_page.dart`
- Create: `lib/src/features/categories/presentation/pages/categories_page.dart`
- Create: `lib/src/features/favorites/presentation/pages/favorites_page.dart`
- Create: `lib/src/features/settings/presentation/pages/settings_page.dart`

- [ ] **Step 1: Write failing widget tests**

Test Arabic app startup, RTL directionality, all localized navigation labels, tab switching, and settings theme selection.

- [ ] **Step 2: Verify widget tests fail against the starter app**

Run: `flutter test test/widget_test.dart`

Expected: FAIL because `App`, localization, and feature pages do not exist.

- [ ] **Step 3: Implement DI and root app composition**

Initialize GetIt before `runApp`, provide ThemeCubit with `MultiBlocProvider`, and bind router, themes, delegates, supported locales, and Arabic locale to `MaterialApp.router`.

- [ ] **Step 4: Implement enum-backed shell routing**

Use `StatefulShellRoute.indexedStack` with one branch per route and a localized `NavigationBar` scaffold.

- [ ] **Step 5: Implement localized placeholder pages**

Build focused private widget classes, const constructors, accessible empty states, and no hardcoded visible strings.

- [ ] **Step 6: Verify widget tests pass**

Run: `flutter test test/widget_test.dart`

Expected: PASS.

### Task 4: Product Metadata and Documentation

**Files:**
- Modify: `android/app/src/main/AndroidManifest.xml`
- Modify: `ios/Runner/Info.plist`
- Modify: `web/index.html`
- Modify: `web/manifest.json`
- Create: `docs/architecture.md`

- [ ] **Step 1: Update display metadata**

Set native and web display names to `Hady Al-nabi` while retaining existing native bundle identifiers.

- [ ] **Step 2: Document architecture and future data extension**

Explain responsibilities, dependencies, routing, localization, theme state, and how feature-local data/domain layers can be added later.

### Task 5: Full Verification

**Files:**
- Modify: any implementation file needed to resolve verified errors

- [ ] **Step 1: Format all Dart files**

Run: `dart format lib test`

Expected: formatter exits successfully.

- [ ] **Step 2: Run the complete test suite**

Run: `flutter test`

Expected: all tests pass.

- [ ] **Step 3: Run static analysis**

Run: `flutter analyze`

Expected: no issues found.

- [ ] **Step 4: Review scope and diff**

Confirm no database, API, repository, model, JSON parsing, or persistence implementation was introduced, and preserve unrelated user changes.
