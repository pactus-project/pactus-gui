extension NetworkPortExtraction on String {
  /// Extracts the port number from a string ending with `:PORT`.
  /// Returns `null` if parsing fails or no port is found.
  int? extractNetworkPort() {
    try {
      final parts = split(':');
      if (parts.length < 2) {
        return null; // No ":" found
      }

      final portString = parts.last.trim();
      if (portString.isEmpty) {
        return null; // Empty port
      }

      return int.tryParse(portString); // Safely parse (returns null on failure)
    } on Exception catch (_) {
      return null; // Fallback for unexpected errors
    }
  }
}
