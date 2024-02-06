//
//  Generated code. Do not modify.
//  source: blockchain.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use blockVerbosityDescriptor instead')
const BlockVerbosity$json = {
  '1': 'BlockVerbosity',
  '2': [
    {'1': 'BLOCK_DATA', '2': 0},
    {'1': 'BLOCK_INFO', '2': 1},
    {'1': 'BLOCK_TRANSACTIONS', '2': 2},
  ],
};

/// Descriptor for `BlockVerbosity`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List blockVerbosityDescriptor = $convert.base64Decode(
    'Cg5CbG9ja1ZlcmJvc2l0eRIOCgpCTE9DS19EQVRBEAASDgoKQkxPQ0tfSU5GTxABEhYKEkJMT0'
    'NLX1RSQU5TQUNUSU9OUxAC');

@$core.Deprecated('Use voteTypeDescriptor instead')
const VoteType$json = {
  '1': 'VoteType',
  '2': [
    {'1': 'VOTE_UNKNOWN', '2': 0},
    {'1': 'VOTE_PREPARE', '2': 1},
    {'1': 'VOTE_PRECOMMIT', '2': 2},
    {'1': 'VOTE_CHANGE_PROPOSER', '2': 3},
  ],
};

/// Descriptor for `VoteType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List voteTypeDescriptor = $convert.base64Decode(
    'CghWb3RlVHlwZRIQCgxWT1RFX1VOS05PV04QABIQCgxWT1RFX1BSRVBBUkUQARISCg5WT1RFX1'
    'BSRUNPTU1JVBACEhgKFFZPVEVfQ0hBTkdFX1BST1BPU0VSEAM=');

@$core.Deprecated('Use getAccountRequestDescriptor instead')
const GetAccountRequest$json = {
  '1': 'GetAccountRequest',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `GetAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountRequestDescriptor = $convert.base64Decode(
    'ChFHZXRBY2NvdW50UmVxdWVzdBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNz');

@$core.Deprecated('Use getAccountResponseDescriptor instead')
const GetAccountResponse$json = {
  '1': 'GetAccountResponse',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.pactus.AccountInfo', '10': 'account'},
  ],
};

/// Descriptor for `GetAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountResponseDescriptor = $convert.base64Decode(
    'ChJHZXRBY2NvdW50UmVzcG9uc2USLQoHYWNjb3VudBgBIAEoCzITLnBhY3R1cy5BY2NvdW50SW'
    '5mb1IHYWNjb3VudA==');

@$core.Deprecated('Use getValidatorAddressesRequestDescriptor instead')
const GetValidatorAddressesRequest$json = {
  '1': 'GetValidatorAddressesRequest',
};

/// Descriptor for `GetValidatorAddressesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getValidatorAddressesRequestDescriptor = $convert.base64Decode(
    'ChxHZXRWYWxpZGF0b3JBZGRyZXNzZXNSZXF1ZXN0');

@$core.Deprecated('Use getValidatorAddressesResponseDescriptor instead')
const GetValidatorAddressesResponse$json = {
  '1': 'GetValidatorAddressesResponse',
  '2': [
    {'1': 'addresses', '3': 1, '4': 3, '5': 9, '10': 'addresses'},
  ],
};

/// Descriptor for `GetValidatorAddressesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getValidatorAddressesResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRWYWxpZGF0b3JBZGRyZXNzZXNSZXNwb25zZRIcCglhZGRyZXNzZXMYASADKAlSCWFkZH'
    'Jlc3Nlcw==');

@$core.Deprecated('Use getValidatorRequestDescriptor instead')
const GetValidatorRequest$json = {
  '1': 'GetValidatorRequest',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `GetValidatorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getValidatorRequestDescriptor = $convert.base64Decode(
    'ChNHZXRWYWxpZGF0b3JSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3M=');

@$core.Deprecated('Use getValidatorByNumberRequestDescriptor instead')
const GetValidatorByNumberRequest$json = {
  '1': 'GetValidatorByNumberRequest',
  '2': [
    {'1': 'number', '3': 1, '4': 1, '5': 5, '10': 'number'},
  ],
};

/// Descriptor for `GetValidatorByNumberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getValidatorByNumberRequestDescriptor = $convert.base64Decode(
    'ChtHZXRWYWxpZGF0b3JCeU51bWJlclJlcXVlc3QSFgoGbnVtYmVyGAEgASgFUgZudW1iZXI=');

@$core.Deprecated('Use getValidatorResponseDescriptor instead')
const GetValidatorResponse$json = {
  '1': 'GetValidatorResponse',
  '2': [
    {'1': 'validator', '3': 1, '4': 1, '5': 11, '6': '.pactus.ValidatorInfo', '10': 'validator'},
  ],
};

/// Descriptor for `GetValidatorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getValidatorResponseDescriptor = $convert.base64Decode(
    'ChRHZXRWYWxpZGF0b3JSZXNwb25zZRIzCgl2YWxpZGF0b3IYASABKAsyFS5wYWN0dXMuVmFsaW'
    'RhdG9ySW5mb1IJdmFsaWRhdG9y');

