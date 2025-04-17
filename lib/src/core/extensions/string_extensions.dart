extension NetworkNameExtraction on String {
  /// Extracts the network name (e.g., `MainNet`)
  /// from a string containing `network=NAME`.
  /// Returns `null` if no match is found.
  String? extractNetworkName() {
    final match = RegExp(r'network=(\S+)').firstMatch(this);
    return match?.group(1);
  }
}
