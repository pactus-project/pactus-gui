//  Generated code. Do not modify.
//  source: wallet.proto
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

import 'wallet.pb.dart' as $1;

export 'wallet.pb.dart';

@$pb.GrpcServiceName('pactus.Wallet')
class WalletClient extends $grpc.Client {
  static final _$createWallet =
      $grpc.ClientMethod<$1.CreateWalletRequest, $1.CreateWalletResponse>(
          '/pactus.Wallet/CreateWallet',
          ($1.CreateWalletRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.CreateWalletResponse.fromBuffer(value));
  static final _$restoreWallet =
      $grpc.ClientMethod<$1.RestoreWalletRequest, $1.RestoreWalletResponse>(
          '/pactus.Wallet/RestoreWallet',
          ($1.RestoreWalletRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.RestoreWalletResponse.fromBuffer(value));
  static final _$loadWallet =
      $grpc.ClientMethod<$1.LoadWalletRequest, $1.LoadWalletResponse>(
          '/pactus.Wallet/LoadWallet',
          ($1.LoadWalletRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.LoadWalletResponse.fromBuffer(value));
  static final _$unloadWallet =
      $grpc.ClientMethod<$1.UnloadWalletRequest, $1.UnloadWalletResponse>(
          '/pactus.Wallet/UnloadWallet',
          ($1.UnloadWalletRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.UnloadWalletResponse.fromBuffer(value));
  static final _$getTotalBalance =
      $grpc.ClientMethod<$1.GetTotalBalanceRequest, $1.GetTotalBalanceResponse>(
          '/pactus.Wallet/GetTotalBalance',
          ($1.GetTotalBalanceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetTotalBalanceResponse.fromBuffer(value));
  static final _$signRawTransaction = $grpc.ClientMethod<
          $1.SignRawTransactionRequest, $1.SignRawTransactionResponse>(
      '/pactus.Wallet/SignRawTransaction',
      ($1.SignRawTransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.SignRawTransactionResponse.fromBuffer(value));
  static final _$getValidatorAddress = $grpc.ClientMethod<
          $1.GetValidatorAddressRequest, $1.GetValidatorAddressResponse>(
      '/pactus.Wallet/GetValidatorAddress',
      ($1.GetValidatorAddressRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetValidatorAddressResponse.fromBuffer(value));
  static final _$getNewAddress =
      $grpc.ClientMethod<$1.GetNewAddressRequest, $1.GetNewAddressResponse>(
          '/pactus.Wallet/GetNewAddress',
          ($1.GetNewAddressRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetNewAddressResponse.fromBuffer(value));
  static final _$getAddressHistory = $grpc.ClientMethod<
          $1.GetAddressHistoryRequest, $1.GetAddressHistoryResponse>(
      '/pactus.Wallet/GetAddressHistory',
      ($1.GetAddressHistoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetAddressHistoryResponse.fromBuffer(value));

  WalletClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.CreateWalletResponse> createWallet(
      $1.CreateWalletRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.RestoreWalletResponse> restoreWallet(
      $1.RestoreWalletRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$restoreWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.LoadWalletResponse> loadWallet(
      $1.LoadWalletRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loadWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.UnloadWalletResponse> unloadWallet(
      $1.UnloadWalletRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unloadWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetTotalBalanceResponse> getTotalBalance(
      $1.GetTotalBalanceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTotalBalance, request, options: options);
  }

  $grpc.ResponseFuture<$1.SignRawTransactionResponse> signRawTransaction(
      $1.SignRawTransactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signRawTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetValidatorAddressResponse> getValidatorAddress(
      $1.GetValidatorAddressRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getValidatorAddress, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetNewAddressResponse> getNewAddress(
      $1.GetNewAddressRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNewAddress, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetAddressHistoryResponse> getAddressHistory(
      $1.GetAddressHistoryRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAddressHistory, request, options: options);
  }
}

@$pb.GrpcServiceName('pactus.Wallet')
abstract class WalletServiceBase extends $grpc.Service {
  $core.String get $name => 'pactus.Wallet';

  WalletServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$1.CreateWalletRequest, $1.CreateWalletResponse>(
            'CreateWallet',
            createWallet_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.CreateWalletRequest.fromBuffer(value),
            ($1.CreateWalletResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.RestoreWalletRequest, $1.RestoreWalletResponse>(
            'RestoreWallet',
            restoreWallet_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.RestoreWalletRequest.fromBuffer(value),
            ($1.RestoreWalletResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LoadWalletRequest, $1.LoadWalletResponse>(
        'LoadWallet',
        loadWallet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LoadWalletRequest.fromBuffer(value),
        ($1.LoadWalletResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.UnloadWalletRequest, $1.UnloadWalletResponse>(
            'UnloadWallet',
            unloadWallet_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.UnloadWalletRequest.fromBuffer(value),
            ($1.UnloadWalletResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetTotalBalanceRequest,
            $1.GetTotalBalanceResponse>(
        'GetTotalBalance',
        getTotalBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetTotalBalanceRequest.fromBuffer(value),
        ($1.GetTotalBalanceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SignRawTransactionRequest,
            $1.SignRawTransactionResponse>(
        'SignRawTransaction',
        signRawTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.SignRawTransactionRequest.fromBuffer(value),
        ($1.SignRawTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetValidatorAddressRequest,
            $1.GetValidatorAddressResponse>(
        'GetValidatorAddress',
        getValidatorAddress_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetValidatorAddressRequest.fromBuffer(value),
        ($1.GetValidatorAddressResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetNewAddressRequest, $1.GetNewAddressResponse>(
            'GetNewAddress',
            getNewAddress_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.GetNewAddressRequest.fromBuffer(value),
            ($1.GetNewAddressResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetAddressHistoryRequest,
            $1.GetAddressHistoryResponse>(
        'GetAddressHistory',
        getAddressHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetAddressHistoryRequest.fromBuffer(value),
        ($1.GetAddressHistoryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.CreateWalletResponse> createWallet_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.CreateWalletRequest> request) async {
    return createWallet(call, await request);
  }

  $async.Future<$1.RestoreWalletResponse> restoreWallet_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RestoreWalletRequest> request) async {
    return restoreWallet(call, await request);
  }

  $async.Future<$1.LoadWalletResponse> loadWallet_Pre($grpc.ServiceCall call,
      $async.Future<$1.LoadWalletRequest> request) async {
    return loadWallet(call, await request);
  }

  $async.Future<$1.UnloadWalletResponse> unloadWallet_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.UnloadWalletRequest> request) async {
    return unloadWallet(call, await request);
  }

  $async.Future<$1.GetTotalBalanceResponse> getTotalBalance_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetTotalBalanceRequest> request) async {
    return getTotalBalance(call, await request);
  }

  $async.Future<$1.SignRawTransactionResponse> signRawTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.SignRawTransactionRequest> request) async {
    return signRawTransaction(call, await request);
  }

  $async.Future<$1.GetValidatorAddressResponse> getValidatorAddress_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetValidatorAddressRequest> request) async {
    return getValidatorAddress(call, await request);
  }

  $async.Future<$1.GetNewAddressResponse> getNewAddress_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetNewAddressRequest> request) async {
    return getNewAddress(call, await request);
  }

  $async.Future<$1.GetAddressHistoryResponse> getAddressHistory_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetAddressHistoryRequest> request) async {
    return getAddressHistory(call, await request);
  }

  $async.Future<$1.CreateWalletResponse> createWallet(
      $grpc.ServiceCall call, $1.CreateWalletRequest request);
  $async.Future<$1.RestoreWalletResponse> restoreWallet(
      $grpc.ServiceCall call, $1.RestoreWalletRequest request);
  $async.Future<$1.LoadWalletResponse> loadWallet(
      $grpc.ServiceCall call, $1.LoadWalletRequest request);
  $async.Future<$1.UnloadWalletResponse> unloadWallet(
      $grpc.ServiceCall call, $1.UnloadWalletRequest request);
  $async.Future<$1.GetTotalBalanceResponse> getTotalBalance(
      $grpc.ServiceCall call, $1.GetTotalBalanceRequest request);
  $async.Future<$1.SignRawTransactionResponse> signRawTransaction(
      $grpc.ServiceCall call, $1.SignRawTransactionRequest request);
  $async.Future<$1.GetValidatorAddressResponse> getValidatorAddress(
      $grpc.ServiceCall call, $1.GetValidatorAddressRequest request);
  $async.Future<$1.GetNewAddressResponse> getNewAddress(
      $grpc.ServiceCall call, $1.GetNewAddressRequest request);
  $async.Future<$1.GetAddressHistoryResponse> getAddressHistory(
      $grpc.ServiceCall call, $1.GetAddressHistoryRequest request);
}