@$core.Deprecated('Use getPublicKeyRequestDescriptor instead')
const GetPublicKeyRequest$json = {
  '1': 'GetPublicKeyRequest',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `GetPublicKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPublicKeyRequestDescriptor = $convert.base64Decode(
    'ChNHZXRQdWJsaWNLZXlSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3M=');

@$core.Deprecated('Use getPublicKeyResponseDescriptor instead')
const GetPublicKeyResponse$json = {
  '1': 'GetPublicKeyResponse',
  '2': [
    {'1': 'public_key', '3': 1, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

/// Descriptor for `GetPublicKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPublicKeyResponseDescriptor = $convert.base64Decode(
    'ChRHZXRQdWJsaWNLZXlSZXNwb25zZRIdCgpwdWJsaWNfa2V5GAEgASgJUglwdWJsaWNLZXk=');

@$core.Deprecated('Use getBlockRequestDescriptor instead')
const GetBlockRequest$json = {
  '1': 'GetBlockRequest',
  '2': [
    {'1': 'height', '3': 1, '4': 1, '5': 13, '10': 'height'},
    {'1': 'verbosity', '3': 2, '4': 1, '5': 14, '6': '.pactus.BlockVerbosity', '10': 'verbosity'},
  ],
};

/// Descriptor for `GetBlockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRCbG9ja1JlcXVlc3QSFgoGaGVpZ2h0GAEgASgNUgZoZWlnaHQSNAoJdmVyYm9zaXR5GA'
    'IgASgOMhYucGFjdHVzLkJsb2NrVmVyYm9zaXR5Ugl2ZXJib3NpdHk=');

@$core.Deprecated('Use getBlockResponseDescriptor instead')
const GetBlockResponse$json = {
  '1': 'GetBlockResponse',
  '2': [
    {'1': 'height', '3': 1, '4': 1, '5': 13, '10': 'height'},
    {'1': 'hash', '3': 2, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
    {'1': 'block_time', '3': 4, '4': 1, '5': 13, '10': 'blockTime'},
    {'1': 'header', '3': 5, '4': 1, '5': 11, '6': '.pactus.BlockHeaderInfo', '10': 'header'},
    {'1': 'prev_cert', '3': 6, '4': 1, '5': 11, '6': '.pactus.CertificateInfo', '10': 'prevCert'},
    {'1': 'txs', '3': 7, '4': 3, '5': 11, '6': '.pactus.TransactionInfo', '10': 'txs'},
  ],
};

/// Descriptor for `GetBlockResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockResponseDescriptor = $convert.base64Decode(
    'ChBHZXRCbG9ja1Jlc3BvbnNlEhYKBmhlaWdodBgBIAEoDVIGaGVpZ2h0EhIKBGhhc2gYAiABKA'
    'xSBGhhc2gSEgoEZGF0YRgDIAEoDFIEZGF0YRIdCgpibG9ja190aW1lGAQgASgNUglibG9ja1Rp'
    'bWUSLwoGaGVhZGVyGAUgASgLMhcucGFjdHVzLkJsb2NrSGVhZGVySW5mb1IGaGVhZGVyEjQKCX'
    'ByZXZfY2VydBgGIAEoCzIXLnBhY3R1cy5DZXJ0aWZpY2F0ZUluZm9SCHByZXZDZXJ0EikKA3R4'
    'cxgHIAMoCzIXLnBhY3R1cy5UcmFuc2FjdGlvbkluZm9SA3R4cw==');

@$core.Deprecated('Use getBlockHashRequestDescriptor instead')
const GetBlockHashRequest$json = {
  '1': 'GetBlockHashRequest',
  '2': [
    {'1': 'height', '3': 1, '4': 1, '5': 13, '10': 'height'},
  ],
};

/// Descriptor for `GetBlockHashRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockHashRequestDescriptor = $convert.base64Decode(
    'ChNHZXRCbG9ja0hhc2hSZXF1ZXN0EhYKBmhlaWdodBgBIAEoDVIGaGVpZ2h0');

