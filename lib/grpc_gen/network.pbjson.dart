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
};

/// Descriptor for `GetNetworkInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNetworkInfoRequestDescriptor = $convert.base64Decode(
    'ChVHZXROZXR3b3JrSW5mb1JlcXVlc3Q=');

@$core.Deprecated('Use getNetworkInfoResponseDescriptor instead')
const GetNetworkInfoResponse$json = {
  '1': 'GetNetworkInfoResponse',
  '2': [
    {'1': 'network_name', '3': 1, '4': 1, '5': 9, '10': 'networkName'},
    {'1': 'total_sent_bytes', '3': 2, '4': 1, '5': 13, '10': 'totalSentBytes'},
    {'1': 'total_received_bytes', '3': 3, '4': 1, '5': 13, '10': 'totalReceivedBytes'},
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
    {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 4, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use getNetworkInfoResponseDescriptor instead')
const GetNetworkInfoResponse_ReceivedBytesEntry$json = {
  '1': 'ReceivedBytesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 4, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GetNetworkInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNetworkInfoResponseDescriptor = $convert.base64Decode(
    'ChZHZXROZXR3b3JrSW5mb1Jlc3BvbnNlEiEKDG5ldHdvcmtfbmFtZRgBIAEoCVILbmV0d29ya0'
    '5hbWUSKAoQdG90YWxfc2VudF9ieXRlcxgCIAEoDVIOdG90YWxTZW50Qnl0ZXMSMAoUdG90YWxf'
    'cmVjZWl2ZWRfYnl0ZXMYAyABKA1SEnRvdGFsUmVjZWl2ZWRCeXRlcxIyChVjb25uZWN0ZWRfcG'
    'VlcnNfY291bnQYBCABKA1SE2Nvbm5lY3RlZFBlZXJzQ291bnQSOQoPY29ubmVjdGVkX3BlZXJz'
    'GAUgAygLMhAucGFjdHVzLlBlZXJJbmZvUg5jb25uZWN0ZWRQZWVycxJMCgpzZW50X2J5dGVzGA'
    'YgAygLMi0ucGFjdHVzLkdldE5ldHdvcmtJbmZvUmVzcG9uc2UuU2VudEJ5dGVzRW50cnlSCXNl'
    'bnRCeXRlcxJYCg5yZWNlaXZlZF9ieXRlcxgHIAMoCzIxLnBhY3R1cy5HZXROZXR3b3JrSW5mb1'
    'Jlc3BvbnNlLlJlY2VpdmVkQnl0ZXNFbnRyeVINcmVjZWl2ZWRCeXRlcxo8Cg5TZW50Qnl0ZXNF'
    'bnRyeRIQCgNrZXkYASABKA1SA2tleRIUCgV2YWx1ZRgCIAEoBFIFdmFsdWU6AjgBGkAKElJlY2'
    'VpdmVkQnl0ZXNFbnRyeRIQCgNrZXkYASABKA1SA2tleRIUCgV2YWx1ZRgCIAEoBFIFdmFsdWU6'
    'AjgB');

@$core.Deprecated('Use getNodeInfoRequestDescriptor instead')
const GetNodeInfoRequest$json = {
  '1': 'GetNodeInfoRequest',
};

/// Descriptor for `GetNodeInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNodeInfoRequestDescriptor = $convert.base64Decode(
    'ChJHZXROb2RlSW5mb1JlcXVlc3Q=');

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
    {'1': 'addrs', '3': 8, '4': 3, '5': 9, '10': 'addrs'},
    {'1': 'protocols', '3': 9, '4': 3, '5': 9, '10': 'protocols'},
  ],
};

/// Descriptor for `GetNodeInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNodeInfoResponseDescriptor = $convert.base64Decode(
    'ChNHZXROb2RlSW5mb1Jlc3BvbnNlEhgKB21vbmlrZXIYASABKAlSB21vbmlrZXISFAoFYWdlbn'
    'QYAiABKAlSBWFnZW50EhcKB3BlZXJfaWQYAyABKAxSBnBlZXJJZBIdCgpzdGFydGVkX2F0GAQg'
    'ASgEUglzdGFydGVkQXQSIgoMcmVhY2hhYmlsaXR5GAUgASgJUgxyZWFjaGFiaWxpdHkSGgoIc2'
    'VydmljZXMYBiADKAVSCHNlcnZpY2VzEiUKDnNlcnZpY2VzX25hbWVzGAcgAygJUg1zZXJ2aWNl'
    'c05hbWVzEhQKBWFkZHJzGAggAygJUgVhZGRycxIcCglwcm90b2NvbHMYCSADKAlSCXByb3RvY2'
    '9scw==');

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
    {'1': 'received_messages', '3': 10, '4': 1, '5': 5, '10': 'receivedMessages'},
    {'1': 'invalid_messages', '3': 11, '4': 1, '5': 5, '10': 'invalidMessages'},
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
    'hlaWdodBIrChFyZWNlaXZlZF9tZXNzYWdlcxgKIAEoBVIQcmVjZWl2ZWRNZXNzYWdlcxIpChBp'
    'bnZhbGlkX21lc3NhZ2VzGAsgASgFUg9pbnZhbGlkTWVzc2FnZXMSGwoJbGFzdF9zZW50GAwgAS'
    'gDUghsYXN0U2VudBIjCg1sYXN0X3JlY2VpdmVkGA0gASgDUgxsYXN0UmVjZWl2ZWQSPgoKc2Vu'
    'dF9ieXRlcxgOIAMoCzIfLnBhY3R1cy5QZWVySW5mby5TZW50Qnl0ZXNFbnRyeVIJc2VudEJ5dG'
    'VzEkoKDnJlY2VpdmVkX2J5dGVzGA8gAygLMiMucGFjdHVzLlBlZXJJbmZvLlJlY2VpdmVkQnl0'
    'ZXNFbnRyeVINcmVjZWl2ZWRCeXRlcxIYCgdhZGRyZXNzGBAgASgJUgdhZGRyZXNzEhwKCWRpcm'
    'VjdGlvbhgRIAEoCVIJZGlyZWN0aW9uEhwKCXByb3RvY29scxgSIAMoCVIJcHJvdG9jb2xzEiUK'
    'DnRvdGFsX3Nlc3Npb25zGBMgASgFUg10b3RhbFNlc3Npb25zEi0KEmNvbXBsZXRlZF9zZXNzaW'
    '9ucxgUIAEoBVIRY29tcGxldGVkU2Vzc2lvbnMaPAoOU2VudEJ5dGVzRW50cnkSEAoDa2V5GAEg'
    'ASgFUgNrZXkSFAoFdmFsdWUYAiABKANSBXZhbHVlOgI4ARpAChJSZWNlaXZlZEJ5dGVzRW50cn'
    'kSEAoDa2V5GAEgASgFUgNrZXkSFAoFdmFsdWUYAiABKANSBXZhbHVlOgI4AQ==');

