//
//  Generated code. Do not modify.
//  source: transaction.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use payloadTypeDescriptor instead')
const PayloadType$json = {
  '1': 'PayloadType',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'TRANSFER_PAYLOAD', '2': 1},
    {'1': 'BOND_PAYLOAD', '2': 2},
    {'1': 'SORTITION_PAYLOAD', '2': 3},
    {'1': 'UNBOND_PAYLOAD', '2': 4},
    {'1': 'WITHDRAW_PAYLOAD', '2': 5},
  ],
};

/// Descriptor for `PayloadType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List payloadTypeDescriptor = $convert.base64Decode(
    'CgtQYXlsb2FkVHlwZRILCgdVTktOT1dOEAASFAoQVFJBTlNGRVJfUEFZTE9BRBABEhAKDEJPTk'
    'RfUEFZTE9BRBACEhUKEVNPUlRJVElPTl9QQVlMT0FEEAMSEgoOVU5CT05EX1BBWUxPQUQQBBIU'
    'ChBXSVRIRFJBV19QQVlMT0FEEAU=');

@$core.Deprecated('Use transactionVerbosityDescriptor instead')
const TransactionVerbosity$json = {
  '1': 'TransactionVerbosity',
  '2': [
    {'1': 'TRANSACTION_DATA', '2': 0},
    {'1': 'TRANSACTION_INFO', '2': 1},
  ],
};

/// Descriptor for `TransactionVerbosity`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionVerbosityDescriptor = $convert.base64Decode(
    'ChRUcmFuc2FjdGlvblZlcmJvc2l0eRIUChBUUkFOU0FDVElPTl9EQVRBEAASFAoQVFJBTlNBQ1'
    'RJT05fSU5GTxAB');

@$core.Deprecated('Use getTransactionRequestDescriptor instead')
const GetTransactionRequest$json = {
  '1': 'GetTransactionRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'verbosity', '3': 2, '4': 1, '5': 14, '6': '.pactus.TransactionVerbosity', '10': 'verbosity'},
  ],
};

/// Descriptor for `GetTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionRequestDescriptor = $convert.base64Decode(
    'ChVHZXRUcmFuc2FjdGlvblJlcXVlc3QSDgoCaWQYASABKAxSAmlkEjoKCXZlcmJvc2l0eRgCIA'
    'EoDjIcLnBhY3R1cy5UcmFuc2FjdGlvblZlcmJvc2l0eVIJdmVyYm9zaXR5');

@$core.Deprecated('Use getTransactionResponseDescriptor instead')
const GetTransactionResponse$json = {
  '1': 'GetTransactionResponse',
  '2': [
    {'1': 'block_height', '3': 1, '4': 1, '5': 13, '10': 'blockHeight'},
    {'1': 'block_time', '3': 2, '4': 1, '5': 13, '10': 'blockTime'},
    {'1': 'transaction', '3': 3, '4': 1, '5': 11, '6': '.pactus.TransactionInfo', '10': 'transaction'},
  ],
};

/// Descriptor for `GetTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionResponseDescriptor = $convert.base64Decode(
    'ChZHZXRUcmFuc2FjdGlvblJlc3BvbnNlEiEKDGJsb2NrX2hlaWdodBgBIAEoDVILYmxvY2tIZW'
    'lnaHQSHQoKYmxvY2tfdGltZRgCIAEoDVIJYmxvY2tUaW1lEjkKC3RyYW5zYWN0aW9uGAMgASgL'
    'MhcucGFjdHVzLlRyYW5zYWN0aW9uSW5mb1ILdHJhbnNhY3Rpb24=');

@$core.Deprecated('Use calculateFeeRequestDescriptor instead')
const CalculateFeeRequest$json = {
  '1': 'CalculateFeeRequest',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'payload_type', '3': 2, '4': 1, '5': 14, '6': '.pactus.PayloadType', '10': 'payloadType'},
    {'1': 'fixed_amount', '3': 3, '4': 1, '5': 8, '10': 'fixedAmount'},
  ],
};

/// Descriptor for `CalculateFeeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calculateFeeRequestDescriptor = $convert.base64Decode(
    'ChNDYWxjdWxhdGVGZWVSZXF1ZXN0EhYKBmFtb3VudBgBIAEoA1IGYW1vdW50EjYKDHBheWxvYW'
    'RfdHlwZRgCIAEoDjITLnBhY3R1cy5QYXlsb2FkVHlwZVILcGF5bG9hZFR5cGUSIQoMZml4ZWRf'
    'YW1vdW50GAMgASgIUgtmaXhlZEFtb3VudA==');

@$core.Deprecated('Use calculateFeeResponseDescriptor instead')
const CalculateFeeResponse$json = {
  '1': 'CalculateFeeResponse',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'fee', '3': 2, '4': 1, '5': 3, '10': 'fee'},
  ],
};

