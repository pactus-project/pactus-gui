import 'package:pactus_gui/src/core/enums/app_enums.dart' show AddressType;

/// Extension providing utility methods for [AddressType]
extension AddressTypeExtension on AddressType {
  /// Returns a single character filter identifier used for address filtering
  /// operations.
  ///
  /// This method is typically used in API calls or database queries where
  /// single-character identifiers are required for filtering addresses by type.
  ///
  /// Returns:
  /// - 'v' for [AddressType.wallet]
  /// - 'r' for [AddressType.validator]
  String removeFilter() {
    return switch (this) {
      AddressType.wallet => 'v',
      AddressType.validator => 'r',
    };
  }
}
