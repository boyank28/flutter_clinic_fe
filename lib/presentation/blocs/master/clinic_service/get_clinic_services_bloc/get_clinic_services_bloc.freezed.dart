// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_clinic_services_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetClinicServicesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) getAll,
    required TResult Function() clearChecked,
    required TResult Function(int index, bool value) checkedToggle,
    required TResult Function(int id) increaseQty,
    required TResult Function(int id) decreaseQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? getAll,
    TResult? Function()? clearChecked,
    TResult? Function(int index, bool value)? checkedToggle,
    TResult? Function(int id)? increaseQty,
    TResult? Function(int id)? decreaseQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? getAll,
    TResult Function()? clearChecked,
    TResult Function(int index, bool value)? checkedToggle,
    TResult Function(int id)? increaseQty,
    TResult Function(int id)? decreaseQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAll value) getAll,
    required TResult Function(_ClearChecked value) clearChecked,
    required TResult Function(_CheckedToggle value) checkedToggle,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAll value)? getAll,
    TResult? Function(_ClearChecked value)? clearChecked,
    TResult? Function(_CheckedToggle value)? checkedToggle,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAll value)? getAll,
    TResult Function(_ClearChecked value)? clearChecked,
    TResult Function(_CheckedToggle value)? checkedToggle,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetClinicServicesEventCopyWith<$Res> {
  factory $GetClinicServicesEventCopyWith(GetClinicServicesEvent value,
          $Res Function(GetClinicServicesEvent) then) =
      _$GetClinicServicesEventCopyWithImpl<$Res, GetClinicServicesEvent>;
}

/// @nodoc
class _$GetClinicServicesEventCopyWithImpl<$Res,
        $Val extends GetClinicServicesEvent>
    implements $GetClinicServicesEventCopyWith<$Res> {
  _$GetClinicServicesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllImplCopyWith<$Res> {
  factory _$$GetAllImplCopyWith(
          _$GetAllImpl value, $Res Function(_$GetAllImpl) then) =
      __$$GetAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$GetAllImplCopyWithImpl<$Res>
    extends _$GetClinicServicesEventCopyWithImpl<$Res, _$GetAllImpl>
    implements _$$GetAllImplCopyWith<$Res> {
  __$$GetAllImplCopyWithImpl(
      _$GetAllImpl _value, $Res Function(_$GetAllImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$GetAllImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetAllImpl implements _GetAll {
  const _$GetAllImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'GetClinicServicesEvent.getAll(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllImplCopyWith<_$GetAllImpl> get copyWith =>
      __$$GetAllImplCopyWithImpl<_$GetAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) getAll,
    required TResult Function() clearChecked,
    required TResult Function(int index, bool value) checkedToggle,
    required TResult Function(int id) increaseQty,
    required TResult Function(int id) decreaseQty,
  }) {
    return getAll(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? getAll,
    TResult? Function()? clearChecked,
    TResult? Function(int index, bool value)? checkedToggle,
    TResult? Function(int id)? increaseQty,
    TResult? Function(int id)? decreaseQty,
  }) {
    return getAll?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? getAll,
    TResult Function()? clearChecked,
    TResult Function(int index, bool value)? checkedToggle,
    TResult Function(int id)? increaseQty,
    TResult Function(int id)? decreaseQty,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAll value) getAll,
    required TResult Function(_ClearChecked value) clearChecked,
    required TResult Function(_CheckedToggle value) checkedToggle,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAll value)? getAll,
    TResult? Function(_ClearChecked value)? clearChecked,
    TResult? Function(_CheckedToggle value)? checkedToggle,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAll value)? getAll,
    TResult Function(_ClearChecked value)? clearChecked,
    TResult Function(_CheckedToggle value)? checkedToggle,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class _GetAll implements GetClinicServicesEvent {
  const factory _GetAll({required final String name}) = _$GetAllImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$GetAllImplCopyWith<_$GetAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearCheckedImplCopyWith<$Res> {
  factory _$$ClearCheckedImplCopyWith(
          _$ClearCheckedImpl value, $Res Function(_$ClearCheckedImpl) then) =
      __$$ClearCheckedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearCheckedImplCopyWithImpl<$Res>
    extends _$GetClinicServicesEventCopyWithImpl<$Res, _$ClearCheckedImpl>
    implements _$$ClearCheckedImplCopyWith<$Res> {
  __$$ClearCheckedImplCopyWithImpl(
      _$ClearCheckedImpl _value, $Res Function(_$ClearCheckedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearCheckedImpl implements _ClearChecked {
  const _$ClearCheckedImpl();

  @override
  String toString() {
    return 'GetClinicServicesEvent.clearChecked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearCheckedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) getAll,
    required TResult Function() clearChecked,
    required TResult Function(int index, bool value) checkedToggle,
    required TResult Function(int id) increaseQty,
    required TResult Function(int id) decreaseQty,
  }) {
    return clearChecked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? getAll,
    TResult? Function()? clearChecked,
    TResult? Function(int index, bool value)? checkedToggle,
    TResult? Function(int id)? increaseQty,
    TResult? Function(int id)? decreaseQty,
  }) {
    return clearChecked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? getAll,
    TResult Function()? clearChecked,
    TResult Function(int index, bool value)? checkedToggle,
    TResult Function(int id)? increaseQty,
    TResult Function(int id)? decreaseQty,
    required TResult orElse(),
  }) {
    if (clearChecked != null) {
      return clearChecked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAll value) getAll,
    required TResult Function(_ClearChecked value) clearChecked,
    required TResult Function(_CheckedToggle value) checkedToggle,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) {
    return clearChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAll value)? getAll,
    TResult? Function(_ClearChecked value)? clearChecked,
    TResult? Function(_CheckedToggle value)? checkedToggle,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) {
    return clearChecked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAll value)? getAll,
    TResult Function(_ClearChecked value)? clearChecked,
    TResult Function(_CheckedToggle value)? checkedToggle,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) {
    if (clearChecked != null) {
      return clearChecked(this);
    }
    return orElse();
  }
}

abstract class _ClearChecked implements GetClinicServicesEvent {
  const factory _ClearChecked() = _$ClearCheckedImpl;
}

/// @nodoc
abstract class _$$CheckedToggleImplCopyWith<$Res> {
  factory _$$CheckedToggleImplCopyWith(
          _$CheckedToggleImpl value, $Res Function(_$CheckedToggleImpl) then) =
      __$$CheckedToggleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, bool value});
}

