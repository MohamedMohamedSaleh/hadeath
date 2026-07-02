// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'هدي النبي';

  @override
  String get home => 'الرئيسية';

  @override
  String get categories => 'التصنيفات';

  @override
  String get favorites => 'المفضلة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get theme => 'المظهر';

  @override
  String get systemTheme => 'حسب النظام';

  @override
  String get lightTheme => 'الوضع الفاتح';

  @override
  String get darkTheme => 'الوضع الداكن';

  @override
  String get welcomeTitle => 'مرحبًا بك في هدي النبي';

  @override
  String get welcomeSubtitle => 'ابدأ رحلتك مع أحاديث النبي ﷺ';

  @override
  String get hadithOfTheDay => 'حديث اليوم';

  @override
  String get hadithPlaceholder => 'سيظهر هنا حديث مختار قريبًا.';

  @override
  String get categoriesPlaceholder => 'تصنيفات الأحاديث قادمة قريبًا.';

  @override
  String get categoryFaith => 'الإيمان';

  @override
  String get categoryWorship => 'العبادات';

  @override
  String get categoryCharacter => 'حسن الخلق';

  @override
  String get noFavoritesTitle => 'لا توجد مفضلة بعد';

  @override
  String get noFavoritesSubtitle => 'ستظهر هنا الأحاديث التي تحفظها.';

  @override
  String get language => 'اللغة';

  @override
  String get languageComingSoon =>
      'التبديل بين العربية والإنجليزية قادم قريبًا.';
}
