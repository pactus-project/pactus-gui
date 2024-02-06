//
//  Generated code. Do not modify.
//  source: blockchain.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Enumeration for verbosity level when requesting block information.
class BlockVerbosity extends $pb.ProtobufEnum {
  static const BlockVerbosity BLOCK_DATA = BlockVerbosity._(0, _omitEnumNames ? '' : 'BLOCK_DATA');
  static const BlockVerbosity BLOCK_INFO = BlockVerbosity._(1, _omitEnumNames ? '' : 'BLOCK_INFO');
  static const BlockVerbosity BLOCK_TRANSACTIONS = BlockVerbosity._(2, _omitEnumNames ? '' : 'BLOCK_TRANSACTIONS');

  static const $core.List<BlockVerbosity> values = <BlockVerbosity> [
    BLOCK_DATA,
    BLOCK_INFO,
    BLOCK_TRANSACTIONS,
  ];

  static final $core.Map<$core.int, BlockVerbosity> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BlockVerbosity? valueOf($core.int value) => _byValue[value];

  const BlockVerbosity._($core.int v, $core.String n) : super(v, n);
}

/// Enumeration for types of votes.
class VoteType extends $pb.ProtobufEnum {
  static const VoteType VOTE_UNKNOWN = VoteType._(0, _omitEnumNames ? '' : 'VOTE_UNKNOWN');
  static const VoteType VOTE_PREPARE = VoteType._(1, _omitEnumNames ? '' : 'VOTE_PREPARE');
  static const VoteType VOTE_PRECOMMIT = VoteType._(2, _omitEnumNames ? '' : 'VOTE_PRECOMMIT');
  static const VoteType VOTE_CHANGE_PROPOSER = VoteType._(3, _omitEnumNames ? '' : 'VOTE_CHANGE_PROPOSER');

  static const $core.List<VoteType> values = <VoteType> [
    VOTE_UNKNOWN,
    VOTE_PREPARE,
    VOTE_PRECOMMIT,
    VOTE_CHANGE_PROPOSER,
  ];

  static final $core.Map<$core.int, VoteType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VoteType? valueOf($core.int value) => _byValue[value];

  const VoteType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
