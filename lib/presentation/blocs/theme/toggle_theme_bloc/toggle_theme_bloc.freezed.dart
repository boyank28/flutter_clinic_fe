// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ToggleThemeEvent {
  ThemeData get themeRequest => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData themeRequest) toggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData themeRequest)? toggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData themeRequest)? toggle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Toggle value) toggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Toggle value)? toggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Toggle value)? toggle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToggleThemeEventCopyWith<ToggleThemeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleThemeEventCopyWith<$Res> {
  factory $ToggleThemeEventCopyWith(
          ToggleThemeEvent value, $Res Function(ToggleThemeEvent) then) =
      _$ToggleThemeEventCopyWithImpl<$Res, ToggleThemeEvent>;
  @useResult
  $Res call({ThemeData themeRequest});
}

/// @nodoc
class _$ToggleThemeEventCopyWithImpl<$Res, $Val extends ToggleThemeEvent>
    implements $ToggleThemeEventCopyWith<$Res> {
  _$ToggleThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeRequest = null,
  }) {
    return _then(_value.copyWith(
      themeRequest: null == themeRequest
          ? _value.themeRequest
          : themeRequest // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToggleImplCopyWith<$Res>
    implements $ToggleThemeEventCopyWith<$Res> {
  factory _$$ToggleImplCopyWith(
          _$ToggleImpl value, $Res Function(_$ToggleImpl) then) =
      __$$ToggleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeData themeRequest});
}

/// @nodoc
class __$$ToggleImplCopyWithImpl<$Res>
    extends _$ToggleThemeEventCopyWithImpl<$Res, _$ToggleImpl>
    implements _$$ToggleImplCopyWith<$Res> {
  __$$ToggleImplCopyWithImpl(
      _$ToggleImpl _value, $Res Function(_$ToggleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeRequest = null,
  }) {
    return _then(_$ToggleImpl(
      themeRequest: null == themeRequest
          ? _value.themeRequest
          : themeRequest // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$ToggleImpl implements _Toggle {
  const _$ToggleImpl({required this.themeRequest});

  @override
  final ThemeData themeRequest;

  @override
  String toString() {
    return 'ToggleThemeEvent.toggle(themeRequest: $themeRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleImpl &&
            (identical(other.themeRequest, themeRequest) ||
                other.themeRequest == themeRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleImplCopyWith<_$ToggleImpl> get copyWith =>
      __$$ToggleImplCopyWithImpl<_$ToggleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData themeRequest) toggle,
  }) {
    return toggle(themeRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData themeRequest)? toggle,
  }) {
    return toggle?.call(themeRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData themeRequest)? toggle,
    required TResult orElse(),
  }) {
    if (toggle != null) {
      return toggle(themeRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Toggle value) toggle,
  }) {
    return toggle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Toggle value)? toggle,
  }) {
    return toggle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Toggle value)? toggle,
    required TResult orElse(),
  }) {
    if (toggle != null) {
      return toggle(this);
    }
    return orElse();
  }
}

abstract class _Toggle implements ToggleThemeEvent {
  const factory _Toggle({required final ThemeData themeRequest}) = _$ToggleImpl;

  @override
  ThemeData get themeRequest;
  @override
  @JsonKey(ignore: true)
  _$$ToggleImplCopyWith<_$ToggleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ToggleThemeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData initialTheme) initial,
    required TResult Function(ThemeData themeResult) themeResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData initialTheme)? initial,
    TResult? Function(ThemeData themeResult)? themeResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData initialTheme)? initial,
    TResult Function(ThemeData themeResult)? themeResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ThemeResult value) themeResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ThemeResult value)? themeResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ThemeResult value)? themeResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleThemeStateCopyWith<$Res> {
  factory $ToggleThemeStateCopyWith(
          ToggleThemeState value, $Res Function(ToggleThemeState) then) =
      _$ToggleThemeStateCopyWithImpl<$Res, ToggleThemeState>;
}

/// @nodoc
class _$ToggleThemeStateCopyWithImpl<$Res, $Val extends ToggleThemeState>
    implements $ToggleThemeStateCopyWith<$Res> {
  _$ToggleThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ThemeData initialTheme});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ToggleThemeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialTheme = null,
  }) {
    return _then(_$InitialImpl(
      null == initialTheme
          ? _value.initialTheme
          : initialTheme // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.initialTheme);

  @override
  final ThemeData initialTheme;

  @override
  String toString() {
    return 'ToggleThemeState.initial(initialTheme: $initialTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.initialTheme, initialTheme) ||
                other.initialTheme == initialTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData initialTheme) initial,
    required TResult Function(ThemeData themeResult) themeResult,
  }) {
    return initial(initialTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData initialTheme)? initial,
    TResult? Function(ThemeData themeResult)? themeResult,
  }) {
    return initial?.call(initialTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData initialTheme)? initial,
    TResult Function(ThemeData themeResult)? themeResult,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(initialTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ThemeResult value) themeResult,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ThemeResult value)? themeResult,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ThemeResult value)? themeResult,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ToggleThemeState {
  const factory _Initial(final ThemeData initialTheme) = _$InitialImpl;

  ThemeData get initialTheme;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThemeResultImplCopyWith<$Res> {
  factory _$$ThemeResultImplCopyWith(
          _$ThemeResultImpl value, $Res Function(_$ThemeResultImpl) then) =
      __$$ThemeResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ThemeData themeResult});
}

/// @nodoc
class __$$ThemeResultImplCopyWithImpl<$Res>
    extends _$ToggleThemeStateCopyWithImpl<$Res, _$ThemeResultImpl>
    implements _$$ThemeResultImplCopyWith<$Res> {
  __$$ThemeResultImplCopyWithImpl(
      _$ThemeResultImpl _value, $Res Function(_$ThemeResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeResult = null,
  }) {
    return _then(_$ThemeResultImpl(
      null == themeResult
          ? _value.themeResult
          : themeResult // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$ThemeResultImpl implements _ThemeResult {
  const _$ThemeResultImpl(this.themeResult);

  @override
  final ThemeData themeResult;

  @override
  String toString() {
    return 'ToggleThemeState.themeResult(themeResult: $themeResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeResultImpl &&
            (identical(other.themeResult, themeResult) ||
                other.themeResult == themeResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeResultImplCopyWith<_$ThemeResultImpl> get copyWith =>
      __$$ThemeResultImplCopyWithImpl<_$ThemeResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData initialTheme) initial,
    required TResult Function(ThemeData themeResult) themeResult,
  }) {
    return themeResult(this.themeResult);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData initialTheme)? initial,
    TResult? Function(ThemeData themeResult)? themeResult,
  }) {
    return themeResult?.call(this.themeResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData initialTheme)? initial,
    TResult Function(ThemeData themeResult)? themeResult,
    required TResult orElse(),
  }) {
    if (themeResult != null) {
      return themeResult(this.themeResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ThemeResult value) themeResult,
  }) {
    return themeResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ThemeResult value)? themeResult,
  }) {
    return themeResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ThemeResult value)? themeResult,
    required TResult orElse(),
  }) {
    if (themeResult != null) {
      return themeResult(this);
    }
    return orElse();
  }
}

abstract class _ThemeResult implements ToggleThemeState {
  const factory _ThemeResult(final ThemeData themeResult) = _$ThemeResultImpl;

  ThemeData get themeResult;
  @JsonKey(ignore: true)
  _$$ThemeResultImplCopyWith<_$ThemeResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
