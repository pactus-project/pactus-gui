//
//  Generated code. Do not modify.
//  source: network.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getNetworkInfoRequestDescriptor instead')
const GetNetworkInfoRequest$json = {
  '1': 'GetNetworkInfoRequest',
  '2': [
    {'1': 'only_connected', '3': 1, '4': 1, '5': 8, '10': 'onlyConnected'},
  ],
};

/// Descriptor for `GetNetworkInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNetworkInfoRequestDescriptor = $convert.base64Decode(
    'ChVHZXROZXR3b3JrSW5mb1JlcXVlc3QSJQoOb25seV9jb25uZWN0ZWQYASABKAhSDW9ubHlDb2'
    '5uZWN0ZWQ=');

@$core.Deprecated('Use getNetworkInfoResponseDescriptor instead')
const GetNetworkInfoResponse$json = {
  '1': 'GetNetworkInfoResponse',
  '2': [
    {'1': 'network_name', '3': 1, '4': 1, '5': 9, '10': 'networkName'},
    {'1': 'total_sent_bytes', '3': 2, '4': 1, '5': 3, '10': 'totalSentBytes'},
    {'1': 'total_received_bytes', '3': 3, '4': 1, '5': 3, '10': 'totalReceivedBytes'},
    {'1': 'connected_peers_count', '3': 4, '4': 1, '5': 13, '10': 'connectedPeersCount'},
    {'1': 'connected_peers', '3': 5, '4': 3, '5': 11, '6': '.pactus.PeerInfo', '10': 'connectedPeers'},
    {'1': 'sent_bytes', '3': 6, '4': 3, '5': 11, '6': '.pactus.GetNetworkInfoResponse.SentBytesEntry', '10': 'sentBytes'},
    {'1': 'received_bytes', '3': 7, '4': 3, '5': 11, '6': '.pactus.GetNetworkInfoResponse.ReceivedBytesEntry', '10': 'receivedBytes'},
  ],
  '3': [GetNetworkInfoResponse_SentBytesEntry$json, GetNetworkInfoResponse_ReceivedBytesEntry$json],
};

@$core.Deprecated('Use getNetworkInfoResponseDescriptor instead')
const GetNetworkInfoResponse_SentBytesEntry$json = {
  '1': 'SentBytesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use getNetworkInfoResponseDescriptor instead')
const GetNetworkInfoResponse_ReceivedBytesEntry$json = {
  '1': 'ReceivedBytesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GetNetworkInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNetworkInfoResponseDescriptor = $convert.base64Decode(
    'ChZHZXROZXR3b3JrSW5mb1Jlc3BvbnNlEiEKDG5ldHdvcmtfbmFtZRgBIAEoCVILbmV0d29ya0'
    '5hbWUSKAoQdG90YWxfc2VudF9ieXRlcxgCIAEoA1IOdG90YWxTZW50Qnl0ZXMSMAoUdG90YWxf'
    'cmVjZWl2ZWRfYnl0ZXMYAyABKANSEnRvdGFsUmVjZWl2ZWRCeXRlcxIyChVjb25uZWN0ZWRfcG'
    'VlcnNfY291bnQYBCABKA1SE2Nvbm5lY3RlZFBlZXJzQ291bnQSOQoPY29ubmVjdGVkX3BlZXJz'
    'GAUgAygLMhAucGFjdHVzLlBlZXJJbmZvUg5jb25uZWN0ZWRQZWVycxJMCgpzZW50X2J5dGVzGA'
    'YgAygLMi0ucGFjdHVzLkdldE5ldHdvcmtJbmZvUmVzcG9uc2UuU2VudEJ5dGVzRW50cnlSCXNl'
    'bnRCeXRlcxJYCg5yZWNlaXZlZF9ieXRlcxgHIAMoCzIxLnBhY3R1cy5HZXROZXR3b3JrSW5mb1'
    'Jlc3BvbnNlLlJlY2VpdmVkQnl0ZXNFbnRyeVINcmVjZWl2ZWRCeXRlcxo8Cg5TZW50Qnl0ZXNF'
    'bnRyeRIQCgNrZXkYASABKAVSA2tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWU6AjgBGkAKElJlY2'
    'VpdmVkQnl0ZXNFbnRyeRIQCgNrZXkYASABKAVSA2tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWU6'
    'AjgB');

@$core.Deprecated('Use getNodeInfoRequestDescriptor instead')
const GetNodeInfoRequest$json = {
  '1': 'GetNodeInfoRequest',
};

/// Descriptor for `GetNodeInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNodeInfoRequestDescriptor = $convert.base64Decode(
    'ChJHZXROb2RlSW5mb1JlcXVlc3Q=');

