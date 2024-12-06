import 'package:flutter/material.dart' show TextStyle, FontWeight;
/// ## [InterTextStyles] Documentation
///
/// The `InterTextStyles` class provides a collection of predefined text styles
/// using the "Inter" font family with various weights and sizes. These styles
/// are designed to help maintain consistent typography throughout the app.
///
/// ### Font Weights:
/// The class supports various font weights from thin to bold:
/// - **Inter-Thin**
/// - **Inter-ExtraLight**
/// - **Inter-Light**
/// - **Inter-Regular**
/// - **Inter-Medium**
/// - **Inter-SemiBold**
/// - **Inter-Bold**
/// - **Inter-ExtraBold**
///
/// These styles are defined with different font sizes, line heights, and font weights
/// that provide flexibility in handling various UI elements such as headings, body text,
/// labels, and buttons.
///
/// ### Class Structure:
/// The `InterTextStyles` class defines static `TextStyle` constants for each combination of
/// font family and font weight. The styles are categorized by font weight for easier use:
/// - **InterExtraLight**
/// - **InterLight**
/// - **InterRegular**
/// - **InterMedium**
/// - **InterSemiBold**
/// - **InterBold**
///
/// Each text style defines the following properties:
/// - **fontFamily**: The font family set to the corresponding weight of "Inter".
/// - **fontSize**: The size of the text (in logical pixels).
/// - **fontWeight**: The weight of the text (e.g., `FontWeight.w300`, `FontWeight.w400`).
/// - **height**: The line height used for the text, expressed as a multiplier of the font size.
///
/// ### Example Usage:
/// You can easily apply these text styles to `Text` widgets like so:
/// ```dart
/// Text(
///   'Example Text',
///   style: InterTextStyles.bold14,  // Apply a bold style with a font size of 14
/// );
/// ```
///
/// ### Example Breakdown of Key Styles:
///
/// #### 1. **InterExtraLight Text Styles**:
/// - **extraLight4**: A very thin text style with a font size of 4 and a height of 2.5.
///   ```dart
///   static const TextStyle extraLight4 = TextStyle(
///     fontFamily: interExtraLight,
///     fontSize: 4,
///     fontWeight: FontWeight.w200,
///     height: 2.5, // Equivalent to 10/4
///   );
///   ```
/// - **extraLight6**: A thin style with a font size of 6 and a height of 2.67.
///   ```dart
///   static const TextStyle extraLight6 = TextStyle(
///     fontFamily: interExtraLight,
///     fontSize: 6,
///     fontWeight: FontWeight.w200,
///     height: 2.67, // Equivalent to 16/6
///   );
///   ```

/// #### 2. **InterRegular Text Styles**:
/// - **regular10H1**: A regular-weight text style with a font size of 10 and a height of 1.6.
///   ```dart
///   static const TextStyle regular10H1 = TextStyle(
///     fontFamily: interRegular,
///     fontSize: 10,
///     fontWeight: FontWeight.w400,
///     height: 1.6, // Equivalent to 16/10
///   );
///   ```

/// #### 3. **InterBold Text Styles**:
/// - **bold10**: A bold text style with a font size of 10 and a height of 2.0.
///   ```dart
///   static const TextStyle bold10 = TextStyle(
///     fontFamily: interBold,
///     fontSize: 10,
///     fontWeight: FontWeight.w700,
///     height: 2.0, // Equivalent to 20/10
///   );
///   ```

/// #### 4. **InterSemiBold Text Styles**:
/// - **semiBold16**: A semi-bold text style with a font size of 16 and a height of 1.5.
///   ```dart
///   static const TextStyle semiBold16 = TextStyle(
///     fontFamily: interSemiBold,
///     fontSize: 16,
///     fontWeight: FontWeight.w600,
///     height: 1.5, // Equivalent to 24/16
///   );
///   ```

/// #### 5. **InterMedium Text Styles**:
/// - **medium14**: A medium-weight text style with a font size of 14 and a height of 1.43.
///   ```dart
///   static const TextStyle medium14 = TextStyle(
///     fontFamily: interMedium,
///     fontSize: 14,
///     fontWeight: FontWeight.w500,
///     height: 1.43, // Equivalent to 20/14
///   );
///   ```

/// ### Notes:
/// - Ensure that the "Inter" font family is included in your `pubspec.yaml` and is available in the app.
/// - These styles can be used across the app for consistency in text presentation.
/// - You can combine different font weights, sizes, and line heights as per the design requirements.


class InterTextStyles {
  InterTextStyles._();

  static const interThin = 'Inter-Thin';
  static const interExtraLight = 'Inter-ExtraLight';
  static const interLight = 'Inter-Light';
  static const interRegular = 'Inter-Regular';
  static const interMedium = 'Inter-Medium';
  static const interSemiBold = 'Inter-SemiBold';
  static const interBold = 'Inter-Bold';
  static const interExtraBold = 'Inter-ExtraBold';



  // InterExtraLight Text Styles
  static const TextStyle extraLight4 = TextStyle(
    fontFamily: interExtraLight,
    fontSize: 4,
    fontWeight: FontWeight.w200,
    height: 2.5, // Equivalent to 10/4
  );

