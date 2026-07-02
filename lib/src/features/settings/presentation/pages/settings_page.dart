import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hady_alnabi/src/core/constants/app_constants.dart';
import 'package:hady_alnabi/src/core/cubit/theme_cubit.dart';
import 'package:hady_alnabi/src/core/localization/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  /// Exposes only settings that have working in-memory behavior in this phase.
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.pagePadding),
        children: <Widget>[
          Text(l10n.theme, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          const _ThemeSelector(),
          const SizedBox(height: AppConstants.sectionSpacing),
          Text(l10n.language, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              enabled: false,
              leading: const Icon(Icons.translate_rounded),
              title: Text(l10n.language),
              subtitle: Text(l10n.languageComingSoon),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeSelector extends StatelessWidget {
  const _ThemeSelector();

  /// Reflects Cubit state so selection remains consistent across rebuilds.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Card(
          child: Column(
            children: <Widget>[
              _ThemeTile(
                label: context.l10n.systemTheme,
                icon: Icons.brightness_auto_rounded,
                mode: ThemeMode.system,
                selectedMode: state.themeMode,
              ),
              const Divider(height: 1),
              _ThemeTile(
                label: context.l10n.lightTheme,
                icon: Icons.light_mode_outlined,
                mode: ThemeMode.light,
                selectedMode: state.themeMode,
              ),
              const Divider(height: 1),
              _ThemeTile(
                label: context.l10n.darkTheme,
                icon: Icons.dark_mode_outlined,
                mode: ThemeMode.dark,
                selectedMode: state.themeMode,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ThemeTile extends StatelessWidget {
  const _ThemeTile({
    required this.label,
    required this.icon,
    required this.mode,
    required this.selectedMode,
  });

  final String label;
  final IconData icon;
  final ThemeMode mode;
  final ThemeMode selectedMode;

  /// Uses the whole row as a generous and accessible selection target.
  @override
  Widget build(BuildContext context) {
    final isSelected = mode == selectedMode;
    return ListTile(
      onTap: () => context.read<ThemeCubit>().setThemeMode(mode),
      leading: Icon(icon),
      title: Text(label),
      trailing: Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
      ),
    );
  }
}
