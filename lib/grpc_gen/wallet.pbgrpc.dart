//
//  Generated code. Do not modify.
//  source: wallet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wallet.pb.dart' as $1;

export 'wallet.pb.dart';

@$pb.GrpcServiceName('pactus.Wallet')
class WalletClient extends $grpc.Client {
  static final _$createWallet = $grpc.ClientMethod<$1.CreateWalletRequest, $1.CreateWalletResponse>(
      '/pactus.Wallet/CreateWallet',
      ($1.CreateWalletRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CreateWalletResponse.fromBuffer(value));
  static final _$loadWallet = $grpc.ClientMethod<$1.LoadWalletRequest, $1.LoadWalletResponse>(
      '/pactus.Wallet/LoadWallet',
      ($1.LoadWalletRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.LoadWalletResponse.fromBuffer(value));
  static final _$unloadWallet = $grpc.ClientMethod<$1.UnloadWalletRequest, $1.UnloadWalletResponse>(
      '/pactus.Wallet/UnloadWallet',
      ($1.UnloadWalletRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UnloadWalletResponse.fromBuffer(value));
  static final _$lockWallet = $grpc.ClientMethod<$1.LockWalletRequest, $1.LockWalletResponse>(
      '/pactus.Wallet/LockWallet',
      ($1.LockWalletRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.LockWalletResponse.fromBuffer(value));
  static final _$unlockWallet = $grpc.ClientMethod<$1.UnlockWalletRequest, $1.UnlockWalletResponse>(
      '/pactus.Wallet/UnlockWallet',
      ($1.UnlockWalletRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UnlockWalletResponse.fromBuffer(value));
  static final _$signRawTransaction = $grpc.ClientMethod<$1.SignRawTransactionRequest, $1.SignRawTransactionResponse>(
      '/pactus.Wallet/SignRawTransaction',
      ($1.SignRawTransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SignRawTransactionResponse.fromBuffer(value));
  static final _$getValidatorAddress = $grpc.ClientMethod<$1.GetValidatorAddressRequest, $1.GetValidatorAddressResponse>(
      '/pactus.Wallet/GetValidatorAddress',
      ($1.GetValidatorAddressRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetValidatorAddressResponse.fromBuffer(value));

  WalletClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.CreateWalletResponse> createWallet($1.CreateWalletRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.LoadWalletResponse> loadWallet($1.LoadWalletRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loadWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.UnloadWalletResponse> unloadWallet($1.UnloadWalletRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unloadWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.LockWalletResponse> lockWallet($1.LockWalletRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lockWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.UnlockWalletResponse> unlockWallet($1.UnlockWalletRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unlockWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.SignRawTransactionResponse> signRawTransaction($1.SignRawTransactionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signRawTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetValidatorAddressResponse> getValidatorAddress($1.GetValidatorAddressRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getValidatorAddress, request, options: options);
  }
}

@$pb.GrpcServiceName('pactus.Wallet')
abstract class WalletServiceBase extends $grpc.Service {
  $core.String get $name => 'pactus.Wallet';

  WalletServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CreateWalletRequest, $1.CreateWalletResponse>(
        'CreateWallet',
        createWallet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateWalletRequest.fromBuffer(value),
        ($1.CreateWalletResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LoadWalletRequest, $1.LoadWalletResponse>(
        'LoadWallet',
        loadWallet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LoadWalletRequest.fromBuffer(value),
        ($1.LoadWalletResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UnloadWalletRequest, $1.UnloadWalletResponse>(
        'UnloadWallet',
        unloadWallet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UnloadWalletRequest.fromBuffer(value),
        ($1.UnloadWalletResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LockWalletRequest, $1.LockWalletResponse>(
        'LockWallet',
        lockWallet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LockWalletRequest.fromBuffer(value),
        ($1.LockWalletResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UnlockWalletRequest, $1.UnlockWalletResponse>(
        'UnlockWallet',
        unlockWallet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UnlockWalletRequest.fromBuffer(value),
        ($1.UnlockWalletResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SignRawTransactionRequest, $1.SignRawTransactionResponse>(
        'SignRawTransaction',
        signRawTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SignRawTransactionRequest.fromBuffer(value),
        ($1.SignRawTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetValidatorAddressRequest, $1.GetValidatorAddressResponse>(
        'GetValidatorAddress',
        getValidatorAddress_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetValidatorAddressRequest.fromBuffer(value),
        ($1.GetValidatorAddressResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.CreateWalletResponse> createWallet_Pre($grpc.ServiceCall call, $async.Future<$1.CreateWalletRequest> request) async {
    return createWallet(call, await request);
  }

  $async.Future<$1.LoadWalletResponse> loadWallet_Pre($grpc.ServiceCall call, $async.Future<$1.LoadWalletRequest> request) async {
    return loadWallet(call, await request);
  }

  $async.Future<$1.UnloadWalletResponse> unloadWallet_Pre($grpc.ServiceCall call, $async.Future<$1.UnloadWalletRequest> request) async {
    return unloadWallet(call, await request);
  }

  $async.Future<$1.LockWalletResponse> lockWallet_Pre($grpc.ServiceCall call, $async.Future<$1.LockWalletRequest> request) async {
    return lockWallet(call, await request);
  }

  $async.Future<$1.UnlockWalletResponse> unlockWallet_Pre($grpc.ServiceCall call, $async.Future<$1.UnlockWalletRequest> request) async {
    return unlockWallet(call, await request);
  }

  $async.Future<$1.SignRawTransactionResponse> signRawTransaction_Pre($grpc.ServiceCall call, $async.Future<$1.SignRawTransactionRequest> request) async {
    return signRawTransaction(call, await request);
  }

  $async.Future<$1.GetValidatorAddressResponse> getValidatorAddress_Pre($grpc.ServiceCall call, $async.Future<$1.GetValidatorAddressRequest> request) async {
    return getValidatorAddress(call, await request);
  }

  $async.Future<$1.CreateWalletResponse> createWallet($grpc.ServiceCall call, $1.CreateWalletRequest request);
  $async.Future<$1.LoadWalletResponse> loadWallet($grpc.ServiceCall call, $1.LoadWalletRequest request);
  $async.Future<$1.UnloadWalletResponse> unloadWallet($grpc.ServiceCall call, $1.UnloadWalletRequest request);
  $async.Future<$1.LockWalletResponse> lockWallet($grpc.ServiceCall call, $1.LockWalletRequest request);
  $async.Future<$1.UnlockWalletResponse> unlockWallet($grpc.ServiceCall call, $1.UnlockWalletRequest request);
  $async.Future<$1.SignRawTransactionResponse> signRawTransaction($grpc.ServiceCall call, $1.SignRawTransactionRequest request);
  $async.Future<$1.GetValidatorAddressResponse> getValidatorAddress($grpc.ServiceCall call, $1.GetValidatorAddressRequest request);
}
