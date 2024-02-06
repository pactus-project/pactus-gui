//
//  Generated code. Do not modify.
//  source: wallet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createWalletRequestDescriptor instead')
const CreateWalletRequest$json = {
  '1': 'CreateWalletRequest',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
    {'1': 'mnemonic', '3': 2, '4': 1, '5': 9, '10': 'mnemonic'},
    {'1': 'language', '3': 3, '4': 1, '5': 9, '10': 'language'},
    {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `CreateWalletRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createWalletRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVXYWxsZXRSZXF1ZXN0Eh8KC3dhbGxldF9uYW1lGAEgASgJUgp3YWxsZXROYW1lEh'
    'oKCG1uZW1vbmljGAIgASgJUghtbmVtb25pYxIaCghsYW5ndWFnZRgDIAEoCVIIbGFuZ3VhZ2US'
    'GgoIcGFzc3dvcmQYBCABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use createWalletResponseDescriptor instead')
const CreateWalletResponse$json = {
  '1': 'CreateWalletResponse',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
  ],
};

/// Descriptor for `CreateWalletResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createWalletResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVXYWxsZXRSZXNwb25zZRIfCgt3YWxsZXRfbmFtZRgBIAEoCVIKd2FsbGV0TmFtZQ'
    '==');

@$core.Deprecated('Use loadWalletRequestDescriptor instead')
const LoadWalletRequest$json = {
  '1': 'LoadWalletRequest',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
  ],
};

/// Descriptor for `LoadWalletRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadWalletRequestDescriptor = $convert.base64Decode(
    'ChFMb2FkV2FsbGV0UmVxdWVzdBIfCgt3YWxsZXRfbmFtZRgBIAEoCVIKd2FsbGV0TmFtZQ==');

@$core.Deprecated('Use loadWalletResponseDescriptor instead')
const LoadWalletResponse$json = {
  '1': 'LoadWalletResponse',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
  ],
};

/// Descriptor for `LoadWalletResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadWalletResponseDescriptor = $convert.base64Decode(
    'ChJMb2FkV2FsbGV0UmVzcG9uc2USHwoLd2FsbGV0X25hbWUYASABKAlSCndhbGxldE5hbWU=');

@$core.Deprecated('Use unloadWalletRequestDescriptor instead')
const UnloadWalletRequest$json = {
  '1': 'UnloadWalletRequest',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
  ],
};

/// Descriptor for `UnloadWalletRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unloadWalletRequestDescriptor = $convert.base64Decode(
    'ChNVbmxvYWRXYWxsZXRSZXF1ZXN0Eh8KC3dhbGxldF9uYW1lGAEgASgJUgp3YWxsZXROYW1l');

@$core.Deprecated('Use unloadWalletResponseDescriptor instead')
const UnloadWalletResponse$json = {
  '1': 'UnloadWalletResponse',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
  ],
};

/// Descriptor for `UnloadWalletResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unloadWalletResponseDescriptor = $convert.base64Decode(
    'ChRVbmxvYWRXYWxsZXRSZXNwb25zZRIfCgt3YWxsZXRfbmFtZRgBIAEoCVIKd2FsbGV0TmFtZQ'
    '==');

@$core.Deprecated('Use lockWalletRequestDescriptor instead')
const LockWalletRequest$json = {
  '1': 'LockWalletRequest',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
  ],
};

/// Descriptor for `LockWalletRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lockWalletRequestDescriptor = $convert.base64Decode(
    'ChFMb2NrV2FsbGV0UmVxdWVzdBIfCgt3YWxsZXRfbmFtZRgBIAEoCVIKd2FsbGV0TmFtZQ==');

@$core.Deprecated('Use lockWalletResponseDescriptor instead')
const LockWalletResponse$json = {
  '1': 'LockWalletResponse',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
  ],
};

/// Descriptor for `LockWalletResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lockWalletResponseDescriptor = $convert.base64Decode(
    'ChJMb2NrV2FsbGV0UmVzcG9uc2USHwoLd2FsbGV0X25hbWUYASABKAlSCndhbGxldE5hbWU=');