@$core.Deprecated('Use getBlockHashResponseDescriptor instead')
const GetBlockHashResponse$json = {
  '1': 'GetBlockHashResponse',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
  ],
};

/// Descriptor for `GetBlockHashResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockHashResponseDescriptor = $convert.base64Decode(
    'ChRHZXRCbG9ja0hhc2hSZXNwb25zZRISCgRoYXNoGAEgASgMUgRoYXNo');

@$core.Deprecated('Use getBlockHeightRequestDescriptor instead')
const GetBlockHeightRequest$json = {
  '1': 'GetBlockHeightRequest',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
  ],
};

/// Descriptor for `GetBlockHeightRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockHeightRequestDescriptor = $convert.base64Decode(
    'ChVHZXRCbG9ja0hlaWdodFJlcXVlc3QSEgoEaGFzaBgBIAEoDFIEaGFzaA==');

@$core.Deprecated('Use getBlockHeightResponseDescriptor instead')
const GetBlockHeightResponse$json = {
  '1': 'GetBlockHeightResponse',
  '2': [
    {'1': 'height', '3': 1, '4': 1, '5': 13, '10': 'height'},
  ],
};

/// Descriptor for `GetBlockHeightResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockHeightResponseDescriptor = $convert.base64Decode(
    'ChZHZXRCbG9ja0hlaWdodFJlc3BvbnNlEhYKBmhlaWdodBgBIAEoDVIGaGVpZ2h0');

@$core.Deprecated('Use getBlockchainInfoRequestDescriptor instead')
const GetBlockchainInfoRequest$json = {
  '1': 'GetBlockchainInfoRequest',
};

/// Descriptor for `GetBlockchainInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockchainInfoRequestDescriptor = $convert.base64Decode(
    'ChhHZXRCbG9ja2NoYWluSW5mb1JlcXVlc3Q=');

@$core.Deprecated('Use getBlockchainInfoResponseDescriptor instead')
const GetBlockchainInfoResponse$json = {
  '1': 'GetBlockchainInfoResponse',
  '2': [
    {'1': 'last_block_height', '3': 1, '4': 1, '5': 13, '10': 'lastBlockHeight'},
    {'1': 'last_block_hash', '3': 2, '4': 1, '5': 12, '10': 'lastBlockHash'},
    {'1': 'total_accounts', '3': 3, '4': 1, '5': 5, '10': 'totalAccounts'},
    {'1': 'total_validators', '3': 4, '4': 1, '5': 5, '10': 'totalValidators'},
    {'1': 'total_power', '3': 5, '4': 1, '5': 3, '10': 'totalPower'},
    {'1': 'committee_power', '3': 6, '4': 1, '5': 3, '10': 'committeePower'},
    {'1': 'committee_validators', '3': 7, '4': 3, '5': 11, '6': '.pactus.ValidatorInfo', '10': 'committeeValidators'},
  ],
};

/// Descriptor for `GetBlockchainInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockchainInfoResponseDescriptor = $convert.base64Decode(
    'ChlHZXRCbG9ja2NoYWluSW5mb1Jlc3BvbnNlEioKEWxhc3RfYmxvY2tfaGVpZ2h0GAEgASgNUg'
    '9sYXN0QmxvY2tIZWlnaHQSJgoPbGFzdF9ibG9ja19oYXNoGAIgASgMUg1sYXN0QmxvY2tIYXNo'
    'EiUKDnRvdGFsX2FjY291bnRzGAMgASgFUg10b3RhbEFjY291bnRzEikKEHRvdGFsX3ZhbGlkYX'
    'RvcnMYBCABKAVSD3RvdGFsVmFsaWRhdG9ycxIfCgt0b3RhbF9wb3dlchgFIAEoA1IKdG90YWxQ'
    'b3dlchInCg9jb21taXR0ZWVfcG93ZXIYBiABKANSDmNvbW1pdHRlZVBvd2VyEkgKFGNvbW1pdH'
    'RlZV92YWxpZGF0b3JzGAcgAygLMhUucGFjdHVzLlZhbGlkYXRvckluZm9SE2NvbW1pdHRlZVZh'
    'bGlkYXRvcnM=');

@$core.Deprecated('Use getConsensusInfoRequestDescriptor instead')
const GetConsensusInfoRequest$json = {
  '1': 'GetConsensusInfoRequest',
};

