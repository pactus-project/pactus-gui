//  Generated code. Do not modify.
//  source: network.proto
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

import 'network.pb.dart' as $0;

export 'network.pb.dart';

@$pb.GrpcServiceName('pactus.Network')
class NetworkClient extends $grpc.Client {
  static final _$getNetworkInfo =
      $grpc.ClientMethod<$0.GetNetworkInfoRequest, $0.GetNetworkInfoResponse>(
          '/pactus.Network/GetNetworkInfo',
          ($0.GetNetworkInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetNetworkInfoResponse.fromBuffer(value));
  static final _$getNodeInfo =
      $grpc.ClientMethod<$0.GetNodeInfoRequest, $0.GetNodeInfoResponse>(
          '/pactus.Network/GetNodeInfo',
          ($0.GetNodeInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetNodeInfoResponse.fromBuffer(value));

  NetworkClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetNetworkInfoResponse> getNetworkInfo(
      $0.GetNetworkInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNetworkInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetNodeInfoResponse> getNodeInfo(
      $0.GetNodeInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNodeInfo, request, options: options);
  }
}

@$pb.GrpcServiceName('pactus.Network')
abstract class NetworkServiceBase extends $grpc.Service {
  $core.String get $name => 'pactus.Network';

  NetworkServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetNetworkInfoRequest,
            $0.GetNetworkInfoResponse>(
        'GetNetworkInfo',
        getNetworkInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetNetworkInfoRequest.fromBuffer(value),
        ($0.GetNetworkInfoResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetNodeInfoRequest, $0.GetNodeInfoResponse>(
            'GetNodeInfo',
            getNodeInfo_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetNodeInfoRequest.fromBuffer(value),
            ($0.GetNodeInfoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetNetworkInfoResponse> getNetworkInfo_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetNetworkInfoRequest> request) async {
    return getNetworkInfo(call, await request);
  }

  $async.Future<$0.GetNodeInfoResponse> getNodeInfo_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetNodeInfoRequest> request) async {
    return getNodeInfo(call, await request);
  }

  $async.Future<$0.GetNetworkInfoResponse> getNetworkInfo(
      $grpc.ServiceCall call, $0.GetNetworkInfoRequest request);
  $async.Future<$0.GetNodeInfoResponse> getNodeInfo(
      $grpc.ServiceCall call, $0.GetNodeInfoRequest request);
}