/// Descriptor for `CalculateFeeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calculateFeeResponseDescriptor = $convert.base64Decode(
    'ChRDYWxjdWxhdGVGZWVSZXNwb25zZRIWCgZhbW91bnQYASABKANSBmFtb3VudBIQCgNmZWUYAi'
    'ABKANSA2ZlZQ==');

@$core.Deprecated('Use broadcastTransactionRequestDescriptor instead')
const BroadcastTransactionRequest$json = {
  '1': 'BroadcastTransactionRequest',
  '2': [
    {'1': 'signed_raw_transaction', '3': 1, '4': 1, '5': 12, '10': 'signedRawTransaction'},
  ],
};

/// Descriptor for `BroadcastTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionRequestDescriptor = $convert.base64Decode(
    'ChtCcm9hZGNhc3RUcmFuc2FjdGlvblJlcXVlc3QSNAoWc2lnbmVkX3Jhd190cmFuc2FjdGlvbh'
    'gBIAEoDFIUc2lnbmVkUmF3VHJhbnNhY3Rpb24=');

@$core.Deprecated('Use broadcastTransactionResponseDescriptor instead')
const BroadcastTransactionResponse$json = {
  '1': 'BroadcastTransactionResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

/// Descriptor for `BroadcastTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionResponseDescriptor = $convert.base64Decode(
    'ChxCcm9hZGNhc3RUcmFuc2FjdGlvblJlc3BvbnNlEg4KAmlkGAEgASgMUgJpZA==');

@$core.Deprecated('Use getRawTransferTransactionRequestDescriptor instead')
const GetRawTransferTransactionRequest$json = {
  '1': 'GetRawTransferTransactionRequest',
  '2': [
    {'1': 'lock_time', '3': 1, '4': 1, '5': 13, '10': 'lockTime'},
    {'1': 'sender', '3': 2, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'receiver', '3': 3, '4': 1, '5': 9, '10': 'receiver'},
    {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'fee', '3': 5, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'memo', '3': 6, '4': 1, '5': 9, '10': 'memo'},
  ],
};

/// Descriptor for `GetRawTransferTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRawTransferTransactionRequestDescriptor = $convert.base64Decode(
    'CiBHZXRSYXdUcmFuc2ZlclRyYW5zYWN0aW9uUmVxdWVzdBIbCglsb2NrX3RpbWUYASABKA1SCG'
    'xvY2tUaW1lEhYKBnNlbmRlchgCIAEoCVIGc2VuZGVyEhoKCHJlY2VpdmVyGAMgASgJUghyZWNl'
    'aXZlchIWCgZhbW91bnQYBCABKANSBmFtb3VudBIQCgNmZWUYBSABKANSA2ZlZRISCgRtZW1vGA'
    'YgASgJUgRtZW1v');

@$core.Deprecated('Use getRawBondTransactionRequestDescriptor instead')
const GetRawBondTransactionRequest$json = {
  '1': 'GetRawBondTransactionRequest',
  '2': [
    {'1': 'lock_time', '3': 1, '4': 1, '5': 13, '10': 'lockTime'},
    {'1': 'sender', '3': 2, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'receiver', '3': 3, '4': 1, '5': 9, '10': 'receiver'},
    {'1': 'stake', '3': 4, '4': 1, '5': 3, '10': 'stake'},
    {'1': 'public_key', '3': 5, '4': 1, '5': 9, '10': 'publicKey'},
    {'1': 'fee', '3': 6, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'memo', '3': 7, '4': 1, '5': 9, '10': 'memo'},
  ],
};

/// Descriptor for `GetRawBondTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRawBondTransactionRequestDescriptor = $convert.base64Decode(
    'ChxHZXRSYXdCb25kVHJhbnNhY3Rpb25SZXF1ZXN0EhsKCWxvY2tfdGltZRgBIAEoDVIIbG9ja1'
    'RpbWUSFgoGc2VuZGVyGAIgASgJUgZzZW5kZXISGgoIcmVjZWl2ZXIYAyABKAlSCHJlY2VpdmVy'
    'EhQKBXN0YWtlGAQgASgDUgVzdGFrZRIdCgpwdWJsaWNfa2V5GAUgASgJUglwdWJsaWNLZXkSEA'
    'oDZmVlGAYgASgDUgNmZWUSEgoEbWVtbxgHIAEoCVIEbWVtbw==');

@$core.Deprecated('Use getRawUnbondTransactionRequestDescriptor instead')
const GetRawUnbondTransactionRequest$json = {
  '1': 'GetRawUnbondTransactionRequest',
  '2': [
    {'1': 'lock_time', '3': 1, '4': 1, '5': 13, '10': 'lockTime'},
    {'1': 'validator_address', '3': 3, '4': 1, '5': 9, '10': 'validatorAddress'},
    {'1': 'memo', '3': 4, '4': 1, '5': 9, '10': 'memo'},
  ],
};

