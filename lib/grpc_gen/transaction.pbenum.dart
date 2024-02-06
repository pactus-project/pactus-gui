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

import 'package:protobuf/protobuf.dart' as $pb;

/// Enumeration for different types of transaction payloads.
class PayloadType extends $pb.ProtobufEnum {
  static const PayloadType UNKNOWN = PayloadType._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const PayloadType TRANSFER_PAYLOAD = PayloadType._(1, _omitEnumNames ? '' : 'TRANSFER_PAYLOAD');
  static const PayloadType BOND_PAYLOAD = PayloadType._(2, _omitEnumNames ? '' : 'BOND_PAYLOAD');
  static const PayloadType SORTITION_PAYLOAD = PayloadType._(3, _omitEnumNames ? '' : 'SORTITION_PAYLOAD');
  static const PayloadType UNBOND_PAYLOAD = PayloadType._(4, _omitEnumNames ? '' : 'UNBOND_PAYLOAD');
  static const PayloadType WITHDRAW_PAYLOAD = PayloadType._(5, _omitEnumNames ? '' : 'WITHDRAW_PAYLOAD');

  static const $core.List<PayloadType> values = <PayloadType> [
    UNKNOWN,
    TRANSFER_PAYLOAD,
    BOND_PAYLOAD,
    SORTITION_PAYLOAD,
    UNBOND_PAYLOAD,
    WITHDRAW_PAYLOAD,
  ];

  static final $core.Map<$core.int, PayloadType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PayloadType? valueOf($core.int value) => _byValue[value];

  const PayloadType._($core.int v, $core.String n) : super(v, n);
}

/// Enumeration for verbosity level when requesting transaction details.
class TransactionVerbosity extends $pb.ProtobufEnum {
  static const TransactionVerbosity TRANSACTION_DATA = TransactionVerbosity._(0, _omitEnumNames ? '' : 'TRANSACTION_DATA');
  static const TransactionVerbosity TRANSACTION_INFO = TransactionVerbosity._(1, _omitEnumNames ? '' : 'TRANSACTION_INFO');

  static const $core.List<TransactionVerbosity> values = <TransactionVerbosity> [
    TRANSACTION_DATA,
    TRANSACTION_INFO,
  ];

  static final $core.Map<$core.int, TransactionVerbosity> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionVerbosity? valueOf($core.int value) => _byValue[value];

  const TransactionVerbosity._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
