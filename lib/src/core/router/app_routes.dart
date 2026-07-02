enum AppRoute {
  home('/home'),
  categories('/categories'),
  favorites('/favorites'),
  settings('/settings');

  const AppRoute(this.path);

  final String path;
}

extension AppRouteX on AppRoute {
  bool get isHome => this == AppRoute.home;
  bool get isCategories => this == AppRoute.categories;
  bool get isFavorites => this == AppRoute.favorites;
  bool get isSettings => this == AppRoute.settings;
}
