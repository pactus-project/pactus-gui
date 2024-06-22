//
//  Generated code. Do not modify.
//  source: network.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

/// Request message for retrieving overall network information.
class GetNetworkInfoRequest extends $pb.GeneratedMessage {
  factory GetNetworkInfoRequest({
    $core.bool? onlyConnected,
  }) {
    final $result = create();
    if (onlyConnected != null) {
      $result.onlyConnected = onlyConnected;
    }
    return $result;
  }
  GetNetworkInfoRequest._() : super();
  factory GetNetworkInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNetworkInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNetworkInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'onlyConnected')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNetworkInfoRequest clone() => GetNetworkInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNetworkInfoRequest copyWith(void Function(GetNetworkInfoRequest) updates) => super.copyWith((message) => updates(message as GetNetworkInfoRequest)) as GetNetworkInfoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNetworkInfoRequest create() => GetNetworkInfoRequest._();
  GetNetworkInfoRequest createEmptyInstance() => create();
  static $pb.PbList<GetNetworkInfoRequest> createRepeated() => $pb.PbList<GetNetworkInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNetworkInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNetworkInfoRequest>(create);
  static GetNetworkInfoRequest? _defaultInstance;

  /// Only returns the peers with connected status
  @$pb.TagNumber(1)
  $core.bool get onlyConnected => $_getBF(0);
  @$pb.TagNumber(1)
  set onlyConnected($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOnlyConnected() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnlyConnected() => clearField(1);
}

