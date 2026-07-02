import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hady_alnabi/src/app/app.dart';
import 'package:hady_alnabi/src/core/di/service_locator.dart';

/// Exercises the localized app shell as users encounter it.
void main() {
  setUp(() async {
    await getIt.reset();
    setupServiceLocator();
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('starts in Arabic with RTL navigation', (tester) async {
    await _pumpApp(tester);

    expect(find.text('هدي النبي'), findsWidgets);
    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.text('التصنيفات'), findsOneWidget);
    expect(find.text('المفضلة'), findsOneWidget);
    expect(find.text('الإعدادات'), findsOneWidget);
    expect(
      tester
          .widget<Directionality>(find.byType(Directionality).first)
          .textDirection,
      TextDirection.rtl,
    );
  });

  testWidgets('switches tabs while preserving the shared scaffold', (
    tester,
  ) async {
    await _pumpApp(tester);

    await tester.tap(find.text('التصنيفات'));
    await tester.pumpAndSettle();
    expect(find.text('تصنيفات الأحاديث قادمة قريبًا.'), findsOneWidget);

    await tester.tap(find.text('المفضلة'));
    await tester.pumpAndSettle();
    expect(find.text('لا توجد مفضلة بعد'), findsOneWidget);
  });

  testWidgets('changes the app theme from settings', (tester) async {
    await _pumpApp(tester);

    await tester.tap(find.text('الإعدادات'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('الوضع الداكن'));
    await tester.pumpAndSettle();

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.dark);
  });
}

/// Waits for routing and generated localization to settle before assertions.
Future<void> _pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(const App());
  await tester.pumpAndSettle();
}
