import 'package:flutter/material.dart';
import 'package:hady_alnabi/src/core/constants/app_constants.dart';
import 'package:hady_alnabi/src/core/localization/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Introduces the product without coupling the page to future Hadith data.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.appTitle)),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _WelcomeCard(),
            SizedBox(height: AppConstants.sectionSpacing),
            _HadithPlaceholder(),
          ],
        ),
      ),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard();

  /// Gives the empty application a calm, recognizable first impression.
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            colorScheme.primary,
            colorScheme.primary.withValues(alpha: 0.78),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.auto_stories_rounded,
              color: colorScheme.secondary,
              size: 38,
            ),
            const SizedBox(height: 36),
            Text(
              context.l10n.welcomeTitle,
              style: textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              context.l10n.welcomeSubtitle,
              style: textTheme.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

class _HadithPlaceholder extends StatelessWidget {
  const _HadithPlaceholder();

  /// Reserves the future daily-Hadith surface without inventing content.
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.wb_sunny_outlined, color: colorScheme.secondary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    context.l10n.hadithOfTheDay,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(context.l10n.hadithPlaceholder),
          ],
        ),
      ),
    );
  }
}
