import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hady_alnabi/src/app/app_bloc_providers.dart';
import 'package:hady_alnabi/src/core/constants/app_constants.dart';
import 'package:hady_alnabi/src/core/cubit/theme_cubit.dart';
import 'package:hady_alnabi/src/core/di/service_locator.dart';
import 'package:hady_alnabi/src/core/localization/l10n.dart';
import 'package:hady_alnabi/src/core/router/app_router.dart';
import 'package:hady_alnabi/src/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  /// Keeps top-level state providers outside MaterialApp for global access.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.providers,
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  /// Rebuilds only the app configuration when the appearance mode changes.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => context.l10n.appTitle,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          locale: AppConstants.defaultLocale,
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          routerConfig: getIt<AppRouter>().routes,
        );
      },
    );
  }
}
