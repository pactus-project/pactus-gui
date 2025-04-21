extension NetworkNameExtraction on String {
  /// Extracts the network name (e.g., `MainNet`)
  /// from a string containing `network=NAME`.
  /// Returns `null` if no match is found.
  String? extractNetworkName() {
    final match = RegExp(r'network=(\S+)').firstMatch(this);
    return match?.group(1);
  }
}

extension UltraFastReplacementExtension on String {
  /// Replaces all '___' placeholders with values from [replacements]
  /// using regex replacement without any explicit loops
  ///
  /// Throws if placeholder count doesn't match replacements count
  String replacePlaceholders(List<String> replacements) {
    // Verify counts match by counting placeholders
    final placeholderCount = RegExp(r'___').allMatches(this).length;
    if (placeholderCount != replacements.length) {
      throw ArgumentError(
          'Expected ${replacements.length} replacements, found'
              ' $placeholderCount placeholders');
    }

    // Create an iterator for replacements
    final replacementsIterator = replacements.iterator..moveNext();

    // Single regex replace operation with callback
    return replaceAllMapped(RegExp(r'___'), (_) {
      final replacement = replacementsIterator.current;
      replacementsIterator.moveNext();
      return replacement;
    });
  }
}
