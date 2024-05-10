import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_theme_event.dart';
part 'toggle_theme_state.dart';
part 'toggle_theme_bloc.freezed.dart';

class ToggleThemeBloc extends Bloc<ToggleThemeEvent, ToggleThemeState> {
  ToggleThemeBloc() : super(_Initial(ThemeData.light())) {
    on<_Toggle>((event, emit) async {
      emit(_ThemeResult(event.themeRequest));
    });
  }
}