@$core.Deprecated('Use connectionInfoDescriptor instead')
const ConnectionInfo$json = {
  '1': 'ConnectionInfo',
  '2': [
    {'1': 'connections', '3': 1, '4': 1, '5': 4, '10': 'connections'},
    {'1': 'inbound_connections', '3': 2, '4': 1, '5': 4, '10': 'inboundConnections'},
    {'1': 'outbound_connections', '3': 3, '4': 1, '5': 4, '10': 'outboundConnections'},
  ],
};

/// Descriptor for `ConnectionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectionInfoDescriptor = $convert.base64Decode(
    'Cg5Db25uZWN0aW9uSW5mbxIgCgtjb25uZWN0aW9ucxgBIAEoBFILY29ubmVjdGlvbnMSLwoTaW'
    '5ib3VuZF9jb25uZWN0aW9ucxgCIAEoBFISaW5ib3VuZENvbm5lY3Rpb25zEjEKFG91dGJvdW5k'
    'X2Nvbm5lY3Rpb25zGAMgASgEUhNvdXRib3VuZENvbm5lY3Rpb25z');

@$core.Deprecated('Use getNodeInfoResponseDescriptor instead')
const GetNodeInfoResponse$json = {
  '1': 'GetNodeInfoResponse',
  '2': [
    {'1': 'moniker', '3': 1, '4': 1, '5': 9, '10': 'moniker'},
    {'1': 'agent', '3': 2, '4': 1, '5': 9, '10': 'agent'},
    {'1': 'peer_id', '3': 3, '4': 1, '5': 12, '10': 'peerId'},
    {'1': 'started_at', '3': 4, '4': 1, '5': 4, '10': 'startedAt'},
    {'1': 'reachability', '3': 5, '4': 1, '5': 9, '10': 'reachability'},
    {'1': 'services', '3': 6, '4': 3, '5': 5, '10': 'services'},
    {'1': 'services_names', '3': 7, '4': 3, '5': 9, '10': 'servicesNames'},
    {'1': 'local_addrs', '3': 8, '4': 3, '5': 9, '10': 'localAddrs'},
    {'1': 'protocols', '3': 9, '4': 3, '5': 9, '10': 'protocols'},
    {'1': 'clock_offset', '3': 13, '4': 1, '5': 1, '10': 'clockOffset'},
    {'1': 'connection_info', '3': 14, '4': 1, '5': 11, '6': '.pactus.ConnectionInfo', '10': 'connectionInfo'},
  ],
};

/// Descriptor for `GetNodeInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNodeInfoResponseDescriptor = $convert.base64Decode(
    'ChNHZXROb2RlSW5mb1Jlc3BvbnNlEhgKB21vbmlrZXIYASABKAlSB21vbmlrZXISFAoFYWdlbn'
    'QYAiABKAlSBWFnZW50EhcKB3BlZXJfaWQYAyABKAxSBnBlZXJJZBIdCgpzdGFydGVkX2F0GAQg'
    'ASgEUglzdGFydGVkQXQSIgoMcmVhY2hhYmlsaXR5GAUgASgJUgxyZWFjaGFiaWxpdHkSGgoIc2'
    'VydmljZXMYBiADKAVSCHNlcnZpY2VzEiUKDnNlcnZpY2VzX25hbWVzGAcgAygJUg1zZXJ2aWNl'
    'c05hbWVzEh8KC2xvY2FsX2FkZHJzGAggAygJUgpsb2NhbEFkZHJzEhwKCXByb3RvY29scxgJIA'
    'MoCVIJcHJvdG9jb2xzEiEKDGNsb2NrX29mZnNldBgNIAEoAVILY2xvY2tPZmZzZXQSPwoPY29u'
    'bmVjdGlvbl9pbmZvGA4gASgLMhYucGFjdHVzLkNvbm5lY3Rpb25JbmZvUg5jb25uZWN0aW9uSW'
    '5mbw==');