/// Descriptor for `GetConsensusInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getConsensusInfoRequestDescriptor = $convert.base64Decode(
    'ChdHZXRDb25zZW5zdXNJbmZvUmVxdWVzdA==');

@$core.Deprecated('Use getConsensusInfoResponseDescriptor instead')
const GetConsensusInfoResponse$json = {
  '1': 'GetConsensusInfoResponse',
  '2': [
    {'1': 'instances', '3': 1, '4': 3, '5': 11, '6': '.pactus.ConsensusInfo', '10': 'instances'},
  ],
};

/// Descriptor for `GetConsensusInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getConsensusInfoResponseDescriptor = $convert.base64Decode(
    'ChhHZXRDb25zZW5zdXNJbmZvUmVzcG9uc2USMwoJaW5zdGFuY2VzGAEgAygLMhUucGFjdHVzLk'
    'NvbnNlbnN1c0luZm9SCWluc3RhbmNlcw==');

@$core.Deprecated('Use validatorInfoDescriptor instead')
const ValidatorInfo$json = {
  '1': 'ValidatorInfo',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
    {'1': 'public_key', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
    {'1': 'number', '3': 4, '4': 1, '5': 5, '10': 'number'},
    {'1': 'stake', '3': 5, '4': 1, '5': 3, '10': 'stake'},
    {'1': 'last_bonding_height', '3': 6, '4': 1, '5': 13, '10': 'lastBondingHeight'},
    {'1': 'last_sortition_height', '3': 7, '4': 1, '5': 13, '10': 'lastSortitionHeight'},
    {'1': 'unbonding_height', '3': 8, '4': 1, '5': 13, '10': 'unbondingHeight'},
    {'1': 'address', '3': 9, '4': 1, '5': 9, '10': 'address'},
    {'1': 'availability_score', '3': 10, '4': 1, '5': 1, '10': 'availabilityScore'},
  ],
};

/// Descriptor for `ValidatorInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorInfoDescriptor = $convert.base64Decode(
    'Cg1WYWxpZGF0b3JJbmZvEhIKBGhhc2gYASABKAxSBGhhc2gSEgoEZGF0YRgCIAEoDFIEZGF0YR'
    'IdCgpwdWJsaWNfa2V5GAMgASgJUglwdWJsaWNLZXkSFgoGbnVtYmVyGAQgASgFUgZudW1iZXIS'
    'FAoFc3Rha2UYBSABKANSBXN0YWtlEi4KE2xhc3RfYm9uZGluZ19oZWlnaHQYBiABKA1SEWxhc3'
    'RCb25kaW5nSGVpZ2h0EjIKFWxhc3Rfc29ydGl0aW9uX2hlaWdodBgHIAEoDVITbGFzdFNvcnRp'
    'dGlvbkhlaWdodBIpChB1bmJvbmRpbmdfaGVpZ2h0GAggASgNUg91bmJvbmRpbmdIZWlnaHQSGA'
    'oHYWRkcmVzcxgJIAEoCVIHYWRkcmVzcxItChJhdmFpbGFiaWxpdHlfc2NvcmUYCiABKAFSEWF2'
    'YWlsYWJpbGl0eVNjb3Jl');

