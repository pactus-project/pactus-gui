//  Generated code. Do not modify.
//  source: blockchain.proto
// @dart = 2.12
// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: require_trailing_commas
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: prefer_constructors_over_static_methods
// ignore_for_file: sort_unnamed_constructors_first
// ignore_for_file: sort_constructors_first
// ignore_for_file: prefer_final_locals

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'blockchain.pb.dart' as $1;

export 'blockchain.pb.dart';

@$pb.GrpcServiceName('pactus.Blockchain')
class BlockchainClient extends $grpc.Client {
  static final _$getBlock =
      $grpc.ClientMethod<$1.GetBlockRequest, $1.GetBlockResponse>(
          '/pactus.Blockchain/GetBlock',
          ($1.GetBlockRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetBlockResponse.fromBuffer(value));
  static final _$getBlockHash =
      $grpc.ClientMethod<$1.GetBlockHashRequest, $1.GetBlockHashResponse>(
          '/pactus.Blockchain/GetBlockHash',
          ($1.GetBlockHashRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetBlockHashResponse.fromBuffer(value));
  static final _$getBlockHeight =
      $grpc.ClientMethod<$1.GetBlockHeightRequest, $1.GetBlockHeightResponse>(
          '/pactus.Blockchain/GetBlockHeight',
          ($1.GetBlockHeightRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetBlockHeightResponse.fromBuffer(value));
  static final _$getBlockchainInfo = $grpc.ClientMethod<
          $1.GetBlockchainInfoRequest, $1.GetBlockchainInfoResponse>(
      '/pactus.Blockchain/GetBlockchainInfo',
      ($1.GetBlockchainInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetBlockchainInfoResponse.fromBuffer(value));
  static final _$getConsensusInfo = $grpc.ClientMethod<
          $1.GetConsensusInfoRequest, $1.GetConsensusInfoResponse>(
      '/pactus.Blockchain/GetConsensusInfo',
      ($1.GetConsensusInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetConsensusInfoResponse.fromBuffer(value));
  static final _$getAccount =
      $grpc.ClientMethod<$1.GetAccountRequest, $1.GetAccountResponse>(
          '/pactus.Blockchain/GetAccount',
          ($1.GetAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetAccountResponse.fromBuffer(value));
  static final _$getValidator =
      $grpc.ClientMethod<$1.GetValidatorRequest, $1.GetValidatorResponse>(
          '/pactus.Blockchain/GetValidator',
          ($1.GetValidatorRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetValidatorResponse.fromBuffer(value));
  static final _$getValidatorByNumber = $grpc.ClientMethod<
          $1.GetValidatorByNumberRequest, $1.GetValidatorResponse>(
      '/pactus.Blockchain/GetValidatorByNumber',
      ($1.GetValidatorByNumberRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetValidatorResponse.fromBuffer(value));
  static final _$getValidatorAddresses = $grpc.ClientMethod<
          $1.GetValidatorAddressesRequest, $1.GetValidatorAddressesResponse>(
      '/pactus.Blockchain/GetValidatorAddresses',
      ($1.GetValidatorAddressesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetValidatorAddressesResponse.fromBuffer(value));
  static final _$getPublicKey =
      $grpc.ClientMethod<$1.GetPublicKeyRequest, $1.GetPublicKeyResponse>(
          '/pactus.Blockchain/GetPublicKey',
          ($1.GetPublicKeyRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetPublicKeyResponse.fromBuffer(value));

  BlockchainClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.GetBlockResponse> getBlock($1.GetBlockRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlock, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetBlockHashResponse> getBlockHash(
      $1.GetBlockHashRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockHash, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetBlockHeightResponse> getBlockHeight(
      $1.GetBlockHeightRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockHeight, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetBlockchainInfoResponse> getBlockchainInfo(
      $1.GetBlockchainInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockchainInfo, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetConsensusInfoResponse> getConsensusInfo(
      $1.GetConsensusInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getConsensusInfo, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetAccountResponse> getAccount(
      $1.GetAccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccount, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetValidatorResponse> getValidator(
      $1.GetValidatorRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getValidator, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetValidatorResponse> getValidatorByNumber(
      $1.GetValidatorByNumberRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getValidatorByNumber, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetValidatorAddressesResponse> getValidatorAddresses(
      $1.GetValidatorAddressesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getValidatorAddresses, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetPublicKeyResponse> getPublicKey(
      $1.GetPublicKeyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPublicKey, request, options: options);
  }
}

@$pb.GrpcServiceName('pactus.Blockchain')
abstract class BlockchainServiceBase extends $grpc.Service {
  $core.String get $name => 'pactus.Blockchain';

  BlockchainServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.GetBlockRequest, $1.GetBlockResponse>(
        'GetBlock',
        getBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetBlockRequest.fromBuffer(value),
        ($1.GetBlockResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetBlockHashRequest, $1.GetBlockHashResponse>(
            'GetBlockHash',
            getBlockHash_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.GetBlockHashRequest.fromBuffer(value),
            ($1.GetBlockHashResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetBlockHeightRequest,
            $1.GetBlockHeightResponse>(
        'GetBlockHeight',
        getBlockHeight_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetBlockHeightRequest.fromBuffer(value),
        ($1.GetBlockHeightResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetBlockchainInfoRequest,
            $1.GetBlockchainInfoResponse>(
        'GetBlockchainInfo',
        getBlockchainInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetBlockchainInfoRequest.fromBuffer(value),
        ($1.GetBlockchainInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetConsensusInfoRequest,
            $1.GetConsensusInfoResponse>(
        'GetConsensusInfo',
        getConsensusInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetConsensusInfoRequest.fromBuffer(value),
        ($1.GetConsensusInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetAccountRequest, $1.GetAccountResponse>(
        'GetAccount',
        getAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetAccountRequest.fromBuffer(value),
        ($1.GetAccountResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetValidatorRequest, $1.GetValidatorResponse>(
            'GetValidator',
            getValidator_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.GetValidatorRequest.fromBuffer(value),
            ($1.GetValidatorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetValidatorByNumberRequest,
            $1.GetValidatorResponse>(
        'GetValidatorByNumber',
        getValidatorByNumber_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetValidatorByNumberRequest.fromBuffer(value),
        ($1.GetValidatorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetValidatorAddressesRequest,
            $1.GetValidatorAddressesResponse>(
        'GetValidatorAddresses',
        getValidatorAddresses_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetValidatorAddressesRequest.fromBuffer(value),
        ($1.GetValidatorAddressesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetPublicKeyRequest, $1.GetPublicKeyResponse>(
            'GetPublicKey',
            getPublicKey_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.GetPublicKeyRequest.fromBuffer(value),
            ($1.GetPublicKeyResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetBlockResponse> getBlock_Pre(
      $grpc.ServiceCall call, $async.Future<$1.GetBlockRequest> request) async {
    return getBlock(call, await request);
  }

  $async.Future<$1.GetBlockHashResponse> getBlockHash_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetBlockHashRequest> request) async {
    return getBlockHash(call, await request);
  }

  $async.Future<$1.GetBlockHeightResponse> getBlockHeight_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetBlockHeightRequest> request) async {
    return getBlockHeight(call, await request);
  }

  $async.Future<$1.GetBlockchainInfoResponse> getBlockchainInfo_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetBlockchainInfoRequest> request) async {
    return getBlockchainInfo(call, await request);
  }

  $async.Future<$1.GetConsensusInfoResponse> getConsensusInfo_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetConsensusInfoRequest> request) async {
    return getConsensusInfo(call, await request);
  }

  $async.Future<$1.GetAccountResponse> getAccount_Pre($grpc.ServiceCall call,
      $async.Future<$1.GetAccountRequest> request) async {
    return getAccount(call, await request);
  }

  $async.Future<$1.GetValidatorResponse> getValidator_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetValidatorRequest> request) async {
    return getValidator(call, await request);
  }

  $async.Future<$1.GetValidatorResponse> getValidatorByNumber_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetValidatorByNumberRequest> request) async {
    return getValidatorByNumber(call, await request);
  }

  $async.Future<$1.GetValidatorAddressesResponse> getValidatorAddresses_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetValidatorAddressesRequest> request) async {
    return getValidatorAddresses(call, await request);
  }

  $async.Future<$1.GetPublicKeyResponse> getPublicKey_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetPublicKeyRequest> request) async {
    return getPublicKey(call, await request);
  }

  $async.Future<$1.GetBlockResponse> getBlock(
      $grpc.ServiceCall call, $1.GetBlockRequest request);
  $async.Future<$1.GetBlockHashResponse> getBlockHash(
      $grpc.ServiceCall call, $1.GetBlockHashRequest request);
  $async.Future<$1.GetBlockHeightResponse> getBlockHeight(
      $grpc.ServiceCall call, $1.GetBlockHeightRequest request);
  $async.Future<$1.GetBlockchainInfoResponse> getBlockchainInfo(
      $grpc.ServiceCall call, $1.GetBlockchainInfoRequest request);
  $async.Future<$1.GetConsensusInfoResponse> getConsensusInfo(
      $grpc.ServiceCall call, $1.GetConsensusInfoRequest request);
  $async.Future<$1.GetAccountResponse> getAccount(
      $grpc.ServiceCall call, $1.GetAccountRequest request);
  $async.Future<$1.GetValidatorResponse> getValidator(
      $grpc.ServiceCall call, $1.GetValidatorRequest request);
  $async.Future<$1.GetValidatorResponse> getValidatorByNumber(
      $grpc.ServiceCall call, $1.GetValidatorByNumberRequest request);
  $async.Future<$1.GetValidatorAddressesResponse> getValidatorAddresses(
      $grpc.ServiceCall call, $1.GetValidatorAddressesRequest request);
  $async.Future<$1.GetPublicKeyResponse> getPublicKey(
      $grpc.ServiceCall call, $1.GetPublicKeyRequest request);
}
