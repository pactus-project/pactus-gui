// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_node_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetNodeInfoEvent {
  GetNodeInfoRequest get params => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetNodeInfoRequest params) fetch,
    required TResult Function(GetNodeInfoRequest params) fetchStream,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetNodeInfoRequest params)? fetch,
    TResult? Function(GetNodeInfoRequest params)? fetchStream,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetNodeInfoRequest params)? fetch,
    TResult Function(GetNodeInfoRequest params)? fetchStream,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGetNodeInfo value) fetch,
    required TResult Function(FetchGetNodeInfoStream value) fetchStream,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGetNodeInfo value)? fetch,
    TResult? Function(FetchGetNodeInfoStream value)? fetchStream,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGetNodeInfo value)? fetch,
    TResult Function(FetchGetNodeInfoStream value)? fetchStream,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of GetNodeInfoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetNodeInfoEventCopyWith<GetNodeInfoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNodeInfoEventCopyWith<$Res> {
  factory $GetNodeInfoEventCopyWith(
    GetNodeInfoEvent value,
    $Res Function(GetNodeInfoEvent) then,
  ) = _$GetNodeInfoEventCopyWithImpl<$Res, GetNodeInfoEvent>;
  @useResult
  $Res call({GetNodeInfoRequest params});
}

/// @nodoc
class _$GetNodeInfoEventCopyWithImpl<$Res, $Val extends GetNodeInfoEvent>
    implements $GetNodeInfoEventCopyWith<$Res> {
  _$GetNodeInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetNodeInfoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? params = null}) {
    return _then(
      _value.copyWith(
            params: null == params
                ? _value.params
                : params // ignore: cast_nullable_to_non_nullable
                      as GetNodeInfoRequest,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FetchGetNodeInfoImplCopyWith<$Res>
    implements $GetNodeInfoEventCopyWith<$Res> {
  factory _$$FetchGetNodeInfoImplCopyWith(
    _$FetchGetNodeInfoImpl value,
    $Res Function(_$FetchGetNodeInfoImpl) then,
  ) = __$$FetchGetNodeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetNodeInfoRequest params});
}

/// @nodoc
class __$$FetchGetNodeInfoImplCopyWithImpl<$Res>
    extends _$GetNodeInfoEventCopyWithImpl<$Res, _$FetchGetNodeInfoImpl>
    implements _$$FetchGetNodeInfoImplCopyWith<$Res> {
  __$$FetchGetNodeInfoImplCopyWithImpl(
    _$FetchGetNodeInfoImpl _value,
    $Res Function(_$FetchGetNodeInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNodeInfoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? params = null}) {
    return _then(
      _$FetchGetNodeInfoImpl(
        params: null == params
            ? _value.params
            : params // ignore: cast_nullable_to_non_nullable
                  as GetNodeInfoRequest,
      ),
    );
  }
}

/// @nodoc

class _$FetchGetNodeInfoImpl implements FetchGetNodeInfo {
  const _$FetchGetNodeInfoImpl({required this.params});

  @override
  final GetNodeInfoRequest params;

  @override
  String toString() {
    return 'GetNodeInfoEvent.fetch(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchGetNodeInfoImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  /// Create a copy of GetNodeInfoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchGetNodeInfoImplCopyWith<_$FetchGetNodeInfoImpl> get copyWith =>
      __$$FetchGetNodeInfoImplCopyWithImpl<_$FetchGetNodeInfoImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetNodeInfoRequest params) fetch,
    required TResult Function(GetNodeInfoRequest params) fetchStream,
  }) {
    return fetch(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetNodeInfoRequest params)? fetch,
    TResult? Function(GetNodeInfoRequest params)? fetchStream,
  }) {
    return fetch?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetNodeInfoRequest params)? fetch,
    TResult Function(GetNodeInfoRequest params)? fetchStream,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGetNodeInfo value) fetch,
    required TResult Function(FetchGetNodeInfoStream value) fetchStream,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGetNodeInfo value)? fetch,
    TResult? Function(FetchGetNodeInfoStream value)? fetchStream,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGetNodeInfo value)? fetch,
    TResult Function(FetchGetNodeInfoStream value)? fetchStream,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchGetNodeInfo implements GetNodeInfoEvent {
  const factory FetchGetNodeInfo({required final GetNodeInfoRequest params}) =
      _$FetchGetNodeInfoImpl;

  @override
  GetNodeInfoRequest get params;

  /// Create a copy of GetNodeInfoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchGetNodeInfoImplCopyWith<_$FetchGetNodeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchGetNodeInfoStreamImplCopyWith<$Res>
    implements $GetNodeInfoEventCopyWith<$Res> {
  factory _$$FetchGetNodeInfoStreamImplCopyWith(
    _$FetchGetNodeInfoStreamImpl value,
    $Res Function(_$FetchGetNodeInfoStreamImpl) then,
  ) = __$$FetchGetNodeInfoStreamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetNodeInfoRequest params});
}

