//  Generated code. Do not modify.
//  source: transaction.proto
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: require_trailing_commas
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: prefer_constructors_over_static_methods
// ignore_for_file: sort_unnamed_constructors_first
// ignore_for_file: sort_constructors_first
// ignore_for_file: prefer_final_locals
// ignore_for_file: avoid_renaming_method_parameters

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'transaction.pb.dart' as $0;
import 'transaction.pbjson.dart';

export 'transaction.pb.dart';

abstract class TransactionServiceBase extends $pb.GeneratedService {
  $async.Future<$0.GetTransactionResponse> getTransaction(
      $pb.ServerContext ctx, $0.GetTransactionRequest request);
  $async.Future<$0.CalculateFeeResponse> calculateFee(
      $pb.ServerContext ctx, $0.CalculateFeeRequest request);
  $async.Future<$0.BroadcastTransactionResponse> broadcastTransaction(
      $pb.ServerContext ctx, $0.BroadcastTransactionRequest request);
  $async.Future<$0.GetRawTransactionResponse> getRawTransferTransaction(
      $pb.ServerContext ctx, $0.GetRawTransferTransactionRequest request);
  $async.Future<$0.GetRawTransactionResponse> getRawBondTransaction(
      $pb.ServerContext ctx, $0.GetRawBondTransactionRequest request);
  $async.Future<$0.GetRawTransactionResponse> getRawUnbondTransaction(
      $pb.ServerContext ctx, $0.GetRawUnbondTransactionRequest request);
  $async.Future<$0.GetRawTransactionResponse> getRawWithdrawTransaction(
      $pb.ServerContext ctx, $0.GetRawWithdrawTransactionRequest request);
  $async.Future<$0.DecodeRawTransactionResponse> decodeRawTransaction(
      $pb.ServerContext ctx, $0.DecodeRawTransactionRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'GetTransaction':
        return $0.GetTransactionRequest();
      case 'CalculateFee':
        return $0.CalculateFeeRequest();
      case 'BroadcastTransaction':
        return $0.BroadcastTransactionRequest();
      case 'GetRawTransferTransaction':
        return $0.GetRawTransferTransactionRequest();
      case 'GetRawBondTransaction':
        return $0.GetRawBondTransactionRequest();
      case 'GetRawUnbondTransaction':
        return $0.GetRawUnbondTransactionRequest();
      case 'GetRawWithdrawTransaction':
        return $0.GetRawWithdrawTransactionRequest();
      case 'DecodeRawTransaction':
        return $0.DecodeRawTransactionRequest();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'GetTransaction':
        return this.getTransaction(ctx, request as $0.GetTransactionRequest);
      case 'CalculateFee':
        return this.calculateFee(ctx, request as $0.CalculateFeeRequest);
      case 'BroadcastTransaction':
        return this.broadcastTransaction(
            ctx, request as $0.BroadcastTransactionRequest);
      case 'GetRawTransferTransaction':
        return this.getRawTransferTransaction(
            ctx, request as $0.GetRawTransferTransactionRequest);
      case 'GetRawBondTransaction':
        return this.getRawBondTransaction(
            ctx, request as $0.GetRawBondTransactionRequest);
      case 'GetRawUnbondTransaction':
        return this.getRawUnbondTransaction(
            ctx, request as $0.GetRawUnbondTransactionRequest);
      case 'GetRawWithdrawTransaction':
        return this.getRawWithdrawTransaction(
            ctx, request as $0.GetRawWithdrawTransactionRequest);
      case 'DecodeRawTransaction':
        return this.decodeRawTransaction(
            ctx, request as $0.DecodeRawTransactionRequest);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json =>
      TransactionServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => TransactionServiceBase$messageJson;
}