/// @nodoc
class __$$CheckedToggleImplCopyWithImpl<$Res>
    extends _$GetClinicServicesEventCopyWithImpl<$Res, _$CheckedToggleImpl>
    implements _$$CheckedToggleImplCopyWith<$Res> {
  __$$CheckedToggleImplCopyWithImpl(
      _$CheckedToggleImpl _value, $Res Function(_$CheckedToggleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? value = null,
  }) {
    return _then(_$CheckedToggleImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckedToggleImpl implements _CheckedToggle {
  const _$CheckedToggleImpl({required this.index, required this.value});

  @override
  final int index;
  @override
  final bool value;

  @override
  String toString() {
    return 'GetClinicServicesEvent.checkedToggle(index: $index, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckedToggleImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckedToggleImplCopyWith<_$CheckedToggleImpl> get copyWith =>
      __$$CheckedToggleImplCopyWithImpl<_$CheckedToggleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) getAll,
    required TResult Function() clearChecked,
    required TResult Function(int index, bool value) checkedToggle,
    required TResult Function(int id) increaseQty,
    required TResult Function(int id) decreaseQty,
  }) {
    return checkedToggle(index, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? getAll,
    TResult? Function()? clearChecked,
    TResult? Function(int index, bool value)? checkedToggle,
    TResult? Function(int id)? increaseQty,
    TResult? Function(int id)? decreaseQty,
  }) {
    return checkedToggle?.call(index, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? getAll,
    TResult Function()? clearChecked,
    TResult Function(int index, bool value)? checkedToggle,
    TResult Function(int id)? increaseQty,
    TResult Function(int id)? decreaseQty,
    required TResult orElse(),
  }) {
    if (checkedToggle != null) {
      return checkedToggle(index, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAll value) getAll,
    required TResult Function(_ClearChecked value) clearChecked,
    required TResult Function(_CheckedToggle value) checkedToggle,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) {
    return checkedToggle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAll value)? getAll,
    TResult? Function(_ClearChecked value)? clearChecked,
    TResult? Function(_CheckedToggle value)? checkedToggle,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) {
    return checkedToggle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAll value)? getAll,
    TResult Function(_ClearChecked value)? clearChecked,
    TResult Function(_CheckedToggle value)? checkedToggle,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) {
    if (checkedToggle != null) {
      return checkedToggle(this);
    }
    return orElse();
  }
}

abstract class _CheckedToggle implements GetClinicServicesEvent {
  const factory _CheckedToggle(
      {required final int index,
      required final bool value}) = _$CheckedToggleImpl;

