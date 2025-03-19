//  Generated code. Do not modify.
//  source: transaction.proto
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

import 'transaction.pb.dart' as $0;

export 'transaction.pb.dart';

@$pb.GrpcServiceName('pactus.Transaction')
class TransactionClient extends $grpc.Client {
  static final _$getTransaction =
      $grpc.ClientMethod<$0.GetTransactionRequest, $0.GetTransactionResponse>(
          '/pactus.Transaction/GetTransaction',
          ($0.GetTransactionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetTransactionResponse.fromBuffer(value));
  static final _$calculateFee =
      $grpc.ClientMethod<$0.CalculateFeeRequest, $0.CalculateFeeResponse>(
          '/pactus.Transaction/CalculateFee',
          ($0.CalculateFeeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CalculateFeeResponse.fromBuffer(value));
  static final _$broadcastTransaction = $grpc.ClientMethod<
          $0.BroadcastTransactionRequest, $0.BroadcastTransactionResponse>(
      '/pactus.Transaction/BroadcastTransaction',
      ($0.BroadcastTransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.BroadcastTransactionResponse.fromBuffer(value));
  static final _$getRawTransferTransaction = $grpc.ClientMethod<
          $0.GetRawTransferTransactionRequest, $0.GetRawTransactionResponse>(
      '/pactus.Transaction/GetRawTransferTransaction',
      ($0.GetRawTransferTransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetRawTransactionResponse.fromBuffer(value));
  static final _$getRawBondTransaction = $grpc.ClientMethod<
          $0.GetRawBondTransactionRequest, $0.GetRawTransactionResponse>(
      '/pactus.Transaction/GetRawBondTransaction',
      ($0.GetRawBondTransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetRawTransactionResponse.fromBuffer(value));
  static final _$getRawUnbondTransaction = $grpc.ClientMethod<
          $0.GetRawUnbondTransactionRequest, $0.GetRawTransactionResponse>(
      '/pactus.Transaction/GetRawUnbondTransaction',
      ($0.GetRawUnbondTransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetRawTransactionResponse.fromBuffer(value));
  static final _$getRawWithdrawTransaction = $grpc.ClientMethod<
          $0.GetRawWithdrawTransactionRequest, $0.GetRawTransactionResponse>(
      '/pactus.Transaction/GetRawWithdrawTransaction',
      ($0.GetRawWithdrawTransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetRawTransactionResponse.fromBuffer(value));

  TransactionClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetTransactionResponse> getTransaction(
      $0.GetTransactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$0.CalculateFeeResponse> calculateFee(
      $0.CalculateFeeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$calculateFee, request, options: options);
  }

  $grpc.ResponseFuture<$0.BroadcastTransactionResponse> broadcastTransaction(
      $0.BroadcastTransactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$broadcastTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRawTransactionResponse> getRawTransferTransaction(
      $0.GetRawTransferTransactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRawTransferTransaction, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetRawTransactionResponse> getRawBondTransaction(
      $0.GetRawBondTransactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRawBondTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRawTransactionResponse> getRawUnbondTransaction(
      $0.GetRawUnbondTransactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRawUnbondTransaction, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetRawTransactionResponse> getRawWithdrawTransaction(
      $0.GetRawWithdrawTransactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRawWithdrawTransaction, request,
        options: options);
  }
}

@$pb.GrpcServiceName('pactus.Transaction')
abstract class TransactionServiceBase extends $grpc.Service {
  $core.String get $name => 'pactus.Transaction';

  TransactionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetTransactionRequest,
            $0.GetTransactionResponse>(
        'GetTransaction',
        getTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetTransactionRequest.fromBuffer(value),
        ($0.GetTransactionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CalculateFeeRequest, $0.CalculateFeeResponse>(
            'CalculateFee',
            calculateFee_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CalculateFeeRequest.fromBuffer(value),
            ($0.CalculateFeeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BroadcastTransactionRequest,
            $0.BroadcastTransactionResponse>(
        'BroadcastTransaction',
        broadcastTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.BroadcastTransactionRequest.fromBuffer(value),
        ($0.BroadcastTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRawTransferTransactionRequest,
            $0.GetRawTransactionResponse>(
        'GetRawTransferTransaction',
        getRawTransferTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetRawTransferTransactionRequest.fromBuffer(value),
        ($0.GetRawTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRawBondTransactionRequest,
            $0.GetRawTransactionResponse>(
        'GetRawBondTransaction',
        getRawBondTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetRawBondTransactionRequest.fromBuffer(value),
        ($0.GetRawTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRawUnbondTransactionRequest,
            $0.GetRawTransactionResponse>(
        'GetRawUnbondTransaction',
        getRawUnbondTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetRawUnbondTransactionRequest.fromBuffer(value),
        ($0.GetRawTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRawWithdrawTransactionRequest,
            $0.GetRawTransactionResponse>(
        'GetRawWithdrawTransaction',
        getRawWithdrawTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetRawWithdrawTransactionRequest.fromBuffer(value),
        ($0.GetRawTransactionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetTransactionResponse> getTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetTransactionRequest> request) async {
    return getTransaction(call, await request);
  }

  $async.Future<$0.CalculateFeeResponse> calculateFee_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CalculateFeeRequest> request) async {
    return calculateFee(call, await request);
  }

  $async.Future<$0.BroadcastTransactionResponse> broadcastTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.BroadcastTransactionRequest> request) async {
    return broadcastTransaction(call, await request);
  }

  $async.Future<$0.GetRawTransactionResponse> getRawTransferTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetRawTransferTransactionRequest> request) async {
    return getRawTransferTransaction(call, await request);
  }

  $async.Future<$0.GetRawTransactionResponse> getRawBondTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetRawBondTransactionRequest> request) async {
    return getRawBondTransaction(call, await request);
  }

  $async.Future<$0.GetRawTransactionResponse> getRawUnbondTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetRawUnbondTransactionRequest> request) async {
    return getRawUnbondTransaction(call, await request);
  }

  $async.Future<$0.GetRawTransactionResponse> getRawWithdrawTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetRawWithdrawTransactionRequest> request) async {
    return getRawWithdrawTransaction(call, await request);
  }

  $async.Future<$0.GetTransactionResponse> getTransaction(
      $grpc.ServiceCall call, $0.GetTransactionRequest request);
  $async.Future<$0.CalculateFeeResponse> calculateFee(
      $grpc.ServiceCall call, $0.CalculateFeeRequest request);
  $async.Future<$0.BroadcastTransactionResponse> broadcastTransaction(
      $grpc.ServiceCall call, $0.BroadcastTransactionRequest request);
  $async.Future<$0.GetRawTransactionResponse> getRawTransferTransaction(
      $grpc.ServiceCall call, $0.GetRawTransferTransactionRequest request);
  $async.Future<$0.GetRawTransactionResponse> getRawBondTransaction(
      $grpc.ServiceCall call, $0.GetRawBondTransactionRequest request);
  $async.Future<$0.GetRawTransactionResponse> getRawUnbondTransaction(
      $grpc.ServiceCall call, $0.GetRawUnbondTransactionRequest request);
  $async.Future<$0.GetRawTransactionResponse> getRawWithdrawTransaction(
      $grpc.ServiceCall call, $0.GetRawWithdrawTransactionRequest request);
}