/// @nodoc
class __$$FetchGetNodeInfoStreamImplCopyWithImpl<$Res>
    extends _$GetNodeInfoEventCopyWithImpl<$Res, _$FetchGetNodeInfoStreamImpl>
    implements _$$FetchGetNodeInfoStreamImplCopyWith<$Res> {
  __$$FetchGetNodeInfoStreamImplCopyWithImpl(
    _$FetchGetNodeInfoStreamImpl _value,
    $Res Function(_$FetchGetNodeInfoStreamImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNodeInfoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? params = null}) {
    return _then(
      _$FetchGetNodeInfoStreamImpl(
        params: null == params
            ? _value.params
            : params // ignore: cast_nullable_to_non_nullable
                  as GetNodeInfoRequest,
      ),
    );
  }
}

/// @nodoc

class _$FetchGetNodeInfoStreamImpl implements FetchGetNodeInfoStream {
  const _$FetchGetNodeInfoStreamImpl({required this.params});

  @override
  final GetNodeInfoRequest params;

  @override
  String toString() {
    return 'GetNodeInfoEvent.fetchStream(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchGetNodeInfoStreamImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  /// Create a copy of GetNodeInfoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchGetNodeInfoStreamImplCopyWith<_$FetchGetNodeInfoStreamImpl>
  get copyWith =>
      __$$FetchGetNodeInfoStreamImplCopyWithImpl<_$FetchGetNodeInfoStreamImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetNodeInfoRequest params) fetch,
    required TResult Function(GetNodeInfoRequest params) fetchStream,
  }) {
    return fetchStream(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetNodeInfoRequest params)? fetch,
    TResult? Function(GetNodeInfoRequest params)? fetchStream,
  }) {
    return fetchStream?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetNodeInfoRequest params)? fetch,
    TResult Function(GetNodeInfoRequest params)? fetchStream,
    required TResult orElse(),
  }) {
    if (fetchStream != null) {
      return fetchStream(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGetNodeInfo value) fetch,
    required TResult Function(FetchGetNodeInfoStream value) fetchStream,
  }) {
    return fetchStream(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGetNodeInfo value)? fetch,
    TResult? Function(FetchGetNodeInfoStream value)? fetchStream,
  }) {
    return fetchStream?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGetNodeInfo value)? fetch,
    TResult Function(FetchGetNodeInfoStream value)? fetchStream,
    required TResult orElse(),
  }) {
    if (fetchStream != null) {
      return fetchStream(this);
    }
    return orElse();
  }
}

abstract class FetchGetNodeInfoStream implements GetNodeInfoEvent {
  const factory FetchGetNodeInfoStream({
    required final GetNodeInfoRequest params,
  }) = _$FetchGetNodeInfoStreamImpl;

  @override
  GetNodeInfoRequest get params;

  /// Create a copy of GetNodeInfoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchGetNodeInfoStreamImplCopyWith<_$FetchGetNodeInfoStreamImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetNodeInfoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetNodeInfoEntity data) loaded,
    required TResult Function(String error) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetNodeInfoEntity data)? loaded,
    TResult? Function(String error)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetNodeInfoEntity data)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNodeInfoStateCopyWith<$Res> {
  factory $GetNodeInfoStateCopyWith(
    GetNodeInfoState value,
    $Res Function(GetNodeInfoState) then,
  ) = _$GetNodeInfoStateCopyWithImpl<$Res, GetNodeInfoState>;
}

/// @nodoc
class _$GetNodeInfoStateCopyWithImpl<$Res, $Val extends GetNodeInfoState>
    implements $GetNodeInfoStateCopyWith<$Res> {
  _$GetNodeInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetNodeInfoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetNodeInfoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNodeInfoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GetNodeInfoState.initial()';
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
    required TResult Function() loading,
    required TResult Function(GetNodeInfoEntity data) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetNodeInfoEntity data)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetNodeInfoEntity data)? loaded,
    TResult Function(String error)? error,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GetNodeInfoState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GetNodeInfoStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNodeInfoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GetNodeInfoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetNodeInfoEntity data) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetNodeInfoEntity data)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetNodeInfoEntity data)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GetNodeInfoState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetNodeInfoEntity data});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$GetNodeInfoStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNodeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$LoadedImpl(
        null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as GetNodeInfoEntity,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.data);

  @override
  final GetNodeInfoEntity data;

  @override
  String toString() {
    return 'GetNodeInfoState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of GetNodeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetNodeInfoEntity data) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetNodeInfoEntity data)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetNodeInfoEntity data)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements GetNodeInfoState {
  const factory _Loaded(final GetNodeInfoEntity data) = _$LoadedImpl;

  GetNodeInfoEntity get data;

  /// Create a copy of GetNodeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$GetNodeInfoStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNodeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$ErrorImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GetNodeInfoState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GetNodeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetNodeInfoEntity data) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetNodeInfoEntity data)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetNodeInfoEntity data)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GetNodeInfoState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of GetNodeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