  int get index;
  bool get value;
  @JsonKey(ignore: true)
  _$$CheckedToggleImplCopyWith<_$CheckedToggleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncreaseQtyImplCopyWith<$Res> {
  factory _$$IncreaseQtyImplCopyWith(
          _$IncreaseQtyImpl value, $Res Function(_$IncreaseQtyImpl) then) =
      __$$IncreaseQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$IncreaseQtyImplCopyWithImpl<$Res>
    extends _$GetClinicServicesEventCopyWithImpl<$Res, _$IncreaseQtyImpl>
    implements _$$IncreaseQtyImplCopyWith<$Res> {
  __$$IncreaseQtyImplCopyWithImpl(
      _$IncreaseQtyImpl _value, $Res Function(_$IncreaseQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$IncreaseQtyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IncreaseQtyImpl implements _IncreaseQty {
  const _$IncreaseQtyImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'GetClinicServicesEvent.increaseQty(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncreaseQtyImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncreaseQtyImplCopyWith<_$IncreaseQtyImpl> get copyWith =>
      __$$IncreaseQtyImplCopyWithImpl<_$IncreaseQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) getAll,
    required TResult Function() clearChecked,
    required TResult Function(int index, bool value) checkedToggle,
    required TResult Function(int id) increaseQty,
    required TResult Function(int id) decreaseQty,
  }) {
    return increaseQty(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? getAll,
    TResult? Function()? clearChecked,
    TResult? Function(int index, bool value)? checkedToggle,
    TResult? Function(int id)? increaseQty,
    TResult? Function(int id)? decreaseQty,
  }) {
    return increaseQty?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? getAll,
    TResult Function()? clearChecked,
    TResult Function(int index, bool value)? checkedToggle,
    TResult Function(int id)? increaseQty,
    TResult Function(int id)? decreaseQty,
    required TResult orElse(),
  }) {
    if (increaseQty != null) {
      return increaseQty(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAll value) getAll,
    required TResult Function(_ClearChecked value) clearChecked,
    required TResult Function(_CheckedToggle value) checkedToggle,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) {
    return increaseQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAll value)? getAll,
    TResult? Function(_ClearChecked value)? clearChecked,
    TResult? Function(_CheckedToggle value)? checkedToggle,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) {
    return increaseQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAll value)? getAll,
    TResult Function(_ClearChecked value)? clearChecked,
    TResult Function(_CheckedToggle value)? checkedToggle,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) {
    if (increaseQty != null) {
      return increaseQty(this);
    }
    return orElse();
  }
}

abstract class _IncreaseQty implements GetClinicServicesEvent {
  const factory _IncreaseQty({required final int id}) = _$IncreaseQtyImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$IncreaseQtyImplCopyWith<_$IncreaseQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecreaseQtyImplCopyWith<$Res> {
  factory _$$DecreaseQtyImplCopyWith(
          _$DecreaseQtyImpl value, $Res Function(_$DecreaseQtyImpl) then) =
      __$$DecreaseQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DecreaseQtyImplCopyWithImpl<$Res>
    extends _$GetClinicServicesEventCopyWithImpl<$Res, _$DecreaseQtyImpl>
    implements _$$DecreaseQtyImplCopyWith<$Res> {
  __$$DecreaseQtyImplCopyWithImpl(
      _$DecreaseQtyImpl _value, $Res Function(_$DecreaseQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DecreaseQtyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DecreaseQtyImpl implements _DecreaseQty {
  const _$DecreaseQtyImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'GetClinicServicesEvent.decreaseQty(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecreaseQtyImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecreaseQtyImplCopyWith<_$DecreaseQtyImpl> get copyWith =>
      __$$DecreaseQtyImplCopyWithImpl<_$DecreaseQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) getAll,
    required TResult Function() clearChecked,
    required TResult Function(int index, bool value) checkedToggle,
    required TResult Function(int id) increaseQty,
    required TResult Function(int id) decreaseQty,
  }) {
    return decreaseQty(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? getAll,
    TResult? Function()? clearChecked,
    TResult? Function(int index, bool value)? checkedToggle,
    TResult? Function(int id)? increaseQty,
    TResult? Function(int id)? decreaseQty,
  }) {
    return decreaseQty?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? getAll,
    TResult Function()? clearChecked,
    TResult Function(int index, bool value)? checkedToggle,
    TResult Function(int id)? increaseQty,
    TResult Function(int id)? decreaseQty,
    required TResult orElse(),
  }) {
    if (decreaseQty != null) {
      return decreaseQty(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAll value) getAll,
    required TResult Function(_ClearChecked value) clearChecked,
    required TResult Function(_CheckedToggle value) checkedToggle,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) {
    return decreaseQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAll value)? getAll,
    TResult? Function(_ClearChecked value)? clearChecked,
    TResult? Function(_CheckedToggle value)? checkedToggle,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) {
    return decreaseQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAll value)? getAll,
    TResult Function(_ClearChecked value)? clearChecked,
    TResult Function(_CheckedToggle value)? checkedToggle,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) {
    if (decreaseQty != null) {
      return decreaseQty(this);
    }
    return orElse();
  }
}

