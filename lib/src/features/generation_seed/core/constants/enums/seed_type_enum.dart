/// ## [SeedTypeEnum] Enum Documentation
///
/// The `SeedTypeEnum` enum represents the different types of seed words
/// available for seed generation. Each value is associated with an ID and a
/// descriptive text and Quantity.
///
/// ### Values:
///
/// - **twelve** (`SeedTypeEnum`):
///   - ID: `1`
///   - Text: `'12 words'`
///   - Quantity: `12`
///   - Represents the 12-word seed type.
///
/// - **twentyFour** (`SeedTypeEnum`):
///   - ID: `2`
///   - Text: `'24 words'`
///   - Quantity: `24`
///   - Represents the 24-word seed type.
///
/// ### Properties:
///
/// - **id** (`int`):
///   - A unique identifier for each seed type.
///
/// - **text** (`String`):
///   - A description of the seed type, such as "12 words" or "24 words".
///
/// - **qty** (`int`):
///   - All seeds capacity.
///
/// ### Notes:
///
/// - The enum values are used to define and manage seed types in the seed
///   generation process.
library;

import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';

enum SeedTypeEnum {
  twelve(1, LocaleKeys.seed12words, 12),
  twentyFour(2, LocaleKeys.seed24words, 24);

  const SeedTypeEnum(
    this.id,
    this.text,
    this.qty,
  );
  final int id;
  final String text;
  final int qty;
}
