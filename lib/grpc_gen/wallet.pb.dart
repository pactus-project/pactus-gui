//
//  Generated code. Do not modify.
//  source: wallet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Request message for creating a new wallet.
class CreateWalletRequest extends $pb.GeneratedMessage {
  factory CreateWalletRequest({
    $core.String? walletName,
    $core.String? mnemonic,
    $core.String? language,
    $core.String? password,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    if (mnemonic != null) {
      $result.mnemonic = mnemonic;
    }
    if (language != null) {
      $result.language = language;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  CreateWalletRequest._() : super();
  factory CreateWalletRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateWalletRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateWalletRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..aOS(2, _omitFieldNames ? '' : 'mnemonic')
    ..aOS(3, _omitFieldNames ? '' : 'language')
    ..aOS(4, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateWalletRequest clone() => CreateWalletRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateWalletRequest copyWith(void Function(CreateWalletRequest) updates) => super.copyWith((message) => updates(message as CreateWalletRequest)) as CreateWalletRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateWalletRequest create() => CreateWalletRequest._();
  CreateWalletRequest createEmptyInstance() => create();
  static $pb.PbList<CreateWalletRequest> createRepeated() => $pb.PbList<CreateWalletRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateWalletRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateWalletRequest>(create);
  static CreateWalletRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mnemonic => $_getSZ(1);
  @$pb.TagNumber(2)
  set mnemonic($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMnemonic() => $_has(1);
  @$pb.TagNumber(2)
  void clearMnemonic() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get language => $_getSZ(2);
  @$pb.TagNumber(3)
  set language($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLanguage() => $_has(2);
  @$pb.TagNumber(3)
  void clearLanguage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(3);
  @$pb.TagNumber(4)
  set password($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassword() => clearField(4);
}

/// Response message containing the name of the created wallet.
class CreateWalletResponse extends $pb.GeneratedMessage {
  factory CreateWalletResponse({
    $core.String? walletName,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    return $result;
  }
  CreateWalletResponse._() : super();
  factory CreateWalletResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateWalletResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateWalletResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateWalletResponse clone() => CreateWalletResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateWalletResponse copyWith(void Function(CreateWalletResponse) updates) => super.copyWith((message) => updates(message as CreateWalletResponse)) as CreateWalletResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateWalletResponse create() => CreateWalletResponse._();
  CreateWalletResponse createEmptyInstance() => create();
  static $pb.PbList<CreateWalletResponse> createRepeated() => $pb.PbList<CreateWalletResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateWalletResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateWalletResponse>(create);
  static CreateWalletResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);
}

/// Request message for loading an existing wallet.
class LoadWalletRequest extends $pb.GeneratedMessage {
  factory LoadWalletRequest({
    $core.String? walletName,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    return $result;
  }
  LoadWalletRequest._() : super();
  factory LoadWalletRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadWalletRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadWalletRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadWalletRequest clone() => LoadWalletRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadWalletRequest copyWith(void Function(LoadWalletRequest) updates) => super.copyWith((message) => updates(message as LoadWalletRequest)) as LoadWalletRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadWalletRequest create() => LoadWalletRequest._();
  LoadWalletRequest createEmptyInstance() => create();
  static $pb.PbList<LoadWalletRequest> createRepeated() => $pb.PbList<LoadWalletRequest>();
  @$core.pragma('dart2js:noInline')
  static LoadWalletRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadWalletRequest>(create);
  static LoadWalletRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);
}

/// Response message containing the name of the loaded wallet.
class LoadWalletResponse extends $pb.GeneratedMessage {
  factory LoadWalletResponse({
    $core.String? walletName,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    return $result;
  }
  LoadWalletResponse._() : super();
  factory LoadWalletResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadWalletResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadWalletResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadWalletResponse clone() => LoadWalletResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadWalletResponse copyWith(void Function(LoadWalletResponse) updates) => super.copyWith((message) => updates(message as LoadWalletResponse)) as LoadWalletResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadWalletResponse create() => LoadWalletResponse._();
  LoadWalletResponse createEmptyInstance() => create();
  static $pb.PbList<LoadWalletResponse> createRepeated() => $pb.PbList<LoadWalletResponse>();
  @$core.pragma('dart2js:noInline')
  static LoadWalletResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadWalletResponse>(create);
  static LoadWalletResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);
}

/// Request message for unloading a currently loaded wallet.
class UnloadWalletRequest extends $pb.GeneratedMessage {
  factory UnloadWalletRequest({
    $core.String? walletName,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    return $result;
  }
  UnloadWalletRequest._() : super();
  factory UnloadWalletRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnloadWalletRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnloadWalletRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnloadWalletRequest clone() => UnloadWalletRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnloadWalletRequest copyWith(void Function(UnloadWalletRequest) updates) => super.copyWith((message) => updates(message as UnloadWalletRequest)) as UnloadWalletRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnloadWalletRequest create() => UnloadWalletRequest._();
  UnloadWalletRequest createEmptyInstance() => create();
  static $pb.PbList<UnloadWalletRequest> createRepeated() => $pb.PbList<UnloadWalletRequest>();
  @$core.pragma('dart2js:noInline')
  static UnloadWalletRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnloadWalletRequest>(create);
  static UnloadWalletRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);
}

/// Response message containing the name of the unloaded wallet.
class UnloadWalletResponse extends $pb.GeneratedMessage {
  factory UnloadWalletResponse({
    $core.String? walletName,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    return $result;
  }
  UnloadWalletResponse._() : super();
  factory UnloadWalletResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnloadWalletResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnloadWalletResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnloadWalletResponse clone() => UnloadWalletResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnloadWalletResponse copyWith(void Function(UnloadWalletResponse) updates) => super.copyWith((message) => updates(message as UnloadWalletResponse)) as UnloadWalletResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnloadWalletResponse create() => UnloadWalletResponse._();
  UnloadWalletResponse createEmptyInstance() => create();
  static $pb.PbList<UnloadWalletResponse> createRepeated() => $pb.PbList<UnloadWalletResponse>();
  @$core.pragma('dart2js:noInline')
  static UnloadWalletResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnloadWalletResponse>(create);
  static UnloadWalletResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);
}

/// Request message for locking a currently loaded wallet.
class LockWalletRequest extends $pb.GeneratedMessage {
  factory LockWalletRequest({
    $core.String? walletName,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    return $result;
  }
  LockWalletRequest._() : super();
  factory LockWalletRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LockWalletRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LockWalletRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LockWalletRequest clone() => LockWalletRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LockWalletRequest copyWith(void Function(LockWalletRequest) updates) => super.copyWith((message) => updates(message as LockWalletRequest)) as LockWalletRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LockWalletRequest create() => LockWalletRequest._();
  LockWalletRequest createEmptyInstance() => create();
  static $pb.PbList<LockWalletRequest> createRepeated() => $pb.PbList<LockWalletRequest>();
  @$core.pragma('dart2js:noInline')
  static LockWalletRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LockWalletRequest>(create);
  static LockWalletRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);
}

/// Response message containing the name of the locked wallet.
class LockWalletResponse extends $pb.GeneratedMessage {
  factory LockWalletResponse({
    $core.String? walletName,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    return $result;
  }
  LockWalletResponse._() : super();
  factory LockWalletResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LockWalletResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LockWalletResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LockWalletResponse clone() => LockWalletResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LockWalletResponse copyWith(void Function(LockWalletResponse) updates) => super.copyWith((message) => updates(message as LockWalletResponse)) as LockWalletResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LockWalletResponse create() => LockWalletResponse._();
  LockWalletResponse createEmptyInstance() => create();
  static $pb.PbList<LockWalletResponse> createRepeated() => $pb.PbList<LockWalletResponse>();
  @$core.pragma('dart2js:noInline')
  static LockWalletResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LockWalletResponse>(create);
  static LockWalletResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);
}

/// Request message for obtaining the validator address associated with a public key.
class GetValidatorAddressRequest extends $pb.GeneratedMessage {
  factory GetValidatorAddressRequest({
    $core.String? publicKey,
  }) {
    final $result = create();
    if (publicKey != null) {
      $result.publicKey = publicKey;
    }
    return $result;
  }
  GetValidatorAddressRequest._() : super();
  factory GetValidatorAddressRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetValidatorAddressRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetValidatorAddressRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'publicKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetValidatorAddressRequest clone() => GetValidatorAddressRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetValidatorAddressRequest copyWith(void Function(GetValidatorAddressRequest) updates) => super.copyWith((message) => updates(message as GetValidatorAddressRequest)) as GetValidatorAddressRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetValidatorAddressRequest create() => GetValidatorAddressRequest._();
  GetValidatorAddressRequest createEmptyInstance() => create();
  static $pb.PbList<GetValidatorAddressRequest> createRepeated() => $pb.PbList<GetValidatorAddressRequest>();
  @$core.pragma('dart2js:noInline')
  static GetValidatorAddressRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetValidatorAddressRequest>(create);
  static GetValidatorAddressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get publicKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set publicKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);
}

/// Response message containing the validator address corresponding to a public key.
class GetValidatorAddressResponse extends $pb.GeneratedMessage {
  factory GetValidatorAddressResponse({
    $core.String? address,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  GetValidatorAddressResponse._() : super();
  factory GetValidatorAddressResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetValidatorAddressResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetValidatorAddressResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetValidatorAddressResponse clone() => GetValidatorAddressResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetValidatorAddressResponse copyWith(void Function(GetValidatorAddressResponse) updates) => super.copyWith((message) => updates(message as GetValidatorAddressResponse)) as GetValidatorAddressResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetValidatorAddressResponse create() => GetValidatorAddressResponse._();
  GetValidatorAddressResponse createEmptyInstance() => create();
  static $pb.PbList<GetValidatorAddressResponse> createRepeated() => $pb.PbList<GetValidatorAddressResponse>();
  @$core.pragma('dart2js:noInline')
  static GetValidatorAddressResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetValidatorAddressResponse>(create);
  static GetValidatorAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

/// Request message for unlocking a wallet.
class UnlockWalletRequest extends $pb.GeneratedMessage {
  factory UnlockWalletRequest({
    $core.String? walletName,
    $core.String? password,
    $core.int? timeout,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    if (password != null) {
      $result.password = password;
    }
    if (timeout != null) {
      $result.timeout = timeout;
    }
    return $result;
  }
  UnlockWalletRequest._() : super();
  factory UnlockWalletRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnlockWalletRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnlockWalletRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'timeout', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnlockWalletRequest clone() => UnlockWalletRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnlockWalletRequest copyWith(void Function(UnlockWalletRequest) updates) => super.copyWith((message) => updates(message as UnlockWalletRequest)) as UnlockWalletRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnlockWalletRequest create() => UnlockWalletRequest._();
  UnlockWalletRequest createEmptyInstance() => create();
  static $pb.PbList<UnlockWalletRequest> createRepeated() => $pb.PbList<UnlockWalletRequest>();
  @$core.pragma('dart2js:noInline')
  static UnlockWalletRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnlockWalletRequest>(create);
  static UnlockWalletRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get timeout => $_getIZ(2);
  @$pb.TagNumber(3)
  set timeout($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimeout() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimeout() => clearField(3);
}

/// Response message containing the name of the unlocked wallet.
class UnlockWalletResponse extends $pb.GeneratedMessage {
  factory UnlockWalletResponse({
    $core.String? walletName,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    return $result;
  }
  UnlockWalletResponse._() : super();
  factory UnlockWalletResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnlockWalletResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnlockWalletResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnlockWalletResponse clone() => UnlockWalletResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnlockWalletResponse copyWith(void Function(UnlockWalletResponse) updates) => super.copyWith((message) => updates(message as UnlockWalletResponse)) as UnlockWalletResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnlockWalletResponse create() => UnlockWalletResponse._();
  UnlockWalletResponse createEmptyInstance() => create();
  static $pb.PbList<UnlockWalletResponse> createRepeated() => $pb.PbList<UnlockWalletResponse>();
  @$core.pragma('dart2js:noInline')
  static UnlockWalletResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnlockWalletResponse>(create);
  static UnlockWalletResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);
}

/// Request message for signing a raw transaction.
class SignRawTransactionRequest extends $pb.GeneratedMessage {
  factory SignRawTransactionRequest({
    $core.String? walletName,
    $core.List<$core.int>? rawTransaction,
    $core.String? password,
  }) {
    final $result = create();
    if (walletName != null) {
      $result.walletName = walletName;
    }
    if (rawTransaction != null) {
      $result.rawTransaction = rawTransaction;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  SignRawTransactionRequest._() : super();
  factory SignRawTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignRawTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignRawTransactionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'walletName')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'rawTransaction', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignRawTransactionRequest clone() => SignRawTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignRawTransactionRequest copyWith(void Function(SignRawTransactionRequest) updates) => super.copyWith((message) => updates(message as SignRawTransactionRequest)) as SignRawTransactionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignRawTransactionRequest create() => SignRawTransactionRequest._();
  SignRawTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<SignRawTransactionRequest> createRepeated() => $pb.PbList<SignRawTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static SignRawTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignRawTransactionRequest>(create);
  static SignRawTransactionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get walletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set walletName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get rawTransaction => $_getN(1);
  @$pb.TagNumber(2)
  set rawTransaction($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRawTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearRawTransaction() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

/// Response message containing the transaction ID and signed raw transaction.
class SignRawTransactionResponse extends $pb.GeneratedMessage {
  factory SignRawTransactionResponse({
    $core.List<$core.int>? transactionId,
    $core.List<$core.int>? signedRawTransaction,
  }) {
    final $result = create();
    if (transactionId != null) {
      $result.transactionId = transactionId;
    }
    if (signedRawTransaction != null) {
      $result.signedRawTransaction = signedRawTransaction;
    }
    return $result;
  }
  SignRawTransactionResponse._() : super();
  factory SignRawTransactionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignRawTransactionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignRawTransactionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'transactionId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'signedRawTransaction', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignRawTransactionResponse clone() => SignRawTransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignRawTransactionResponse copyWith(void Function(SignRawTransactionResponse) updates) => super.copyWith((message) => updates(message as SignRawTransactionResponse)) as SignRawTransactionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignRawTransactionResponse create() => SignRawTransactionResponse._();
  SignRawTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<SignRawTransactionResponse> createRepeated() => $pb.PbList<SignRawTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static SignRawTransactionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignRawTransactionResponse>(create);
  static SignRawTransactionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get transactionId => $_getN(0);
  @$pb.TagNumber(1)
  set transactionId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signedRawTransaction => $_getN(1);
  @$pb.TagNumber(2)
  set signedRawTransaction($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignedRawTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedRawTransaction() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
