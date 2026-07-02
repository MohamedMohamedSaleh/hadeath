part of 'theme_cubit.dart';

final class ThemeState extends Equatable {
  const ThemeState({this.themeMode = ThemeMode.system});

  final ThemeMode themeMode;

  /// Preserves immutable state updates as more appearance settings are added.
  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  List<Object> get props => <Object>[themeMode];
}
