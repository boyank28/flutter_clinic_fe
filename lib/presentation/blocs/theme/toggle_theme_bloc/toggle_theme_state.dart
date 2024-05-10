part of 'toggle_theme_bloc.dart';

@freezed
class ToggleThemeState with _$ToggleThemeState {
  const factory ToggleThemeState.initial(ThemeData initialTheme) = _Initial;
  const factory ToggleThemeState.themeResult(ThemeData themeResult) = _ThemeResult;
}
