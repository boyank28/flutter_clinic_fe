part of 'toggle_theme_bloc.dart';

@freezed
class ToggleThemeEvent with _$ToggleThemeEvent {
  const factory ToggleThemeEvent.toggle({required ThemeData themeRequest}) = _Toggle;
}
