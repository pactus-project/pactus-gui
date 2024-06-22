//
//  Generated code. Do not modify.
//  source: transaction.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'transaction.pbenum.dart';

export 'transaction.pbenum.dart';

/// Request message for retrieving transaction details.
class GetTransactionRequest extends $pb.GeneratedMessage {
  factory GetTransactionRequest({
    $core.List<$core.int>? id,
    TransactionVerbosity? verbosity,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (verbosity != null) {
      $result.verbosity = verbosity;
    }
    return $result;
  }
  GetTransactionRequest._() : super();
  factory GetTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTransactionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..e<TransactionVerbosity>(2, _omitFieldNames ? '' : 'verbosity', $pb.PbFieldType.OE, defaultOrMaker: TransactionVerbosity.TRANSACTION_DATA, valueOf: TransactionVerbosity.valueOf, enumValues: TransactionVerbosity.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTransactionRequest clone() => GetTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTransactionRequest copyWith(void Function(GetTransactionRequest) updates) => super.copyWith((message) => updates(message as GetTransactionRequest)) as GetTransactionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransactionRequest create() => GetTransactionRequest._();
  GetTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<GetTransactionRequest> createRepeated() => $pb.PbList<GetTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionRequest>(create);
  static GetTransactionRequest? _defaultInstance;

  /// Transaction ID.
  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// Verbosity level for transaction details.
  @$pb.TagNumber(2)
  TransactionVerbosity get verbosity => $_getN(1);
  @$pb.TagNumber(2)
  set verbosity(TransactionVerbosity v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVerbosity() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerbosity() => clearField(2);
}

/// Response message containing details of a transaction.
class GetTransactionResponse extends $pb.GeneratedMessage {
  factory GetTransactionResponse({
    $core.int? blockHeight,
    $core.int? blockTime,
    TransactionInfo? transaction,
  }) {
    final $result = create();
    if (blockHeight != null) {
      $result.blockHeight = blockHeight;
    }
    if (blockTime != null) {
      $result.blockTime = blockTime;
    }
    if (transaction != null) {
      $result.transaction = transaction;
    }
    return $result;
  }
  GetTransactionResponse._() : super();
  factory GetTransactionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTransactionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'blockHeight', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'blockTime', $pb.PbFieldType.OU3)
    ..aOM<TransactionInfo>(3, _omitFieldNames ? '' : 'transaction', subBuilder: TransactionInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTransactionResponse clone() => GetTransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTransactionResponse copyWith(void Function(GetTransactionResponse) updates) => super.copyWith((message) => updates(message as GetTransactionResponse)) as GetTransactionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransactionResponse create() => GetTransactionResponse._();
  GetTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<GetTransactionResponse> createRepeated() => $pb.PbList<GetTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionResponse>(create);
  static GetTransactionResponse? _defaultInstance;

  /// Height of the block containing the transaction.
  @$pb.TagNumber(1)
  $core.int get blockHeight => $_getIZ(0);
  @$pb.TagNumber(1)
  set blockHeight($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockHeight() => clearField(1);

  /// Time of the block containing the transaction.
  @$pb.TagNumber(2)
  $core.int get blockTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set blockTime($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockTime() => clearField(2);

  /// Information about the transaction.
  @$pb.TagNumber(3)
  TransactionInfo get transaction => $_getN(2);
  @$pb.TagNumber(3)
  set transaction(TransactionInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransaction() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransaction() => clearField(3);
  @$pb.TagNumber(3)
  TransactionInfo ensureTransaction() => $_ensure(2);
}

/// Request message for calculating transaction fee.
class CalculateFeeRequest extends $pb.GeneratedMessage {
  factory CalculateFeeRequest({
    $fixnum.Int64? amount,
    PayloadType? payloadType,
    $core.bool? fixedAmount,
  }) {
    final $result = create();
    if (amount != null) {
      $result.amount = amount;
    }
    if (payloadType != null) {
      $result.payloadType = payloadType;
    }
    if (fixedAmount != null) {
      $result.fixedAmount = fixedAmount;
    }
    return $result;
  }
  CalculateFeeRequest._() : super();
  factory CalculateFeeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalculateFeeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalculateFeeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..e<PayloadType>(2, _omitFieldNames ? '' : 'payloadType', $pb.PbFieldType.OE, defaultOrMaker: PayloadType.UNKNOWN, valueOf: PayloadType.valueOf, enumValues: PayloadType.values)
    ..aOB(3, _omitFieldNames ? '' : 'fixedAmount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalculateFeeRequest clone() => CalculateFeeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalculateFeeRequest copyWith(void Function(CalculateFeeRequest) updates) => super.copyWith((message) => updates(message as CalculateFeeRequest)) as CalculateFeeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalculateFeeRequest create() => CalculateFeeRequest._();
  CalculateFeeRequest createEmptyInstance() => create();
  static $pb.PbList<CalculateFeeRequest> createRepeated() => $pb.PbList<CalculateFeeRequest>();
  @$core.pragma('dart2js:noInline')
  static CalculateFeeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalculateFeeRequest>(create);
  static CalculateFeeRequest? _defaultInstance;

  /// Transaction amount in NanoPAC.
  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  /// Type of transaction payload.
  @$pb.TagNumber(2)
  PayloadType get payloadType => $_getN(1);
  @$pb.TagNumber(2)
  set payloadType(PayloadType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPayloadType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayloadType() => clearField(2);

  /// Indicates that amount should be fixed and includes the fee.
  @$pb.TagNumber(3)
  $core.bool get fixedAmount => $_getBF(2);
  @$pb.TagNumber(3)
  set fixedAmount($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFixedAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearFixedAmount() => clearField(3);
}

/// Response message containing the calculated transaction fee.
class CalculateFeeResponse extends $pb.GeneratedMessage {
  factory CalculateFeeResponse({
    $fixnum.Int64? amount,
    $fixnum.Int64? fee,
  }) {
    final $result = create();
    if (amount != null) {
      $result.amount = amount;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    return $result;
  }
  CalculateFeeResponse._() : super();
  factory CalculateFeeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalculateFeeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalculateFeeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..aInt64(2, _omitFieldNames ? '' : 'fee')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalculateFeeResponse clone() => CalculateFeeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalculateFeeResponse copyWith(void Function(CalculateFeeResponse) updates) => super.copyWith((message) => updates(message as CalculateFeeResponse)) as CalculateFeeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalculateFeeResponse create() => CalculateFeeResponse._();
  CalculateFeeResponse createEmptyInstance() => create();
  static $pb.PbList<CalculateFeeResponse> createRepeated() => $pb.PbList<CalculateFeeResponse>();
  @$core.pragma('dart2js:noInline')
  static CalculateFeeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalculateFeeResponse>(create);
  static CalculateFeeResponse? _defaultInstance;

  /// Calculated amount in NanoPAC.
  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  /// Calculated transaction fee in NanoPAC.
  @$pb.TagNumber(2)
  $fixnum.Int64 get fee => $_getI64(1);
  @$pb.TagNumber(2)
  set fee($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearFee() => clearField(2);
}

/// Request message for broadcasting a signed transaction.
class BroadcastTransactionRequest extends $pb.GeneratedMessage {
  factory BroadcastTransactionRequest({
    $core.List<$core.int>? signedRawTransaction,
  }) {
    final $result = create();
    if (signedRawTransaction != null) {
      $result.signedRawTransaction = signedRawTransaction;
    }
    return $result;
  }
  BroadcastTransactionRequest._() : super();
  factory BroadcastTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BroadcastTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BroadcastTransactionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'signedRawTransaction', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BroadcastTransactionRequest clone() => BroadcastTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BroadcastTransactionRequest copyWith(void Function(BroadcastTransactionRequest) updates) => super.copyWith((message) => updates(message as BroadcastTransactionRequest)) as BroadcastTransactionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRequest create() => BroadcastTransactionRequest._();
  BroadcastTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<BroadcastTransactionRequest> createRepeated() => $pb.PbList<BroadcastTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionRequest>(create);
  static BroadcastTransactionRequest? _defaultInstance;

  /// Signed raw transaction data.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signedRawTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set signedRawTransaction($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignedRawTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedRawTransaction() => clearField(1);
}

/// Response message containing the ID of the broadcasted transaction.
class BroadcastTransactionResponse extends $pb.GeneratedMessage {
  factory BroadcastTransactionResponse({
    $core.List<$core.int>? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  BroadcastTransactionResponse._() : super();
  factory BroadcastTransactionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BroadcastTransactionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BroadcastTransactionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BroadcastTransactionResponse clone() => BroadcastTransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BroadcastTransactionResponse copyWith(void Function(BroadcastTransactionResponse) updates) => super.copyWith((message) => updates(message as BroadcastTransactionResponse)) as BroadcastTransactionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionResponse create() => BroadcastTransactionResponse._();
  BroadcastTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<BroadcastTransactionResponse> createRepeated() => $pb.PbList<BroadcastTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionResponse>(create);
  static BroadcastTransactionResponse? _defaultInstance;

  /// Transaction ID.
  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

/// Request message for retrieving raw details of a transfer transaction.
class GetRawTransferTransactionRequest extends $pb.GeneratedMessage {
  factory GetRawTransferTransactionRequest({
    $core.int? lockTime,
    $core.String? sender,
    $core.String? receiver,
    $fixnum.Int64? amount,
    $fixnum.Int64? fee,
    $core.String? memo,
  }) {
    final $result = create();
    if (lockTime != null) {
      $result.lockTime = lockTime;
    }
    if (sender != null) {
      $result.sender = sender;
    }
    if (receiver != null) {
      $result.receiver = receiver;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (memo != null) {
      $result.memo = memo;
    }
    return $result;
  }
  GetRawTransferTransactionRequest._() : super();
  factory GetRawTransferTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRawTransferTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRawTransferTransactionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lockTime', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'sender')
    ..aOS(3, _omitFieldNames ? '' : 'receiver')
    ..aInt64(4, _omitFieldNames ? '' : 'amount')
    ..aInt64(5, _omitFieldNames ? '' : 'fee')
    ..aOS(6, _omitFieldNames ? '' : 'memo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRawTransferTransactionRequest clone() => GetRawTransferTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRawTransferTransactionRequest copyWith(void Function(GetRawTransferTransactionRequest) updates) => super.copyWith((message) => updates(message as GetRawTransferTransactionRequest)) as GetRawTransferTransactionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRawTransferTransactionRequest create() => GetRawTransferTransactionRequest._();
  GetRawTransferTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<GetRawTransferTransactionRequest> createRepeated() => $pb.PbList<GetRawTransferTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRawTransferTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRawTransferTransactionRequest>(create);
  static GetRawTransferTransactionRequest? _defaultInstance;

  /// Lock time for the transaction.
  /// If not explicitly set, it sets to the last block height.
  @$pb.TagNumber(1)
  $core.int get lockTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set lockTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLockTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearLockTime() => clearField(1);

  /// Sender's account address.
  @$pb.TagNumber(2)
  $core.String get sender => $_getSZ(1);
  @$pb.TagNumber(2)
  set sender($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSender() => $_has(1);
  @$pb.TagNumber(2)
  void clearSender() => clearField(2);

  /// Receiver's account address.
  @$pb.TagNumber(3)
  $core.String get receiver => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiver($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReceiver() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiver() => clearField(3);

  /// Transfer amount in NanoPAC.
  /// It should be greater than 0.
  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  /// Transaction fee in NanoPAC.
  /// If not explicitly set, it is calculated based on the amount.
  @$pb.TagNumber(5)
  $fixnum.Int64 get fee => $_getI64(4);
  @$pb.TagNumber(5)
  set fee($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFee() => $_has(4);
  @$pb.TagNumber(5)
  void clearFee() => clearField(5);

  /// Transaction memo.
  @$pb.TagNumber(6)
  $core.String get memo => $_getSZ(5);
  @$pb.TagNumber(6)
  set memo($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMemo() => $_has(5);
  @$pb.TagNumber(6)
  void clearMemo() => clearField(6);
}

/// Request message for retrieving raw details of a bond transaction.
class GetRawBondTransactionRequest extends $pb.GeneratedMessage {
  factory GetRawBondTransactionRequest({
    $core.int? lockTime,
    $core.String? sender,
    $core.String? receiver,
    $fixnum.Int64? stake,
    $core.String? publicKey,
    $fixnum.Int64? fee,
    $core.String? memo,
  }) {
    final $result = create();
    if (lockTime != null) {
      $result.lockTime = lockTime;
    }
    if (sender != null) {
      $result.sender = sender;
    }
    if (receiver != null) {
      $result.receiver = receiver;
    }
    if (stake != null) {
      $result.stake = stake;
    }
    if (publicKey != null) {
      $result.publicKey = publicKey;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (memo != null) {
      $result.memo = memo;
    }
    return $result;
  }
  GetRawBondTransactionRequest._() : super();
  factory GetRawBondTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRawBondTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRawBondTransactionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lockTime', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'sender')
    ..aOS(3, _omitFieldNames ? '' : 'receiver')
    ..aInt64(4, _omitFieldNames ? '' : 'stake')
    ..aOS(5, _omitFieldNames ? '' : 'publicKey')
    ..aInt64(6, _omitFieldNames ? '' : 'fee')
    ..aOS(7, _omitFieldNames ? '' : 'memo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRawBondTransactionRequest clone() => GetRawBondTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRawBondTransactionRequest copyWith(void Function(GetRawBondTransactionRequest) updates) => super.copyWith((message) => updates(message as GetRawBondTransactionRequest)) as GetRawBondTransactionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRawBondTransactionRequest create() => GetRawBondTransactionRequest._();
  GetRawBondTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<GetRawBondTransactionRequest> createRepeated() => $pb.PbList<GetRawBondTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRawBondTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRawBondTransactionRequest>(create);
  static GetRawBondTransactionRequest? _defaultInstance;

  /// Lock time for the transaction.
  /// If not explicitly set, it sets to the last block height.
  @$pb.TagNumber(1)
  $core.int get lockTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set lockTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLockTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearLockTime() => clearField(1);

  /// Sender's account address.
  @$pb.TagNumber(2)
  $core.String get sender => $_getSZ(1);
  @$pb.TagNumber(2)
  set sender($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSender() => $_has(1);
  @$pb.TagNumber(2)
  void clearSender() => clearField(2);

  /// Receiver's validator address.
  @$pb.TagNumber(3)
  $core.String get receiver => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiver($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReceiver() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiver() => clearField(3);

  /// Stake amount in NanoPAC.
  /// It should be greater than 0.
  @$pb.TagNumber(4)
  $fixnum.Int64 get stake => $_getI64(3);
  @$pb.TagNumber(4)
  set stake($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStake() => $_has(3);
  @$pb.TagNumber(4)
  void clearStake() => clearField(4);

  /// Public key of the validator.
  @$pb.TagNumber(5)
  $core.String get publicKey => $_getSZ(4);
  @$pb.TagNumber(5)
  set publicKey($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPublicKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearPublicKey() => clearField(5);

  /// Transaction fee in NanoPAC.
  /// If not explicitly set, it is calculated based on the stake.
  @$pb.TagNumber(6)
  $fixnum.Int64 get fee => $_getI64(5);
  @$pb.TagNumber(6)
  set fee($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFee() => $_has(5);
  @$pb.TagNumber(6)
  void clearFee() => clearField(6);

  /// Transaction memo.
  @$pb.TagNumber(7)
  $core.String get memo => $_getSZ(6);
  @$pb.TagNumber(7)
  set memo($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMemo() => $_has(6);
  @$pb.TagNumber(7)
  void clearMemo() => clearField(7);
}

/// Request message for retrieving raw details of an unbond transaction.
class GetRawUnbondTransactionRequest extends $pb.GeneratedMessage {
  factory GetRawUnbondTransactionRequest({
    $core.int? lockTime,
    $core.String? validatorAddress,
    $core.String? memo,
  }) {
    final $result = create();
    if (lockTime != null) {
      $result.lockTime = lockTime;
    }
    if (validatorAddress != null) {
      $result.validatorAddress = validatorAddress;
    }
    if (memo != null) {
      $result.memo = memo;
    }
    return $result;
  }
  GetRawUnbondTransactionRequest._() : super();
  factory GetRawUnbondTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRawUnbondTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRawUnbondTransactionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lockTime', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'validatorAddress')
    ..aOS(4, _omitFieldNames ? '' : 'memo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRawUnbondTransactionRequest clone() => GetRawUnbondTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRawUnbondTransactionRequest copyWith(void Function(GetRawUnbondTransactionRequest) updates) => super.copyWith((message) => updates(message as GetRawUnbondTransactionRequest)) as GetRawUnbondTransactionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRawUnbondTransactionRequest create() => GetRawUnbondTransactionRequest._();
  GetRawUnbondTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<GetRawUnbondTransactionRequest> createRepeated() => $pb.PbList<GetRawUnbondTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRawUnbondTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRawUnbondTransactionRequest>(create);
  static GetRawUnbondTransactionRequest? _defaultInstance;

  /// Lock time for the transaction.
  /// If not explicitly set, it sets to the last block height.
  @$pb.TagNumber(1)
  $core.int get lockTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set lockTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLockTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearLockTime() => clearField(1);

  /// Address of the validator to unbond from.
  @$pb.TagNumber(3)
  $core.String get validatorAddress => $_getSZ(1);
  @$pb.TagNumber(3)
  set validatorAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasValidatorAddress() => $_has(1);
  @$pb.TagNumber(3)
  void clearValidatorAddress() => clearField(3);

  /// Transaction memo.
  @$pb.TagNumber(4)
  $core.String get memo => $_getSZ(2);
  @$pb.TagNumber(4)
  set memo($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasMemo() => $_has(2);
  @$pb.TagNumber(4)
  void clearMemo() => clearField(4);
}

/// Request message for retrieving raw details of a withdraw transaction.
class GetRawWithdrawTransactionRequest extends $pb.GeneratedMessage {
  factory GetRawWithdrawTransactionRequest({
    $core.int? lockTime,
    $core.String? validatorAddress,
    $core.String? accountAddress,
    $fixnum.Int64? amount,
    $fixnum.Int64? fee,
    $core.String? memo,
  }) {
    final $result = create();
    if (lockTime != null) {
      $result.lockTime = lockTime;
    }
    if (validatorAddress != null) {
      $result.validatorAddress = validatorAddress;
    }
    if (accountAddress != null) {
      $result.accountAddress = accountAddress;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (memo != null) {
      $result.memo = memo;
    }
    return $result;
  }
  GetRawWithdrawTransactionRequest._() : super();
  factory GetRawWithdrawTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRawWithdrawTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRawWithdrawTransactionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lockTime', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'validatorAddress')
    ..aOS(3, _omitFieldNames ? '' : 'accountAddress')
    ..aInt64(4, _omitFieldNames ? '' : 'amount')
    ..aInt64(5, _omitFieldNames ? '' : 'fee')
    ..aOS(6, _omitFieldNames ? '' : 'memo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRawWithdrawTransactionRequest clone() => GetRawWithdrawTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRawWithdrawTransactionRequest copyWith(void Function(GetRawWithdrawTransactionRequest) updates) => super.copyWith((message) => updates(message as GetRawWithdrawTransactionRequest)) as GetRawWithdrawTransactionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRawWithdrawTransactionRequest create() => GetRawWithdrawTransactionRequest._();
  GetRawWithdrawTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<GetRawWithdrawTransactionRequest> createRepeated() => $pb.PbList<GetRawWithdrawTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRawWithdrawTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRawWithdrawTransactionRequest>(create);
  static GetRawWithdrawTransactionRequest? _defaultInstance;

  /// Lock time for the transaction.
  /// If not explicitly set, it sets to the last block height.
  @$pb.TagNumber(1)
  $core.int get lockTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set lockTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLockTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearLockTime() => clearField(1);

  /// Address of the validator to withdraw from.
  @$pb.TagNumber(2)
  $core.String get validatorAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set validatorAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValidatorAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorAddress() => clearField(2);

  /// Address of the account to withdraw to.
  @$pb.TagNumber(3)
  $core.String get accountAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountAddress() => clearField(3);

  /// Withdrawal amount in NanoPAC.
  /// It should be greater than 0.
  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  /// Transaction fee in NanoPAC.
  /// If not explicitly set, it is calculated based on the amount.
  @$pb.TagNumber(5)
  $fixnum.Int64 get fee => $_getI64(4);
  @$pb.TagNumber(5)
  set fee($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFee() => $_has(4);
  @$pb.TagNumber(5)
  void clearFee() => clearField(5);

  /// Transaction memo.
  @$pb.TagNumber(6)
  $core.String get memo => $_getSZ(5);
  @$pb.TagNumber(6)
  set memo($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMemo() => $_has(5);
  @$pb.TagNumber(6)
  void clearMemo() => clearField(6);
}

/// Response message containing raw transaction data.
class GetRawTransactionResponse extends $pb.GeneratedMessage {
  factory GetRawTransactionResponse({
    $core.List<$core.int>? rawTransaction,
  }) {
    final $result = create();
    if (rawTransaction != null) {
      $result.rawTransaction = rawTransaction;
    }
    return $result;
  }
  GetRawTransactionResponse._() : super();
  factory GetRawTransactionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRawTransactionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRawTransactionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'rawTransaction', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRawTransactionResponse clone() => GetRawTransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRawTransactionResponse copyWith(void Function(GetRawTransactionResponse) updates) => super.copyWith((message) => updates(message as GetRawTransactionResponse)) as GetRawTransactionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRawTransactionResponse create() => GetRawTransactionResponse._();
  GetRawTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<GetRawTransactionResponse> createRepeated() => $pb.PbList<GetRawTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRawTransactionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRawTransactionResponse>(create);
  static GetRawTransactionResponse? _defaultInstance;

  /// Raw transaction data.
  @$pb.TagNumber(1)
  $core.List<$core.int> get rawTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set rawTransaction($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRawTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawTransaction() => clearField(1);
}

/// Payload for a transfer transaction.
class PayloadTransfer extends $pb.GeneratedMessage {
  factory PayloadTransfer({
    $core.String? sender,
    $core.String? receiver,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (sender != null) {
      $result.sender = sender;
    }
    if (receiver != null) {
      $result.receiver = receiver;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  PayloadTransfer._() : super();
  factory PayloadTransfer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PayloadTransfer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PayloadTransfer', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sender')
    ..aOS(2, _omitFieldNames ? '' : 'receiver')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PayloadTransfer clone() => PayloadTransfer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PayloadTransfer copyWith(void Function(PayloadTransfer) updates) => super.copyWith((message) => updates(message as PayloadTransfer)) as PayloadTransfer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadTransfer create() => PayloadTransfer._();
  PayloadTransfer createEmptyInstance() => create();
  static $pb.PbList<PayloadTransfer> createRepeated() => $pb.PbList<PayloadTransfer>();
  @$core.pragma('dart2js:noInline')
  static PayloadTransfer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayloadTransfer>(create);
  static PayloadTransfer? _defaultInstance;

  /// Sender's address.
  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  /// Receiver's address.
  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  /// Transaction amount in NanoPAC.
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

/// Payload for a bond transaction.
class PayloadBond extends $pb.GeneratedMessage {
  factory PayloadBond({
    $core.String? sender,
    $core.String? receiver,
    $fixnum.Int64? stake,
  }) {
    final $result = create();
    if (sender != null) {
      $result.sender = sender;
    }
    if (receiver != null) {
      $result.receiver = receiver;
    }
    if (stake != null) {
      $result.stake = stake;
    }
    return $result;
  }
  PayloadBond._() : super();
  factory PayloadBond.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PayloadBond.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PayloadBond', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sender')
    ..aOS(2, _omitFieldNames ? '' : 'receiver')
    ..aInt64(3, _omitFieldNames ? '' : 'stake')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PayloadBond clone() => PayloadBond()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PayloadBond copyWith(void Function(PayloadBond) updates) => super.copyWith((message) => updates(message as PayloadBond)) as PayloadBond;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadBond create() => PayloadBond._();
  PayloadBond createEmptyInstance() => create();
  static $pb.PbList<PayloadBond> createRepeated() => $pb.PbList<PayloadBond>();
  @$core.pragma('dart2js:noInline')
  static PayloadBond getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayloadBond>(create);
  static PayloadBond? _defaultInstance;

  /// Sender's address.
  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  /// Receiver's address.
  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  /// Stake amount in NanoPAC.
  @$pb.TagNumber(3)
  $fixnum.Int64 get stake => $_getI64(2);
  @$pb.TagNumber(3)
  set stake($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStake() => $_has(2);
  @$pb.TagNumber(3)
  void clearStake() => clearField(3);
}

/// Payload for a sortition transaction.
class PayloadSortition extends $pb.GeneratedMessage {
  factory PayloadSortition({
    $core.String? address,
    $core.List<$core.int>? proof,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (proof != null) {
      $result.proof = proof;
    }
    return $result;
  }
  PayloadSortition._() : super();
  factory PayloadSortition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PayloadSortition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PayloadSortition', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'proof', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PayloadSortition clone() => PayloadSortition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PayloadSortition copyWith(void Function(PayloadSortition) updates) => super.copyWith((message) => updates(message as PayloadSortition)) as PayloadSortition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadSortition create() => PayloadSortition._();
  PayloadSortition createEmptyInstance() => create();
  static $pb.PbList<PayloadSortition> createRepeated() => $pb.PbList<PayloadSortition>();
  @$core.pragma('dart2js:noInline')
  static PayloadSortition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayloadSortition>(create);
  static PayloadSortition? _defaultInstance;

  /// Address associated with the sortition.
  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  /// Proof for the sortition.
  @$pb.TagNumber(2)
  $core.List<$core.int> get proof => $_getN(1);
  @$pb.TagNumber(2)
  set proof($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProof() => $_has(1);
  @$pb.TagNumber(2)
  void clearProof() => clearField(2);
}

/// Payload for an unbond transaction.
class PayloadUnbond extends $pb.GeneratedMessage {
  factory PayloadUnbond({
    $core.String? validator,
  }) {
    final $result = create();
    if (validator != null) {
      $result.validator = validator;
    }
    return $result;
  }
  PayloadUnbond._() : super();
  factory PayloadUnbond.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PayloadUnbond.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PayloadUnbond', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'validator')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PayloadUnbond clone() => PayloadUnbond()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PayloadUnbond copyWith(void Function(PayloadUnbond) updates) => super.copyWith((message) => updates(message as PayloadUnbond)) as PayloadUnbond;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadUnbond create() => PayloadUnbond._();
  PayloadUnbond createEmptyInstance() => create();
  static $pb.PbList<PayloadUnbond> createRepeated() => $pb.PbList<PayloadUnbond>();
  @$core.pragma('dart2js:noInline')
  static PayloadUnbond getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayloadUnbond>(create);
  static PayloadUnbond? _defaultInstance;

  /// Address of the validator to unbond from.
  @$pb.TagNumber(1)
  $core.String get validator => $_getSZ(0);
  @$pb.TagNumber(1)
  set validator($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidator() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidator() => clearField(1);
}

/// Payload for a withdraw transaction.
class PayloadWithdraw extends $pb.GeneratedMessage {
  factory PayloadWithdraw({
    $core.String? from,
    $core.String? to,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  PayloadWithdraw._() : super();
  factory PayloadWithdraw.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PayloadWithdraw.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PayloadWithdraw', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'from')
    ..aOS(2, _omitFieldNames ? '' : 'to')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PayloadWithdraw clone() => PayloadWithdraw()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PayloadWithdraw copyWith(void Function(PayloadWithdraw) updates) => super.copyWith((message) => updates(message as PayloadWithdraw)) as PayloadWithdraw;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadWithdraw create() => PayloadWithdraw._();
  PayloadWithdraw createEmptyInstance() => create();
  static $pb.PbList<PayloadWithdraw> createRepeated() => $pb.PbList<PayloadWithdraw>();
  @$core.pragma('dart2js:noInline')
  static PayloadWithdraw getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayloadWithdraw>(create);
  static PayloadWithdraw? _defaultInstance;

  /// Address to withdraw from.
  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  /// Address to withdraw to.
  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  /// Withdrawal amount in NanoPAC.
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

enum TransactionInfo_Payload {
  transfer, 
  bond, 
  sortition, 
  unbond, 
  withdraw, 
  notSet
}

/// Information about a transaction.
class TransactionInfo extends $pb.GeneratedMessage {
  factory TransactionInfo({
    $core.List<$core.int>? id,
    $core.List<$core.int>? data,
    $core.int? version,
    $core.int? lockTime,
    $fixnum.Int64? value,
    $fixnum.Int64? fee,
    PayloadType? payloadType,
    $core.String? memo,
    $core.String? publicKey,
    $core.List<$core.int>? signature,
    PayloadTransfer? transfer,
    PayloadBond? bond,
    PayloadSortition? sortition,
    PayloadUnbond? unbond,
    PayloadWithdraw? withdraw,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (data != null) {
      $result.data = data;
    }
    if (version != null) {
      $result.version = version;
    }
    if (lockTime != null) {
      $result.lockTime = lockTime;
    }
    if (value != null) {
      $result.value = value;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (payloadType != null) {
      $result.payloadType = payloadType;
    }
    if (memo != null) {
      $result.memo = memo;
    }
    if (publicKey != null) {
      $result.publicKey = publicKey;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    if (transfer != null) {
      $result.transfer = transfer;
    }
    if (bond != null) {
      $result.bond = bond;
    }
    if (sortition != null) {
      $result.sortition = sortition;
    }
    if (unbond != null) {
      $result.unbond = unbond;
    }
    if (withdraw != null) {
      $result.withdraw = withdraw;
    }
    return $result;
  }
  TransactionInfo._() : super();
  factory TransactionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TransactionInfo_Payload> _TransactionInfo_PayloadByTag = {
    30 : TransactionInfo_Payload.transfer,
    31 : TransactionInfo_Payload.bond,
    32 : TransactionInfo_Payload.sortition,
    33 : TransactionInfo_Payload.unbond,
    34 : TransactionInfo_Payload.withdraw,
    0 : TransactionInfo_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..oo(0, [30, 31, 32, 33, 34])
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'lockTime', $pb.PbFieldType.OU3)
    ..aInt64(5, _omitFieldNames ? '' : 'value')
    ..aInt64(6, _omitFieldNames ? '' : 'fee')
    ..e<PayloadType>(7, _omitFieldNames ? '' : 'payloadType', $pb.PbFieldType.OE, defaultOrMaker: PayloadType.UNKNOWN, valueOf: PayloadType.valueOf, enumValues: PayloadType.values)
    ..aOS(8, _omitFieldNames ? '' : 'memo')
    ..aOS(9, _omitFieldNames ? '' : 'publicKey')
    ..a<$core.List<$core.int>>(10, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..aOM<PayloadTransfer>(30, _omitFieldNames ? '' : 'transfer', subBuilder: PayloadTransfer.create)
    ..aOM<PayloadBond>(31, _omitFieldNames ? '' : 'bond', subBuilder: PayloadBond.create)
    ..aOM<PayloadSortition>(32, _omitFieldNames ? '' : 'sortition', subBuilder: PayloadSortition.create)
    ..aOM<PayloadUnbond>(33, _omitFieldNames ? '' : 'unbond', subBuilder: PayloadUnbond.create)
    ..aOM<PayloadWithdraw>(34, _omitFieldNames ? '' : 'withdraw', subBuilder: PayloadWithdraw.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionInfo clone() => TransactionInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionInfo copyWith(void Function(TransactionInfo) updates) => super.copyWith((message) => updates(message as TransactionInfo)) as TransactionInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionInfo create() => TransactionInfo._();
  TransactionInfo createEmptyInstance() => create();
  static $pb.PbList<TransactionInfo> createRepeated() => $pb.PbList<TransactionInfo>();
  @$core.pragma('dart2js:noInline')
  static TransactionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionInfo>(create);
  static TransactionInfo? _defaultInstance;

  TransactionInfo_Payload whichPayload() => _TransactionInfo_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  /// Transaction ID.
  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// Transaction data.
  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);

  /// Transaction version.
  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  /// Lock time for the transaction.
  @$pb.TagNumber(4)
  $core.int get lockTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set lockTime($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLockTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearLockTime() => clearField(4);

  /// Transaction value in NanoPAC.
  @$pb.TagNumber(5)
  $fixnum.Int64 get value => $_getI64(4);
  @$pb.TagNumber(5)
  set value($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearValue() => clearField(5);

  /// Transaction fee in NanoPAC.
  @$pb.TagNumber(6)
  $fixnum.Int64 get fee => $_getI64(5);
  @$pb.TagNumber(6)
  set fee($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFee() => $_has(5);
  @$pb.TagNumber(6)
  void clearFee() => clearField(6);

  /// Type of transaction payload.
  @$pb.TagNumber(7)
  PayloadType get payloadType => $_getN(6);
  @$pb.TagNumber(7)
  set payloadType(PayloadType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPayloadType() => $_has(6);
  @$pb.TagNumber(7)
  void clearPayloadType() => clearField(7);

  /// Transaction memo.
  @$pb.TagNumber(8)
  $core.String get memo => $_getSZ(7);
  @$pb.TagNumber(8)
  set memo($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMemo() => $_has(7);
  @$pb.TagNumber(8)
  void clearMemo() => clearField(8);

  /// Public key associated with the transaction.
  @$pb.TagNumber(9)
  $core.String get publicKey => $_getSZ(8);
  @$pb.TagNumber(9)
  set publicKey($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPublicKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearPublicKey() => clearField(9);

  /// Transaction signature.
  @$pb.TagNumber(10)
  $core.List<$core.int> get signature => $_getN(9);
  @$pb.TagNumber(10)
  set signature($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSignature() => $_has(9);
  @$pb.TagNumber(10)
  void clearSignature() => clearField(10);

  /// Transfer payload.
  @$pb.TagNumber(30)
  PayloadTransfer get transfer => $_getN(10);
  @$pb.TagNumber(30)
  set transfer(PayloadTransfer v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasTransfer() => $_has(10);
  @$pb.TagNumber(30)
  void clearTransfer() => clearField(30);
  @$pb.TagNumber(30)
  PayloadTransfer ensureTransfer() => $_ensure(10);

  /// Bond payload.
  @$pb.TagNumber(31)
  PayloadBond get bond => $_getN(11);
  @$pb.TagNumber(31)
  set bond(PayloadBond v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasBond() => $_has(11);
  @$pb.TagNumber(31)
  void clearBond() => clearField(31);
  @$pb.TagNumber(31)
  PayloadBond ensureBond() => $_ensure(11);

  /// Sortition payload.
  @$pb.TagNumber(32)
  PayloadSortition get sortition => $_getN(12);
  @$pb.TagNumber(32)
  set sortition(PayloadSortition v) { setField(32, v); }
  @$pb.TagNumber(32)
  $core.bool hasSortition() => $_has(12);
  @$pb.TagNumber(32)
  void clearSortition() => clearField(32);
  @$pb.TagNumber(32)
  PayloadSortition ensureSortition() => $_ensure(12);

  /// Unbond payload.
  @$pb.TagNumber(33)
  PayloadUnbond get unbond => $_getN(13);
  @$pb.TagNumber(33)
  set unbond(PayloadUnbond v) { setField(33, v); }
  @$pb.TagNumber(33)
  $core.bool hasUnbond() => $_has(13);
  @$pb.TagNumber(33)
  void clearUnbond() => clearField(33);
  @$pb.TagNumber(33)
  PayloadUnbond ensureUnbond() => $_ensure(13);

  /// Withdraw payload.
  @$pb.TagNumber(34)
  PayloadWithdraw get withdraw => $_getN(14);
  @$pb.TagNumber(34)
  set withdraw(PayloadWithdraw v) { setField(34, v); }
  @$pb.TagNumber(34)
  $core.bool hasWithdraw() => $_has(14);
  @$pb.TagNumber(34)
  void clearWithdraw() => clearField(34);
  @$pb.TagNumber(34)
  PayloadWithdraw ensureWithdraw() => $_ensure(14);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