@$core.Deprecated('Use accountInfoDescriptor instead')
const AccountInfo$json = {
  '1': 'AccountInfo',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
    {'1': 'number', '3': 3, '4': 1, '5': 5, '10': 'number'},
    {'1': 'balance', '3': 4, '4': 1, '5': 3, '10': 'balance'},
    {'1': 'address', '3': 5, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `AccountInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountInfoDescriptor = $convert.base64Decode(
    'CgtBY2NvdW50SW5mbxISCgRoYXNoGAEgASgMUgRoYXNoEhIKBGRhdGEYAiABKAxSBGRhdGESFg'
    'oGbnVtYmVyGAMgASgFUgZudW1iZXISGAoHYmFsYW5jZRgEIAEoA1IHYmFsYW5jZRIYCgdhZGRy'
    'ZXNzGAUgASgJUgdhZGRyZXNz');

@$core.Deprecated('Use blockHeaderInfoDescriptor instead')
const BlockHeaderInfo$json = {
  '1': 'BlockHeaderInfo',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {'1': 'prev_block_hash', '3': 2, '4': 1, '5': 12, '10': 'prevBlockHash'},
    {'1': 'state_root', '3': 3, '4': 1, '5': 12, '10': 'stateRoot'},
    {'1': 'sortition_seed', '3': 4, '4': 1, '5': 12, '10': 'sortitionSeed'},
    {'1': 'proposer_address', '3': 5, '4': 1, '5': 9, '10': 'proposerAddress'},
  ],
};

/// Descriptor for `BlockHeaderInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockHeaderInfoDescriptor = $convert.base64Decode(
    'Cg9CbG9ja0hlYWRlckluZm8SGAoHdmVyc2lvbhgBIAEoBVIHdmVyc2lvbhImCg9wcmV2X2Jsb2'
    'NrX2hhc2gYAiABKAxSDXByZXZCbG9ja0hhc2gSHQoKc3RhdGVfcm9vdBgDIAEoDFIJc3RhdGVS'
    'b290EiUKDnNvcnRpdGlvbl9zZWVkGAQgASgMUg1zb3J0aXRpb25TZWVkEikKEHByb3Bvc2VyX2'
    'FkZHJlc3MYBSABKAlSD3Byb3Bvc2VyQWRkcmVzcw==');

@$core.Deprecated('Use certificateInfoDescriptor instead')
const CertificateInfo$json = {
  '1': 'CertificateInfo',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'round', '3': 2, '4': 1, '5': 5, '10': 'round'},
    {'1': 'committers', '3': 3, '4': 3, '5': 5, '10': 'committers'},
    {'1': 'absentees', '3': 4, '4': 3, '5': 5, '10': 'absentees'},
    {'1': 'signature', '3': 5, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `CertificateInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List certificateInfoDescriptor = $convert.base64Decode(
    'Cg9DZXJ0aWZpY2F0ZUluZm8SEgoEaGFzaBgBIAEoDFIEaGFzaBIUCgVyb3VuZBgCIAEoBVIFcm'
    '91bmQSHgoKY29tbWl0dGVycxgDIAMoBVIKY29tbWl0dGVycxIcCglhYnNlbnRlZXMYBCADKAVS'
    'CWFic2VudGVlcxIcCglzaWduYXR1cmUYBSABKAxSCXNpZ25hdHVyZQ==');

@$core.Deprecated('Use voteInfoDescriptor instead')
const VoteInfo$json = {
  '1': 'VoteInfo',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.pactus.VoteType', '10': 'type'},
    {'1': 'voter', '3': 2, '4': 1, '5': 9, '10': 'voter'},
    {'1': 'block_hash', '3': 3, '4': 1, '5': 12, '10': 'blockHash'},
    {'1': 'round', '3': 4, '4': 1, '5': 5, '10': 'round'},
    {'1': 'cp_round', '3': 5, '4': 1, '5': 5, '10': 'cpRound'},
    {'1': 'cp_value', '3': 6, '4': 1, '5': 5, '10': 'cpValue'},
  ],
};

/// Descriptor for `VoteInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteInfoDescriptor = $convert.base64Decode(
    'CghWb3RlSW5mbxIkCgR0eXBlGAEgASgOMhAucGFjdHVzLlZvdGVUeXBlUgR0eXBlEhQKBXZvdG'
    'VyGAIgASgJUgV2b3RlchIdCgpibG9ja19oYXNoGAMgASgMUglibG9ja0hhc2gSFAoFcm91bmQY'
    'BCABKAVSBXJvdW5kEhkKCGNwX3JvdW5kGAUgASgFUgdjcFJvdW5kEhkKCGNwX3ZhbHVlGAYgAS'
    'gFUgdjcFZhbHVl');

@$core.Deprecated('Use consensusInfoDescriptor instead')
const ConsensusInfo$json = {
  '1': 'ConsensusInfo',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'Active', '3': 2, '4': 1, '5': 8, '10': 'Active'},
    {'1': 'height', '3': 3, '4': 1, '5': 13, '10': 'height'},
    {'1': 'round', '3': 4, '4': 1, '5': 5, '10': 'round'},
    {'1': 'votes', '3': 5, '4': 3, '5': 11, '6': '.pactus.VoteInfo', '10': 'votes'},
  ],
};

/// Descriptor for `ConsensusInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List consensusInfoDescriptor = $convert.base64Decode(
    'Cg1Db25zZW5zdXNJbmZvEhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSFgoGQWN0aXZlGAIgAS'
    'gIUgZBY3RpdmUSFgoGaGVpZ2h0GAMgASgNUgZoZWlnaHQSFAoFcm91bmQYBCABKAVSBXJvdW5k'
    'EiYKBXZvdGVzGAUgAygLMhAucGFjdHVzLlZvdGVJbmZvUgV2b3Rlcw==');

