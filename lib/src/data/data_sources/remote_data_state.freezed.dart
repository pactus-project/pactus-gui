// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RemoteDataState<T> {
  T? get remoteData => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? remoteData, String? error) success,
    required TResult Function(T? remoteData, String? error) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? remoteData, String? error)? success,
    TResult? Function(T? remoteData, String? error)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? remoteData, String? error)? success,
    TResult Function(T? remoteData, String? error)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteDataSuccess<T> value) success,
    required TResult Function(RemoteDataFailed<T> value) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteDataSuccess<T> value)? success,
    TResult? Function(RemoteDataFailed<T> value)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteDataSuccess<T> value)? success,
    TResult Function(RemoteDataFailed<T> value)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of RemoteDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteDataStateCopyWith<T, RemoteDataState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteDataStateCopyWith<T, $Res> {
  factory $RemoteDataStateCopyWith(
    RemoteDataState<T> value,
    $Res Function(RemoteDataState<T>) then,
  ) = _$RemoteDataStateCopyWithImpl<T, $Res, RemoteDataState<T>>;
  @useResult
  $Res call({T? remoteData, String? error});
}

/// @nodoc
class _$RemoteDataStateCopyWithImpl<T, $Res, $Val extends RemoteDataState<T>>
    implements $RemoteDataStateCopyWith<T, $Res> {
  _$RemoteDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? remoteData = freezed, Object? error = freezed}) {
    return _then(
      _value.copyWith(
            remoteData: freezed == remoteData
                ? _value.remoteData
                : remoteData // ignore: cast_nullable_to_non_nullable
                      as T?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RemoteDataSuccessImplCopyWith<T, $Res>
    implements $RemoteDataStateCopyWith<T, $Res> {
  factory _$$RemoteDataSuccessImplCopyWith(
    _$RemoteDataSuccessImpl<T> value,
    $Res Function(_$RemoteDataSuccessImpl<T>) then,
  ) = __$$RemoteDataSuccessImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? remoteData, String? error});
}

/// @nodoc
class __$$RemoteDataSuccessImplCopyWithImpl<T, $Res>
    extends _$RemoteDataStateCopyWithImpl<T, $Res, _$RemoteDataSuccessImpl<T>>
    implements _$$RemoteDataSuccessImplCopyWith<T, $Res> {
  __$$RemoteDataSuccessImplCopyWithImpl(
    _$RemoteDataSuccessImpl<T> _value,
    $Res Function(_$RemoteDataSuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of RemoteDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? remoteData = freezed, Object? error = freezed}) {
    return _then(
      _$RemoteDataSuccessImpl<T>(
        remoteData: freezed == remoteData
            ? _value.remoteData
            : remoteData // ignore: cast_nullable_to_non_nullable
                  as T?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$RemoteDataSuccessImpl<T> implements RemoteDataSuccess<T> {
  _$RemoteDataSuccessImpl({this.remoteData, this.error});

  @override
  final T? remoteData;
  @override
  final String? error;

  @override
  String toString() {
    return 'RemoteDataState<$T>.success(remoteData: $remoteData, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteDataSuccessImpl<T> &&
            const DeepCollectionEquality().equals(
              other.remoteData,
              remoteData,
            ) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(remoteData),
    error,
  );

  /// Create a copy of RemoteDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteDataSuccessImplCopyWith<T, _$RemoteDataSuccessImpl<T>>
  get copyWith =>
      __$$RemoteDataSuccessImplCopyWithImpl<T, _$RemoteDataSuccessImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? remoteData, String? error) success,
    required TResult Function(T? remoteData, String? error) failed,
  }) {
    return success(remoteData, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? remoteData, String? error)? success,
    TResult? Function(T? remoteData, String? error)? failed,
  }) {
    return success?.call(remoteData, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? remoteData, String? error)? success,
    TResult Function(T? remoteData, String? error)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(remoteData, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteDataSuccess<T> value) success,
    required TResult Function(RemoteDataFailed<T> value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteDataSuccess<T> value)? success,
    TResult? Function(RemoteDataFailed<T> value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteDataSuccess<T> value)? success,
    TResult Function(RemoteDataFailed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RemoteDataSuccess<T> implements RemoteDataState<T> {
  factory RemoteDataSuccess({final T? remoteData, final String? error}) =
      _$RemoteDataSuccessImpl<T>;

  @override
  T? get remoteData;
  @override
  String? get error;

  /// Create a copy of RemoteDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteDataSuccessImplCopyWith<T, _$RemoteDataSuccessImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoteDataFailedImplCopyWith<T, $Res>
    implements $RemoteDataStateCopyWith<T, $Res> {
  factory _$$RemoteDataFailedImplCopyWith(
    _$RemoteDataFailedImpl<T> value,
    $Res Function(_$RemoteDataFailedImpl<T>) then,
  ) = __$$RemoteDataFailedImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? remoteData, String? error});
}

/// @nodoc
class __$$RemoteDataFailedImplCopyWithImpl<T, $Res>
    extends _$RemoteDataStateCopyWithImpl<T, $Res, _$RemoteDataFailedImpl<T>>
    implements _$$RemoteDataFailedImplCopyWith<T, $Res> {
  __$$RemoteDataFailedImplCopyWithImpl(
    _$RemoteDataFailedImpl<T> _value,
    $Res Function(_$RemoteDataFailedImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of RemoteDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? remoteData = freezed, Object? error = freezed}) {
    return _then(
      _$RemoteDataFailedImpl<T>(
        remoteData: freezed == remoteData
            ? _value.remoteData
            : remoteData // ignore: cast_nullable_to_non_nullable
                  as T?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$RemoteDataFailedImpl<T> implements RemoteDataFailed<T> {
  _$RemoteDataFailedImpl({this.remoteData, this.error});

  @override
  final T? remoteData;
  @override
  final String? error;

  @override
  String toString() {
    return 'RemoteDataState<$T>.failed(remoteData: $remoteData, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteDataFailedImpl<T> &&
            const DeepCollectionEquality().equals(
              other.remoteData,
              remoteData,
            ) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(remoteData),
    error,
  );

  /// Create a copy of RemoteDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteDataFailedImplCopyWith<T, _$RemoteDataFailedImpl<T>> get copyWith =>
      __$$RemoteDataFailedImplCopyWithImpl<T, _$RemoteDataFailedImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? remoteData, String? error) success,
    required TResult Function(T? remoteData, String? error) failed,
  }) {
    return failed(remoteData, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? remoteData, String? error)? success,
    TResult? Function(T? remoteData, String? error)? failed,
  }) {
    return failed?.call(remoteData, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? remoteData, String? error)? success,
    TResult Function(T? remoteData, String? error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(remoteData, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteDataSuccess<T> value) success,
    required TResult Function(RemoteDataFailed<T> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteDataSuccess<T> value)? success,
    TResult? Function(RemoteDataFailed<T> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteDataSuccess<T> value)? success,
    TResult Function(RemoteDataFailed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class RemoteDataFailed<T> implements RemoteDataState<T> {
  factory RemoteDataFailed({final T? remoteData, final String? error}) =
      _$RemoteDataFailedImpl<T>;

  @override
  T? get remoteData;
  @override
  String? get error;

  /// Create a copy of RemoteDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteDataFailedImplCopyWith<T, _$RemoteDataFailedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
