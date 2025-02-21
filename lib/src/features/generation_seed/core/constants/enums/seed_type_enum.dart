/// ## [SeedTypeEnum] Enum Documentation
///
/// The `SeedTypeEnum` enum represents the different types of seed words
/// available for seed generation. Each value is associated with an ID and a
/// descriptive text.
///
/// ### Values:
///
/// - **none** (`SeedTypeEnum`):
///   - ID: `0`
///   - Text: `'no words'`
///   - Represents the case where no seed words are selected.
///
/// - **twelve** (`SeedTypeEnum`):
///   - ID: `1`
///   - Text: `'12 words'`
///   - Represents the 12-word seed type.
///
/// - **twentyFour** (`SeedTypeEnum`):
///   - ID: `2`
///   - Text: `'24 words'`
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
/// ### Notes:
///
/// - The enum values are used to define and manage seed types in the seed
///   generation process.
library;
enum SeedTypeEnum {
  none(0, 'no words'),
  twelve(1, '12 words'),
  twentyFour(2, '24 words');

  const SeedTypeEnum(
      this.id,
      this.text,
      );
  final int id;
  final String text;
}