/// Response message containing information about the overall network.
class GetNetworkInfoResponse extends $pb.GeneratedMessage {
  factory GetNetworkInfoResponse({
    $core.String? networkName,
    $fixnum.Int64? totalSentBytes,
    $fixnum.Int64? totalReceivedBytes,
    $core.int? connectedPeersCount,
    $core.Iterable<PeerInfo>? connectedPeers,
    $core.Map<$core.int, $fixnum.Int64>? sentBytes,
    $core.Map<$core.int, $fixnum.Int64>? receivedBytes,
  }) {
    final $result = create();
    if (networkName != null) {
      $result.networkName = networkName;
    }
    if (totalSentBytes != null) {
      $result.totalSentBytes = totalSentBytes;
    }
    if (totalReceivedBytes != null) {
      $result.totalReceivedBytes = totalReceivedBytes;
    }
    if (connectedPeersCount != null) {
      $result.connectedPeersCount = connectedPeersCount;
    }
    if (connectedPeers != null) {
      $result.connectedPeers.addAll(connectedPeers);
    }
    if (sentBytes != null) {
      $result.sentBytes.addAll(sentBytes);
    }
    if (receivedBytes != null) {
      $result.receivedBytes.addAll(receivedBytes);
    }
    return $result;
  }
  GetNetworkInfoResponse._() : super();
  factory GetNetworkInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNetworkInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNetworkInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'networkName')
    ..aInt64(2, _omitFieldNames ? '' : 'totalSentBytes')
    ..aInt64(3, _omitFieldNames ? '' : 'totalReceivedBytes')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'connectedPeersCount', $pb.PbFieldType.OU3)
    ..pc<PeerInfo>(5, _omitFieldNames ? '' : 'connectedPeers', $pb.PbFieldType.PM, subBuilder: PeerInfo.create)
    ..m<$core.int, $fixnum.Int64>(6, _omitFieldNames ? '' : 'sentBytes', entryClassName: 'GetNetworkInfoResponse.SentBytesEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('pactus'))
    ..m<$core.int, $fixnum.Int64>(7, _omitFieldNames ? '' : 'receivedBytes', entryClassName: 'GetNetworkInfoResponse.ReceivedBytesEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('pactus'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNetworkInfoResponse clone() => GetNetworkInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNetworkInfoResponse copyWith(void Function(GetNetworkInfoResponse) updates) => super.copyWith((message) => updates(message as GetNetworkInfoResponse)) as GetNetworkInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNetworkInfoResponse create() => GetNetworkInfoResponse._();
  GetNetworkInfoResponse createEmptyInstance() => create();
  static $pb.PbList<GetNetworkInfoResponse> createRepeated() => $pb.PbList<GetNetworkInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNetworkInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNetworkInfoResponse>(create);
  static GetNetworkInfoResponse? _defaultInstance;

  /// Name of the network.
  @$pb.TagNumber(1)
  $core.String get networkName => $_getSZ(0);
  @$pb.TagNumber(1)
  set networkName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNetworkName() => $_has(0);
  @$pb.TagNumber(1)
  void clearNetworkName() => clearField(1);

  /// Total bytes sent across the network.
  @$pb.TagNumber(2)
  $fixnum.Int64 get totalSentBytes => $_getI64(1);
  @$pb.TagNumber(2)
  set totalSentBytes($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalSentBytes() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalSentBytes() => clearField(2);

  /// Total bytes received across the network.
  @$pb.TagNumber(3)
  $fixnum.Int64 get totalReceivedBytes => $_getI64(2);
  @$pb.TagNumber(3)
  set totalReceivedBytes($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalReceivedBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalReceivedBytes() => clearField(3);

  /// Number of connected peers.
  @$pb.TagNumber(4)
  $core.int get connectedPeersCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set connectedPeersCount($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasConnectedPeersCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearConnectedPeersCount() => clearField(4);

  /// List of connected peers.
  @$pb.TagNumber(5)
  $core.List<PeerInfo> get connectedPeers => $_getList(4);

  /// Bytes sent per peer ID.
  @$pb.TagNumber(6)
  $core.Map<$core.int, $fixnum.Int64> get sentBytes => $_getMap(5);

  /// Bytes received per peer ID.
  @$pb.TagNumber(7)
  $core.Map<$core.int, $fixnum.Int64> get receivedBytes => $_getMap(6);
}

/// Request message for retrieving information about a specific node in the
/// network.
class GetNodeInfoRequest extends $pb.GeneratedMessage {
  factory GetNodeInfoRequest() => create();
  GetNodeInfoRequest._() : super();
  factory GetNodeInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNodeInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNodeInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNodeInfoRequest clone() => GetNodeInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNodeInfoRequest copyWith(void Function(GetNodeInfoRequest) updates) => super.copyWith((message) => updates(message as GetNodeInfoRequest)) as GetNodeInfoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNodeInfoRequest create() => GetNodeInfoRequest._();
  GetNodeInfoRequest createEmptyInstance() => create();
  static $pb.PbList<GetNodeInfoRequest> createRepeated() => $pb.PbList<GetNodeInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNodeInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNodeInfoRequest>(create);
  static GetNodeInfoRequest? _defaultInstance;
}

/// Response message containing information about the overall network.
class ConnectionInfo extends $pb.GeneratedMessage {
  factory ConnectionInfo({
    $fixnum.Int64? connections,
    $fixnum.Int64? inboundConnections,
    $fixnum.Int64? outboundConnections,
  }) {
    final $result = create();
    if (connections != null) {
      $result.connections = connections;
    }
    if (inboundConnections != null) {
      $result.inboundConnections = inboundConnections;
    }
    if (outboundConnections != null) {
      $result.outboundConnections = outboundConnections;
    }
    return $result;
  }
  ConnectionInfo._() : super();
  factory ConnectionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectionInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'connections', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'inboundConnections', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'outboundConnections', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectionInfo clone() => ConnectionInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectionInfo copyWith(void Function(ConnectionInfo) updates) => super.copyWith((message) => updates(message as ConnectionInfo)) as ConnectionInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectionInfo create() => ConnectionInfo._();
  ConnectionInfo createEmptyInstance() => create();
  static $pb.PbList<ConnectionInfo> createRepeated() => $pb.PbList<ConnectionInfo>();
  @$core.pragma('dart2js:noInline')
  static ConnectionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectionInfo>(create);
  static ConnectionInfo? _defaultInstance;

  /// Total number of the connection.
  @$pb.TagNumber(1)
  $fixnum.Int64 get connections => $_getI64(0);
  @$pb.TagNumber(1)
  set connections($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnections() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnections() => clearField(1);

  /// Number of inbound connections.
  @$pb.TagNumber(2)
  $fixnum.Int64 get inboundConnections => $_getI64(1);
  @$pb.TagNumber(2)
  set inboundConnections($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInboundConnections() => $_has(1);
  @$pb.TagNumber(2)
  void clearInboundConnections() => clearField(2);

  /// Number of outbound connections.
  @$pb.TagNumber(3)
  $fixnum.Int64 get outboundConnections => $_getI64(2);
  @$pb.TagNumber(3)
  set outboundConnections($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOutboundConnections() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutboundConnections() => clearField(3);
}

/// Response message containing information about a specific node in the network.
class GetNodeInfoResponse extends $pb.GeneratedMessage {
  factory GetNodeInfoResponse({
    $core.String? moniker,
    $core.String? agent,
    $core.List<$core.int>? peerId,
    $fixnum.Int64? startedAt,
    $core.String? reachability,
    $core.Iterable<$core.int>? services,
    $core.Iterable<$core.String>? servicesNames,
    $core.Iterable<$core.String>? localAddrs,
    $core.Iterable<$core.String>? protocols,
    $core.double? clockOffset,
    ConnectionInfo? connectionInfo,
  }) {
    final $result = create();
    if (moniker != null) {
      $result.moniker = moniker;
    }
    if (agent != null) {
      $result.agent = agent;
    }
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (startedAt != null) {
      $result.startedAt = startedAt;
    }
    if (reachability != null) {
      $result.reachability = reachability;
    }
    if (services != null) {
      $result.services.addAll(services);
    }
    if (servicesNames != null) {
      $result.servicesNames.addAll(servicesNames);
    }
    if (localAddrs != null) {
      $result.localAddrs.addAll(localAddrs);
    }
    if (protocols != null) {
      $result.protocols.addAll(protocols);
    }
    if (clockOffset != null) {
      $result.clockOffset = clockOffset;
    }
    if (connectionInfo != null) {
      $result.connectionInfo = connectionInfo;
    }
    return $result;
  }
  GetNodeInfoResponse._() : super();
  factory GetNodeInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNodeInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNodeInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'moniker')
    ..aOS(2, _omitFieldNames ? '' : 'agent')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'peerId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'startedAt', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'reachability')
    ..p<$core.int>(6, _omitFieldNames ? '' : 'services', $pb.PbFieldType.K3)
    ..pPS(7, _omitFieldNames ? '' : 'servicesNames')
    ..pPS(8, _omitFieldNames ? '' : 'localAddrs')
    ..pPS(9, _omitFieldNames ? '' : 'protocols')
    ..a<$core.double>(13, _omitFieldNames ? '' : 'clockOffset', $pb.PbFieldType.OD)
    ..aOM<ConnectionInfo>(14, _omitFieldNames ? '' : 'connectionInfo', subBuilder: ConnectionInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNodeInfoResponse clone() => GetNodeInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNodeInfoResponse copyWith(void Function(GetNodeInfoResponse) updates) => super.copyWith((message) => updates(message as GetNodeInfoResponse)) as GetNodeInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNodeInfoResponse create() => GetNodeInfoResponse._();
  GetNodeInfoResponse createEmptyInstance() => create();
  static $pb.PbList<GetNodeInfoResponse> createRepeated() => $pb.PbList<GetNodeInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNodeInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNodeInfoResponse>(create);
  static GetNodeInfoResponse? _defaultInstance;

  /// Moniker of the node.
  @$pb.TagNumber(1)
  $core.String get moniker => $_getSZ(0);
  @$pb.TagNumber(1)
  set moniker($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMoniker() => $_has(0);
  @$pb.TagNumber(1)
  void clearMoniker() => clearField(1);

  /// Agent information of the node.
  @$pb.TagNumber(2)
  $core.String get agent => $_getSZ(1);
  @$pb.TagNumber(2)
  set agent($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgent() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgent() => clearField(2);

  /// Peer ID of the node.
  @$pb.TagNumber(3)
  $core.List<$core.int> get peerId => $_getN(2);
  @$pb.TagNumber(3)
  set peerId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPeerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeerId() => clearField(3);

  /// Timestamp when the node started.
  @$pb.TagNumber(4)
  $fixnum.Int64 get startedAt => $_getI64(3);
  @$pb.TagNumber(4)
  set startedAt($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartedAt() => clearField(4);

  /// Reachability status of the node.
  @$pb.TagNumber(5)
  $core.String get reachability => $_getSZ(4);
  @$pb.TagNumber(5)
  set reachability($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReachability() => $_has(4);
  @$pb.TagNumber(5)
  void clearReachability() => clearField(5);

  /// List of services provided by the node.
  @$pb.TagNumber(6)
  $core.List<$core.int> get services => $_getList(5);

  /// Names of services provided by the node.
  @$pb.TagNumber(7)
  $core.List<$core.String> get servicesNames => $_getList(6);

  /// List of addresses associated with the node.
  @$pb.TagNumber(8)
  $core.List<$core.String> get localAddrs => $_getList(7);

  /// List of protocols supported by the node.
  @$pb.TagNumber(9)
  $core.List<$core.String> get protocols => $_getList(8);

  /// Clock offset
  @$pb.TagNumber(13)
  $core.double get clockOffset => $_getN(9);
  @$pb.TagNumber(13)
  set clockOffset($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(13)
  $core.bool hasClockOffset() => $_has(9);
  @$pb.TagNumber(13)
  void clearClockOffset() => clearField(13);

  /// Connection information
  @$pb.TagNumber(14)
  ConnectionInfo get connectionInfo => $_getN(10);
  @$pb.TagNumber(14)
  set connectionInfo(ConnectionInfo v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasConnectionInfo() => $_has(10);
  @$pb.TagNumber(14)
  void clearConnectionInfo() => clearField(14);
  @$pb.TagNumber(14)
  ConnectionInfo ensureConnectionInfo() => $_ensure(10);
}

/// Information about a peer in the network.
class PeerInfo extends $pb.GeneratedMessage {
  factory PeerInfo({
    $core.int? status,
    $core.String? moniker,
    $core.String? agent,
    $core.List<$core.int>? peerId,
    $core.Iterable<$core.String>? consensusKeys,
    $core.Iterable<$core.String>? consensusAddress,
    $core.int? services,
    $core.List<$core.int>? lastBlockHash,
    $core.int? height,
    $core.int? receivedBundles,
    $core.int? invalidBundles,
    $fixnum.Int64? lastSent,
    $fixnum.Int64? lastReceived,
    $core.Map<$core.int, $fixnum.Int64>? sentBytes,
    $core.Map<$core.int, $fixnum.Int64>? receivedBytes,
    $core.String? address,
    $core.String? direction,
    $core.Iterable<$core.String>? protocols,
    $core.int? totalSessions,
    $core.int? completedSessions,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (moniker != null) {
      $result.moniker = moniker;
    }
    if (agent != null) {
      $result.agent = agent;
    }
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (consensusKeys != null) {
      $result.consensusKeys.addAll(consensusKeys);
    }
    if (consensusAddress != null) {
      $result.consensusAddress.addAll(consensusAddress);
    }
    if (services != null) {
      $result.services = services;
    }
    if (lastBlockHash != null) {
      $result.lastBlockHash = lastBlockHash;
    }
    if (height != null) {
      $result.height = height;
    }
    if (receivedBundles != null) {
      $result.receivedBundles = receivedBundles;
    }
    if (invalidBundles != null) {
      $result.invalidBundles = invalidBundles;
    }
    if (lastSent != null) {
      $result.lastSent = lastSent;
    }
    if (lastReceived != null) {
      $result.lastReceived = lastReceived;
    }
    if (sentBytes != null) {
      $result.sentBytes.addAll(sentBytes);
    }
    if (receivedBytes != null) {
      $result.receivedBytes.addAll(receivedBytes);
    }
    if (address != null) {
      $result.address = address;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (protocols != null) {
      $result.protocols.addAll(protocols);
    }
    if (totalSessions != null) {
      $result.totalSessions = totalSessions;
    }
    if (completedSessions != null) {
      $result.completedSessions = completedSessions;
    }
    return $result;
  }
  PeerInfo._() : super();
  factory PeerInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PeerInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PeerInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'pactus'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'moniker')
    ..aOS(3, _omitFieldNames ? '' : 'agent')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'peerId', $pb.PbFieldType.OY)
    ..pPS(5, _omitFieldNames ? '' : 'consensusKeys')
    ..pPS(6, _omitFieldNames ? '' : 'consensusAddress')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'services', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'lastBlockHash', $pb.PbFieldType.OY)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OU3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'receivedBundles', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'invalidBundles', $pb.PbFieldType.O3)
    ..aInt64(12, _omitFieldNames ? '' : 'lastSent')
    ..aInt64(13, _omitFieldNames ? '' : 'lastReceived')
    ..m<$core.int, $fixnum.Int64>(14, _omitFieldNames ? '' : 'sentBytes', entryClassName: 'PeerInfo.SentBytesEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('pactus'))
    ..m<$core.int, $fixnum.Int64>(15, _omitFieldNames ? '' : 'receivedBytes', entryClassName: 'PeerInfo.ReceivedBytesEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('pactus'))
    ..aOS(16, _omitFieldNames ? '' : 'address')
    ..aOS(17, _omitFieldNames ? '' : 'direction')
    ..pPS(18, _omitFieldNames ? '' : 'protocols')
    ..a<$core.int>(19, _omitFieldNames ? '' : 'totalSessions', $pb.PbFieldType.O3)
    ..a<$core.int>(20, _omitFieldNames ? '' : 'completedSessions', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PeerInfo clone() => PeerInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PeerInfo copyWith(void Function(PeerInfo) updates) => super.copyWith((message) => updates(message as PeerInfo)) as PeerInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PeerInfo create() => PeerInfo._();
  PeerInfo createEmptyInstance() => create();
  static $pb.PbList<PeerInfo> createRepeated() => $pb.PbList<PeerInfo>();
  @$core.pragma('dart2js:noInline')
  static PeerInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PeerInfo>(create);
  static PeerInfo? _defaultInstance;

  /// Status of the peer.
  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  /// Moniker of the peer.
  @$pb.TagNumber(2)
  $core.String get moniker => $_getSZ(1);
  @$pb.TagNumber(2)
  set moniker($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMoniker() => $_has(1);
  @$pb.TagNumber(2)
  void clearMoniker() => clearField(2);

  /// Agent information of the peer.
  @$pb.TagNumber(3)
  $core.String get agent => $_getSZ(2);
  @$pb.TagNumber(3)
  set agent($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAgent() => $_has(2);
  @$pb.TagNumber(3)
  void clearAgent() => clearField(3);

  /// Peer ID of the peer.
  @$pb.TagNumber(4)
  $core.List<$core.int> get peerId => $_getN(3);
  @$pb.TagNumber(4)
  set peerId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPeerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeerId() => clearField(4);

  /// Consensus keys used by the peer.
  @$pb.TagNumber(5)
  $core.List<$core.String> get consensusKeys => $_getList(4);

  /// Consensus address of the peer.
  @$pb.TagNumber(6)
  $core.List<$core.String> get consensusAddress => $_getList(5);

  /// Services provided by the peer.
  @$pb.TagNumber(7)
  $core.int get services => $_getIZ(6);
  @$pb.TagNumber(7)
  set services($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasServices() => $_has(6);
  @$pb.TagNumber(7)
  void clearServices() => clearField(7);

  /// Hash of the last block the peer knows.
  @$pb.TagNumber(8)
  $core.List<$core.int> get lastBlockHash => $_getN(7);
  @$pb.TagNumber(8)
  set lastBlockHash($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLastBlockHash() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastBlockHash() => clearField(8);

  /// Height of the peer in the blockchain.
  @$pb.TagNumber(9)
  $core.int get height => $_getIZ(8);
  @$pb.TagNumber(9)
  set height($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHeight() => $_has(8);
  @$pb.TagNumber(9)
  void clearHeight() => clearField(9);

  /// Count of received bundles.
  @$pb.TagNumber(10)
  $core.int get receivedBundles => $_getIZ(9);
  @$pb.TagNumber(10)
  set receivedBundles($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasReceivedBundles() => $_has(9);
  @$pb.TagNumber(10)
  void clearReceivedBundles() => clearField(10);

  /// Count of invalid bundles received.
  @$pb.TagNumber(11)
  $core.int get invalidBundles => $_getIZ(10);
  @$pb.TagNumber(11)
  set invalidBundles($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasInvalidBundles() => $_has(10);
  @$pb.TagNumber(11)
  void clearInvalidBundles() => clearField(11);

  /// Timestamp of the last sent bundle.
  @$pb.TagNumber(12)
  $fixnum.Int64 get lastSent => $_getI64(11);
  @$pb.TagNumber(12)
  set lastSent($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLastSent() => $_has(11);
  @$pb.TagNumber(12)
  void clearLastSent() => clearField(12);

  /// Timestamp of the last received bundle.
  @$pb.TagNumber(13)
  $fixnum.Int64 get lastReceived => $_getI64(12);
  @$pb.TagNumber(13)
  set lastReceived($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasLastReceived() => $_has(12);
  @$pb.TagNumber(13)
  void clearLastReceived() => clearField(13);

  /// Bytes sent per message type.
  @$pb.TagNumber(14)
  $core.Map<$core.int, $fixnum.Int64> get sentBytes => $_getMap(13);

  /// Bytes received per message type.
  @$pb.TagNumber(15)
  $core.Map<$core.int, $fixnum.Int64> get receivedBytes => $_getMap(14);

  /// Network address of the peer.
  @$pb.TagNumber(16)
  $core.String get address => $_getSZ(15);
  @$pb.TagNumber(16)
  set address($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasAddress() => $_has(15);
  @$pb.TagNumber(16)
  void clearAddress() => clearField(16);

  /// Direction of connection with the peer.
  @$pb.TagNumber(17)
  $core.String get direction => $_getSZ(16);
  @$pb.TagNumber(17)
  set direction($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasDirection() => $_has(16);
  @$pb.TagNumber(17)
  void clearDirection() => clearField(17);

  /// List of protocols supported by the peer.
  @$pb.TagNumber(18)
  $core.List<$core.String> get protocols => $_getList(17);

  /// Total sessions with the peer.
  @$pb.TagNumber(19)
  $core.int get totalSessions => $_getIZ(18);
  @$pb.TagNumber(19)
  set totalSessions($core.int v) { $_setSignedInt32(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasTotalSessions() => $_has(18);
  @$pb.TagNumber(19)
  void clearTotalSessions() => clearField(19);

  /// Completed sessions with the peer.
  @$pb.TagNumber(20)
  $core.int get completedSessions => $_getIZ(19);
  @$pb.TagNumber(20)
  set completedSessions($core.int v) { $_setSignedInt32(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasCompletedSessions() => $_has(19);
  @$pb.TagNumber(20)
  void clearCompletedSessions() => clearField(20);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
