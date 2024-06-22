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

/// Enum for the address type.
class AddressType extends $pb.ProtobufEnum {
  static const AddressType ADDRESS_TYPE_TREASURY = AddressType._(0, _omitEnumNames ? '' : 'ADDRESS_TYPE_TREASURY');
  static const AddressType ADDRESS_TYPE_VALIDATOR = AddressType._(1, _omitEnumNames ? '' : 'ADDRESS_TYPE_VALIDATOR');
  static const AddressType ADDRESS_TYPE_BLS_ACCOUNT = AddressType._(2, _omitEnumNames ? '' : 'ADDRESS_TYPE_BLS_ACCOUNT');

  static const $core.List<AddressType> values = <AddressType> [
    ADDRESS_TYPE_TREASURY,
    ADDRESS_TYPE_VALIDATOR,
    ADDRESS_TYPE_BLS_ACCOUNT,
  ];

  static final $core.Map<$core.int, AddressType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AddressType? valueOf($core.int value) => _byValue[value];

  const AddressType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
