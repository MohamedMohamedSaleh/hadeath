import 'package:flutter/material.dart';
import 'package:hady_alnabi/src/app/app.dart';
import 'package:hady_alnabi/src/core/di/service_locator.dart';

/// Initializes shared services before the widget tree requests them.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const App());
}
