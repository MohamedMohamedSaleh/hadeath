import 'package:go_router/go_router.dart';
import 'package:hady_alnabi/src/core/router/app_routes.dart';
import 'package:hady_alnabi/src/core/widgets/app_scaffold.dart';
import 'package:hady_alnabi/src/features/categories/presentation/pages/categories_page.dart';
import 'package:hady_alnabi/src/features/favorites/presentation/pages/favorites_page.dart';
import 'package:hady_alnabi/src/features/home/presentation/pages/home_page.dart';
import 'package:hady_alnabi/src/features/settings/presentation/pages/settings_page.dart';

final class AppRouter {
  AppRouter() : _router = _routerConfig;

  final GoRouter _router;

  GoRouter get routes => _router;
}

GoRouter get _routerConfig => GoRouter(
  initialLocation: AppRoute.home.path,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppScaffold(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.home.path,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.categories.path,
              builder: (context, state) => const CategoriesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.favorites.path,
              builder: (context, state) => const FavoritesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.settings.path,
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