/// Descriptor for `GetRawUnbondTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRawUnbondTransactionRequestDescriptor = $convert.base64Decode(
    'Ch5HZXRSYXdVbmJvbmRUcmFuc2FjdGlvblJlcXVlc3QSGwoJbG9ja190aW1lGAEgASgNUghsb2'
    'NrVGltZRIrChF2YWxpZGF0b3JfYWRkcmVzcxgDIAEoCVIQdmFsaWRhdG9yQWRkcmVzcxISCgRt'
    'ZW1vGAQgASgJUgRtZW1v');

@$core.Deprecated('Use getRawWithdrawTransactionRequestDescriptor instead')
const GetRawWithdrawTransactionRequest$json = {
  '1': 'GetRawWithdrawTransactionRequest',
  '2': [
    {'1': 'lock_time', '3': 1, '4': 1, '5': 13, '10': 'lockTime'},
    {'1': 'validator_address', '3': 2, '4': 1, '5': 9, '10': 'validatorAddress'},
    {'1': 'account_address', '3': 3, '4': 1, '5': 9, '10': 'accountAddress'},
    {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'fee', '3': 5, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'memo', '3': 6, '4': 1, '5': 9, '10': 'memo'},
  ],
};

/// Descriptor for `GetRawWithdrawTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRawWithdrawTransactionRequestDescriptor = $convert.base64Decode(
    'CiBHZXRSYXdXaXRoZHJhd1RyYW5zYWN0aW9uUmVxdWVzdBIbCglsb2NrX3RpbWUYASABKA1SCG'
    'xvY2tUaW1lEisKEXZhbGlkYXRvcl9hZGRyZXNzGAIgASgJUhB2YWxpZGF0b3JBZGRyZXNzEicK'
    'D2FjY291bnRfYWRkcmVzcxgDIAEoCVIOYWNjb3VudEFkZHJlc3MSFgoGYW1vdW50GAQgASgDUg'
    'ZhbW91bnQSEAoDZmVlGAUgASgDUgNmZWUSEgoEbWVtbxgGIAEoCVIEbWVtbw==');

@$core.Deprecated('Use getRawTransactionResponseDescriptor instead')
const GetRawTransactionResponse$json = {
  '1': 'GetRawTransactionResponse',
  '2': [
    {'1': 'raw_transaction', '3': 1, '4': 1, '5': 12, '10': 'rawTransaction'},
  ],
};

/// Descriptor for `GetRawTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRawTransactionResponseDescriptor = $convert.base64Decode(
    'ChlHZXRSYXdUcmFuc2FjdGlvblJlc3BvbnNlEicKD3Jhd190cmFuc2FjdGlvbhgBIAEoDFIOcm'
    'F3VHJhbnNhY3Rpb24=');