  static const TextStyle extraLight6 = TextStyle(
    fontFamily: interExtraLight,
    fontSize: 6,
    fontWeight: FontWeight.w200,
    height: 2.67, // Equivalent to 16/6
  );

  static const TextStyle extraLight14 = TextStyle(
    fontFamily: interExtraLight,
    fontSize: 14,
    fontWeight: FontWeight.w200,
    height: 2.0, // Equivalent to 28/14
  );

  static const TextStyle extraLight15 = TextStyle(
    fontFamily: interExtraLight,
    fontSize: 15,
    fontWeight: FontWeight.w200,
    height: 1.6, // Equivalent to 24/15
  );

  static const TextStyle extraLight30 = TextStyle(
    fontFamily: interExtraLight,
    fontSize: 30,
    fontWeight: FontWeight.w200,
    height: 1.47, // Equivalent to 44/30
  );

  // InterLight Text Styles
  static const TextStyle light9 = TextStyle(
    fontFamily: interLight,
    fontSize: 9,
    fontWeight: FontWeight.w300,
    height: 1.67, // Equivalent to 15/9
  );

  static const TextStyle light10 = TextStyle(
    fontFamily: interLight,
    fontSize: 10,
    fontWeight: FontWeight.w300,
    height: 2.0, // Equivalent to 20/10
  );

  static const TextStyle light14 = TextStyle(
    fontFamily: interLight,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.43, // Equivalent to 20/14
  );

  static const TextStyle light15 = TextStyle(
    fontFamily: interLight,
    fontSize: 15,
    fontWeight: FontWeight.w300,
    height: 1.6, // Equivalent to 24/15
  );

  static const TextStyle light18 = TextStyle(
    fontFamily: interLight,
    fontSize: 18,
    fontWeight: FontWeight.w300,
    height: 1.33, // Equivalent to 24/18
  );


  // InterRegular Text Styles
  static const TextStyle regular8 = TextStyle(
    fontFamily: interRegular,
    fontSize: 8,
    fontWeight: FontWeight.w400,
    height: 2.5, // Equivalent to 20/8
  );

  static const TextStyle regular10H1 = TextStyle(
    fontFamily: interRegular,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.6, // Equivalent to 16/10
  );

  static const TextStyle regular10H2 = TextStyle(
    fontFamily: interRegular,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 2.0, // Equivalent to 20/10
  );

  static const TextStyle regular11H1 = TextStyle(
    fontFamily: interRegular,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.64, // Equivalent to 18/11
  );

  static const TextStyle regular11H2 = TextStyle(
    fontFamily: interRegular,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.82, // Equivalent to 20/11
  );

  static const TextStyle regular12H1 = TextStyle(
    fontFamily: interRegular,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33, // Equivalent to 16/12
  );

  static const TextStyle regular12H2 = TextStyle(
    fontFamily: interRegular,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.67, // Equivalent to 20/12
  );

  static const TextStyle regular13 = TextStyle(
    fontFamily: interRegular,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.92, // Equivalent to 25/13
  );

  static const TextStyle regular14 = TextStyle(
    fontFamily: interRegular,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43, // Equivalent to 20/14
  );

  // InterMedium Text Styles
  static const TextStyle medium11 = TextStyle(
    fontFamily: interMedium,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.82, // Equivalent to 20/11
  );

  static const TextStyle medium12H1 = TextStyle(
    fontFamily: interMedium,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.42, // Equivalent to 17/12
  );

  static const TextStyle medium12H2 = TextStyle(
    fontFamily: interMedium,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.67, // Equivalent to 20/12
  );

  static const TextStyle medium13 = TextStyle(
    fontFamily: interMedium,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.23, // Equivalent to 16/13
  );

  static const TextStyle medium14 = TextStyle(
    fontFamily: interMedium,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43, // Equivalent to 20/14
  );

  // InterSemiBold Text Styles
  static const TextStyle semiBold7 = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 7,
    fontWeight: FontWeight.w600,
    height: 2.86, // Equivalent to 20/7
  );

  static const TextStyle semiBold10 = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 2.0, // Equivalent to 20/10
  );

  static const TextStyle semiBold14H1 = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.14, // Equivalent to 16/14
  );

  static const TextStyle semiBold14H2 = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43, // Equivalent to 20/14
  );

  static const TextStyle semiBold14H3 = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.71, // Equivalent to 24/14
  );

  static const TextStyle semiBold14H4 = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 2.0, // Equivalent to 28/14
  );

  static const TextStyle semiBold16 = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5, // Equivalent to 24/16
  );

  static const TextStyle semiBold24 = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.33, // Equivalent to 32/24
  );

  // InterBold Text Styles
  static const TextStyle bold9 = TextStyle(
    fontFamily: interBold,
    fontSize: 9,
    fontWeight: FontWeight.w700,
    height: 2.22, // Equivalent to 20/9
  );

  static const TextStyle bold10 = TextStyle(
    fontFamily: interBold,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 2.0, // Equivalent to 20/10
  );

  static const TextStyle bold12 = TextStyle(
    fontFamily: interBold,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.67, // Equivalent to 20/12
  );

  static const TextStyle bold13 = TextStyle(
    fontFamily: interBold,
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 1.23, // Equivalent to 16/13
  );

  static const TextStyle bold14 = TextStyle(
    fontFamily: interBold,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 2.0, // Equivalent to 28/14
  );
}