@$core.Deprecated('Use getValidatorAddressRequestDescriptor instead')
const GetValidatorAddressRequest$json = {
  '1': 'GetValidatorAddressRequest',
  '2': [
    {'1': 'public_key', '3': 1, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

/// Descriptor for `GetValidatorAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getValidatorAddressRequestDescriptor = $convert.base64Decode(
    'ChpHZXRWYWxpZGF0b3JBZGRyZXNzUmVxdWVzdBIdCgpwdWJsaWNfa2V5GAEgASgJUglwdWJsaW'
    'NLZXk=');

@$core.Deprecated('Use getValidatorAddressResponseDescriptor instead')
const GetValidatorAddressResponse$json = {
  '1': 'GetValidatorAddressResponse',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `GetValidatorAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getValidatorAddressResponseDescriptor = $convert.base64Decode(
    'ChtHZXRWYWxpZGF0b3JBZGRyZXNzUmVzcG9uc2USGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcw'
    '==');

@$core.Deprecated('Use unlockWalletRequestDescriptor instead')
const UnlockWalletRequest$json = {
  '1': 'UnlockWalletRequest',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'timeout', '3': 3, '4': 1, '5': 5, '10': 'timeout'},
  ],
};

/// Descriptor for `UnlockWalletRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unlockWalletRequestDescriptor = $convert.base64Decode(
    'ChNVbmxvY2tXYWxsZXRSZXF1ZXN0Eh8KC3dhbGxldF9uYW1lGAEgASgJUgp3YWxsZXROYW1lEh'
    'oKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZBIYCgd0aW1lb3V0GAMgASgFUgd0aW1lb3V0');

@$core.Deprecated('Use unlockWalletResponseDescriptor instead')
const UnlockWalletResponse$json = {
  '1': 'UnlockWalletResponse',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
  ],
};

/// Descriptor for `UnlockWalletResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unlockWalletResponseDescriptor = $convert.base64Decode(
    'ChRVbmxvY2tXYWxsZXRSZXNwb25zZRIfCgt3YWxsZXRfbmFtZRgBIAEoCVIKd2FsbGV0TmFtZQ'
    '==');

@$core.Deprecated('Use signRawTransactionRequestDescriptor instead')
const SignRawTransactionRequest$json = {
  '1': 'SignRawTransactionRequest',
  '2': [
    {'1': 'wallet_name', '3': 1, '4': 1, '5': 9, '10': 'walletName'},
    {'1': 'raw_transaction', '3': 2, '4': 1, '5': 12, '10': 'rawTransaction'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `SignRawTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signRawTransactionRequestDescriptor = $convert.base64Decode(
    'ChlTaWduUmF3VHJhbnNhY3Rpb25SZXF1ZXN0Eh8KC3dhbGxldF9uYW1lGAEgASgJUgp3YWxsZX'
    'ROYW1lEicKD3Jhd190cmFuc2FjdGlvbhgCIAEoDFIOcmF3VHJhbnNhY3Rpb24SGgoIcGFzc3dv'
    'cmQYAyABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use signRawTransactionResponseDescriptor instead')
const SignRawTransactionResponse$json = {
  '1': 'SignRawTransactionResponse',
  '2': [
    {'1': 'transaction_id', '3': 1, '4': 1, '5': 12, '10': 'transactionId'},
    {'1': 'signed_raw_transaction', '3': 2, '4': 1, '5': 12, '10': 'signedRawTransaction'},
  ],
};

/// Descriptor for `SignRawTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signRawTransactionResponseDescriptor = $convert.base64Decode(
    'ChpTaWduUmF3VHJhbnNhY3Rpb25SZXNwb25zZRIlCg50cmFuc2FjdGlvbl9pZBgBIAEoDFINdH'
    'JhbnNhY3Rpb25JZBI0ChZzaWduZWRfcmF3X3RyYW5zYWN0aW9uGAIgASgMUhRzaWduZWRSYXdU'
    'cmFuc2FjdGlvbg==');

