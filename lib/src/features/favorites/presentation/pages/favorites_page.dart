import 'package:flutter/material.dart';
import 'package:hady_alnabi/src/core/constants/app_constants.dart';
import 'package:hady_alnabi/src/core/localization/l10n.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  /// Communicates the empty collection without requiring persistence yet.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.favorites)),
      body: const Padding(
        padding: EdgeInsets.all(AppConstants.pagePadding),
        child: Center(child: _FavoritesEmptyState()),
      ),
    );
  }
}

class _FavoritesEmptyState extends StatelessWidget {
  const _FavoritesEmptyState();

  /// Keeps empty-state guidance visually gentle and immediately understandable.
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircleAvatar(
          radius: 44,
          backgroundColor: colorScheme.primary.withValues(alpha: 0.10),
          child: Icon(
            Icons.favorite_border_rounded,
            size: 42,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          context.l10n.noFavoritesTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(context.l10n.noFavoritesSubtitle, textAlign: TextAlign.center),
      ],
    );
  }
}
