//  Generated code. Do not modify.
//  source: wallet.proto
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name
// ignore_for_file: UNDEFINED_SHOWN_NAME
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: require_trailing_commas
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: prefer_constructors_over_static_methods
// ignore_for_file: sort_unnamed_constructors_first
// ignore_for_file: sort_constructors_first
// ignore_for_file: prefer_final_locals

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AddressType extends $pb.ProtobufEnum {
  static const AddressType ADDRESS_TYPE_TREASURY = AddressType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ADDRESS_TYPE_TREASURY');
  static const AddressType ADDRESS_TYPE_VALIDATOR = AddressType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ADDRESS_TYPE_VALIDATOR');
  static const AddressType ADDRESS_TYPE_BLS_ACCOUNT = AddressType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ADDRESS_TYPE_BLS_ACCOUNT');
  static const AddressType ADDRESS_TYPE_ED25519_ACCOUNT = AddressType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ADDRESS_TYPE_ED25519_ACCOUNT');

  static const $core.List<AddressType> values = <AddressType>[
    ADDRESS_TYPE_TREASURY,
    ADDRESS_TYPE_VALIDATOR,
    ADDRESS_TYPE_BLS_ACCOUNT,
    ADDRESS_TYPE_ED25519_ACCOUNT,
  ];

  static final $core.Map<$core.int, AddressType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AddressType? valueOf($core.int value) => _byValue[value];

  const AddressType._($core.int v, $core.String n) : super(v, n);
}