@$core.Deprecated('Use peerInfoDescriptor instead')
const PeerInfo$json = {
  '1': 'PeerInfo',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'moniker', '3': 2, '4': 1, '5': 9, '10': 'moniker'},
    {'1': 'agent', '3': 3, '4': 1, '5': 9, '10': 'agent'},
    {'1': 'peer_id', '3': 4, '4': 1, '5': 12, '10': 'peerId'},
    {'1': 'consensus_keys', '3': 5, '4': 3, '5': 9, '10': 'consensusKeys'},
    {'1': 'consensus_address', '3': 6, '4': 3, '5': 9, '10': 'consensusAddress'},
    {'1': 'services', '3': 7, '4': 1, '5': 13, '10': 'services'},
    {'1': 'last_block_hash', '3': 8, '4': 1, '5': 12, '10': 'lastBlockHash'},
    {'1': 'height', '3': 9, '4': 1, '5': 13, '10': 'height'},
    {'1': 'received_bundles', '3': 10, '4': 1, '5': 5, '10': 'receivedBundles'},
    {'1': 'invalid_bundles', '3': 11, '4': 1, '5': 5, '10': 'invalidBundles'},
    {'1': 'last_sent', '3': 12, '4': 1, '5': 3, '10': 'lastSent'},
    {'1': 'last_received', '3': 13, '4': 1, '5': 3, '10': 'lastReceived'},
    {'1': 'sent_bytes', '3': 14, '4': 3, '5': 11, '6': '.pactus.PeerInfo.SentBytesEntry', '10': 'sentBytes'},
    {'1': 'received_bytes', '3': 15, '4': 3, '5': 11, '6': '.pactus.PeerInfo.ReceivedBytesEntry', '10': 'receivedBytes'},
    {'1': 'address', '3': 16, '4': 1, '5': 9, '10': 'address'},
    {'1': 'direction', '3': 17, '4': 1, '5': 9, '10': 'direction'},
    {'1': 'protocols', '3': 18, '4': 3, '5': 9, '10': 'protocols'},
    {'1': 'total_sessions', '3': 19, '4': 1, '5': 5, '10': 'totalSessions'},
    {'1': 'completed_sessions', '3': 20, '4': 1, '5': 5, '10': 'completedSessions'},
  ],
  '3': [PeerInfo_SentBytesEntry$json, PeerInfo_ReceivedBytesEntry$json],
};

@$core.Deprecated('Use peerInfoDescriptor instead')
const PeerInfo_SentBytesEntry$json = {
  '1': 'SentBytesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use peerInfoDescriptor instead')
const PeerInfo_ReceivedBytesEntry$json = {
  '1': 'ReceivedBytesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PeerInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerInfoDescriptor = $convert.base64Decode(
    'CghQZWVySW5mbxIWCgZzdGF0dXMYASABKAVSBnN0YXR1cxIYCgdtb25pa2VyGAIgASgJUgdtb2'
    '5pa2VyEhQKBWFnZW50GAMgASgJUgVhZ2VudBIXCgdwZWVyX2lkGAQgASgMUgZwZWVySWQSJQoO'
    'Y29uc2Vuc3VzX2tleXMYBSADKAlSDWNvbnNlbnN1c0tleXMSKwoRY29uc2Vuc3VzX2FkZHJlc3'
    'MYBiADKAlSEGNvbnNlbnN1c0FkZHJlc3MSGgoIc2VydmljZXMYByABKA1SCHNlcnZpY2VzEiYK'
    'D2xhc3RfYmxvY2tfaGFzaBgIIAEoDFINbGFzdEJsb2NrSGFzaBIWCgZoZWlnaHQYCSABKA1SBm'
    'hlaWdodBIpChByZWNlaXZlZF9idW5kbGVzGAogASgFUg9yZWNlaXZlZEJ1bmRsZXMSJwoPaW52'
    'YWxpZF9idW5kbGVzGAsgASgFUg5pbnZhbGlkQnVuZGxlcxIbCglsYXN0X3NlbnQYDCABKANSCG'
    'xhc3RTZW50EiMKDWxhc3RfcmVjZWl2ZWQYDSABKANSDGxhc3RSZWNlaXZlZBI+CgpzZW50X2J5'
    'dGVzGA4gAygLMh8ucGFjdHVzLlBlZXJJbmZvLlNlbnRCeXRlc0VudHJ5UglzZW50Qnl0ZXMSSg'
    'oOcmVjZWl2ZWRfYnl0ZXMYDyADKAsyIy5wYWN0dXMuUGVlckluZm8uUmVjZWl2ZWRCeXRlc0Vu'
    'dHJ5Ug1yZWNlaXZlZEJ5dGVzEhgKB2FkZHJlc3MYECABKAlSB2FkZHJlc3MSHAoJZGlyZWN0aW'
    '9uGBEgASgJUglkaXJlY3Rpb24SHAoJcHJvdG9jb2xzGBIgAygJUglwcm90b2NvbHMSJQoOdG90'
    'YWxfc2Vzc2lvbnMYEyABKAVSDXRvdGFsU2Vzc2lvbnMSLQoSY29tcGxldGVkX3Nlc3Npb25zGB'
    'QgASgFUhFjb21wbGV0ZWRTZXNzaW9ucxo8Cg5TZW50Qnl0ZXNFbnRyeRIQCgNrZXkYASABKAVS'
    'A2tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWU6AjgBGkAKElJlY2VpdmVkQnl0ZXNFbnRyeRIQCg'
    'NrZXkYASABKAVSA2tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWU6AjgB');