abstract class _DecreaseQty implements GetClinicServicesEvent {
  const factory _DecreaseQty({required final int id}) = _$DecreaseQtyImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DecreaseQtyImplCopyWith<_$DecreaseQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetClinicServicesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ClinicService> clinicServices) loading,
    required TResult Function(List<ClinicService> clinicServices) success,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ClinicService> clinicServices)? loading,
    TResult? Function(List<ClinicService> clinicServices)? success,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ClinicService> clinicServices)? loading,
    TResult Function(List<ClinicService> clinicServices)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetClinicServicesStateCopyWith<$Res> {
  factory $GetClinicServicesStateCopyWith(GetClinicServicesState value,
          $Res Function(GetClinicServicesState) then) =
      _$GetClinicServicesStateCopyWithImpl<$Res, GetClinicServicesState>;
}

/// @nodoc
class _$GetClinicServicesStateCopyWithImpl<$Res,
        $Val extends GetClinicServicesState>
    implements $GetClinicServicesStateCopyWith<$Res> {
  _$GetClinicServicesStateCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetClinicServicesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GetClinicServicesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ClinicService> clinicServices) loading,
    required TResult Function(List<ClinicService> clinicServices) success,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ClinicService> clinicServices)? loading,
    TResult? Function(List<ClinicService> clinicServices)? success,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ClinicService> clinicServices)? loading,
    TResult Function(List<ClinicService> clinicServices)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GetClinicServicesState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ClinicService> clinicServices});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GetClinicServicesStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicServices = null,
  }) {
    return _then(_$LoadingImpl(
      clinicServices: null == clinicServices
          ? _value._clinicServices
          : clinicServices // ignore: cast_nullable_to_non_nullable
              as List<ClinicService>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({required final List<ClinicService> clinicServices})
      : _clinicServices = clinicServices;

  final List<ClinicService> _clinicServices;
  @override
  List<ClinicService> get clinicServices {
    if (_clinicServices is EqualUnmodifiableListView) return _clinicServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clinicServices);
  }

  @override
  String toString() {
    return 'GetClinicServicesState.loading(clinicServices: $clinicServices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._clinicServices, _clinicServices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_clinicServices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ClinicService> clinicServices) loading,
    required TResult Function(List<ClinicService> clinicServices) success,
    required TResult Function(String message) failed,
  }) {
    return loading(clinicServices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ClinicService> clinicServices)? loading,
    TResult? Function(List<ClinicService> clinicServices)? success,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call(clinicServices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ClinicService> clinicServices)? loading,
    TResult Function(List<ClinicService> clinicServices)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(clinicServices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GetClinicServicesState {
  const factory _Loading({required final List<ClinicService> clinicServices}) =
      _$LoadingImpl;

  List<ClinicService> get clinicServices;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ClinicService> clinicServices});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$GetClinicServicesStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicServices = null,
  }) {
    return _then(_$SuccessImpl(
      clinicServices: null == clinicServices
          ? _value._clinicServices
          : clinicServices // ignore: cast_nullable_to_non_nullable
              as List<ClinicService>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required final List<ClinicService> clinicServices})
      : _clinicServices = clinicServices;

  final List<ClinicService> _clinicServices;
  @override
  List<ClinicService> get clinicServices {
    if (_clinicServices is EqualUnmodifiableListView) return _clinicServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clinicServices);
  }

  @override
  String toString() {
    return 'GetClinicServicesState.success(clinicServices: $clinicServices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._clinicServices, _clinicServices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_clinicServices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ClinicService> clinicServices) loading,
    required TResult Function(List<ClinicService> clinicServices) success,
    required TResult Function(String message) failed,
  }) {
    return success(clinicServices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ClinicService> clinicServices)? loading,
    TResult? Function(List<ClinicService> clinicServices)? success,
    TResult? Function(String message)? failed,
  }) {
    return success?.call(clinicServices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ClinicService> clinicServices)? loading,
    TResult Function(List<ClinicService> clinicServices)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(clinicServices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements GetClinicServicesState {
  const factory _Success({required final List<ClinicService> clinicServices}) =
      _$SuccessImpl;

  List<ClinicService> get clinicServices;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$GetClinicServicesStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'GetClinicServicesState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ClinicService> clinicServices) loading,
    required TResult Function(List<ClinicService> clinicServices) success,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ClinicService> clinicServices)? loading,
    TResult? Function(List<ClinicService> clinicServices)? success,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ClinicService> clinicServices)? loading,
    TResult Function(List<ClinicService> clinicServices)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements GetClinicServicesState {
  const factory _Failed({required final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
