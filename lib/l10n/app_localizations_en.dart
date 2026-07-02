// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Hady Al-nabi';

  @override
  String get home => 'Home';

  @override
  String get categories => 'Categories';

  @override
  String get favorites => 'Favorites';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get systemTheme => 'System';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get welcomeTitle => 'Welcome to Hady Al-nabi';

  @override
  String get welcomeSubtitle =>
      'Start your journey with the Hadiths of the Prophet ﷺ';

  @override
  String get hadithOfTheDay => 'Hadith of the day';

  @override
  String get hadithPlaceholder => 'A selected Hadith will appear here soon.';

  @override
  String get categoriesPlaceholder => 'Hadith categories are coming soon.';

  @override
  String get categoryFaith => 'Faith';

  @override
  String get categoryWorship => 'Worship';

  @override
  String get categoryCharacter => 'Good character';

  @override
  String get noFavoritesTitle => 'No favorites yet';

  @override
  String get noFavoritesSubtitle => 'Hadiths you save will appear here.';

  @override
  String get language => 'Language';

  @override
  String get languageComingSoon =>
      'Arabic and English switching is coming soon.';
}
