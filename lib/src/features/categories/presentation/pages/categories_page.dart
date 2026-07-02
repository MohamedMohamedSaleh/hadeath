import 'package:flutter/material.dart';
import 'package:hady_alnabi/src/core/constants/app_constants.dart';
import 'package:hady_alnabi/src/core/localization/l10n.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  /// Previews the future category rhythm without defining domain categories.
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.categories)),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.pagePadding),
        children: <Widget>[
          Text(l10n.categoriesPlaceholder),
          const SizedBox(height: AppConstants.sectionSpacing),
          _CategoryCard(label: l10n.categoryFaith, icon: Icons.shield_outlined),
          const SizedBox(height: 12),
          _CategoryCard(
            label: l10n.categoryWorship,
            icon: Icons.mosque_outlined,
          ),
          const SizedBox(height: 12),
          _CategoryCard(
            label: l10n.categoryCharacter,
            icon: Icons.spa_outlined,
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.label, required this.icon});

  final String label;
  final IconData icon;

  /// Establishes a reusable visual slot for later data-backed categories.
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        title: Text(label),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      ),
    );
  }
}