@$core.Deprecated('Use payloadTransferDescriptor instead')
const PayloadTransfer$json = {
  '1': 'PayloadTransfer',
  '2': [
    {'1': 'sender', '3': 1, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `PayloadTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadTransferDescriptor = $convert.base64Decode(
    'Cg9QYXlsb2FkVHJhbnNmZXISFgoGc2VuZGVyGAEgASgJUgZzZW5kZXISGgoIcmVjZWl2ZXIYAi'
    'ABKAlSCHJlY2VpdmVyEhYKBmFtb3VudBgDIAEoA1IGYW1vdW50');

@$core.Deprecated('Use payloadBondDescriptor instead')
const PayloadBond$json = {
  '1': 'PayloadBond',
  '2': [
    {'1': 'sender', '3': 1, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    {'1': 'stake', '3': 3, '4': 1, '5': 3, '10': 'stake'},
  ],
};

/// Descriptor for `PayloadBond`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadBondDescriptor = $convert.base64Decode(
    'CgtQYXlsb2FkQm9uZBIWCgZzZW5kZXIYASABKAlSBnNlbmRlchIaCghyZWNlaXZlchgCIAEoCV'
    'IIcmVjZWl2ZXISFAoFc3Rha2UYAyABKANSBXN0YWtl');

@$core.Deprecated('Use payloadSortitionDescriptor instead')
const PayloadSortition$json = {
  '1': 'PayloadSortition',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'proof', '3': 2, '4': 1, '5': 12, '10': 'proof'},
  ],
};

/// Descriptor for `PayloadSortition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadSortitionDescriptor = $convert.base64Decode(
    'ChBQYXlsb2FkU29ydGl0aW9uEhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSFAoFcHJvb2YYAi'
    'ABKAxSBXByb29m');

@$core.Deprecated('Use payloadUnbondDescriptor instead')
const PayloadUnbond$json = {
  '1': 'PayloadUnbond',
  '2': [
    {'1': 'validator', '3': 1, '4': 1, '5': 9, '10': 'validator'},
  ],
};

/// Descriptor for `PayloadUnbond`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadUnbondDescriptor = $convert.base64Decode(
    'Cg1QYXlsb2FkVW5ib25kEhwKCXZhbGlkYXRvchgBIAEoCVIJdmFsaWRhdG9y');

@$core.Deprecated('Use payloadWithdrawDescriptor instead')
const PayloadWithdraw$json = {
  '1': 'PayloadWithdraw',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    {'1': 'to', '3': 2, '4': 1, '5': 9, '10': 'to'},
    {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `PayloadWithdraw`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadWithdrawDescriptor = $convert.base64Decode(
    'Cg9QYXlsb2FkV2l0aGRyYXcSEgoEZnJvbRgBIAEoCVIEZnJvbRIOCgJ0bxgCIAEoCVICdG8SFg'
    'oGYW1vdW50GAMgASgDUgZhbW91bnQ=');

@$core.Deprecated('Use transactionInfoDescriptor instead')
const TransactionInfo$json = {
  '1': 'TransactionInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
    {'1': 'version', '3': 3, '4': 1, '5': 5, '10': 'version'},
    {'1': 'lock_time', '3': 4, '4': 1, '5': 13, '10': 'lockTime'},
    {'1': 'value', '3': 5, '4': 1, '5': 3, '10': 'value'},
    {'1': 'fee', '3': 6, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'payload_type', '3': 7, '4': 1, '5': 14, '6': '.pactus.PayloadType', '10': 'payloadType'},
    {'1': 'transfer', '3': 30, '4': 1, '5': 11, '6': '.pactus.PayloadTransfer', '9': 0, '10': 'transfer'},
    {'1': 'bond', '3': 31, '4': 1, '5': 11, '6': '.pactus.PayloadBond', '9': 0, '10': 'bond'},
    {'1': 'sortition', '3': 32, '4': 1, '5': 11, '6': '.pactus.PayloadSortition', '9': 0, '10': 'sortition'},
    {'1': 'unbond', '3': 33, '4': 1, '5': 11, '6': '.pactus.PayloadUnbond', '9': 0, '10': 'unbond'},
    {'1': 'withdraw', '3': 34, '4': 1, '5': 11, '6': '.pactus.PayloadWithdraw', '9': 0, '10': 'withdraw'},
    {'1': 'memo', '3': 8, '4': 1, '5': 9, '10': 'memo'},
    {'1': 'public_key', '3': 9, '4': 1, '5': 9, '10': 'publicKey'},
    {'1': 'signature', '3': 10, '4': 1, '5': 12, '10': 'signature'},
  ],
  '8': [
    {'1': 'payload'},
  ],
};

/// Descriptor for `TransactionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionInfoDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvbkluZm8SDgoCaWQYASABKAxSAmlkEhIKBGRhdGEYAiABKAxSBGRhdGESGA'
    'oHdmVyc2lvbhgDIAEoBVIHdmVyc2lvbhIbCglsb2NrX3RpbWUYBCABKA1SCGxvY2tUaW1lEhQK'
    'BXZhbHVlGAUgASgDUgV2YWx1ZRIQCgNmZWUYBiABKANSA2ZlZRI2CgxwYXlsb2FkX3R5cGUYBy'
    'ABKA4yEy5wYWN0dXMuUGF5bG9hZFR5cGVSC3BheWxvYWRUeXBlEjUKCHRyYW5zZmVyGB4gASgL'
    'MhcucGFjdHVzLlBheWxvYWRUcmFuc2ZlckgAUgh0cmFuc2ZlchIpCgRib25kGB8gASgLMhMucG'
    'FjdHVzLlBheWxvYWRCb25kSABSBGJvbmQSOAoJc29ydGl0aW9uGCAgASgLMhgucGFjdHVzLlBh'
    'eWxvYWRTb3J0aXRpb25IAFIJc29ydGl0aW9uEi8KBnVuYm9uZBghIAEoCzIVLnBhY3R1cy5QYX'
    'lsb2FkVW5ib25kSABSBnVuYm9uZBI1Cgh3aXRoZHJhdxgiIAEoCzIXLnBhY3R1cy5QYXlsb2Fk'
    'V2l0aGRyYXdIAFIId2l0aGRyYXcSEgoEbWVtbxgIIAEoCVIEbWVtbxIdCgpwdWJsaWNfa2V5GA'
    'kgASgJUglwdWJsaWNLZXkSHAoJc2lnbmF0dXJlGAogASgMUglzaWduYXR1cmVCCQoHcGF5bG9h'
    'ZA==');

