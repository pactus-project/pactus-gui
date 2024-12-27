import 'package:flutter/material.dart' show FontWeight, TextStyle;

/// ## [InterTextStyles] Documentation
/// The InterTextStyles class provides a collection of predefined text styles
/// using the "Inter" font family with various weights and sizes. These styles
/// are designed to help maintain consistent typography throughout the app.
///
class InterTextStyles {
  InterTextStyles._();

  // Font family constants based on the specified weights
  static const interThin = 'Inter-Thin';
  static const interExtraLight = 'Inter-ExtraLight';
  static const interLight = 'Inter-Light';
  static const interRegular = 'Inter-Regular';
  static const interMedium = 'Inter-Medium';
  static const interSemiBold = 'Inter-SemiBold';
  static const interBold = 'Inter-Bold';
  static const interExtraBold = 'Inter-ExtraBold';

  // General Text Styles with updated font family for each weight
  static const TextStyle caption = TextStyle(
    fontFamily: interLight,
    fontSize: 10,
    fontWeight: FontWeight.w300, // Light
    height: 1.6, // 16/10
  );

  static const TextStyle body = TextStyle(
    fontFamily: interRegular,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 1.43, // 20/14
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: interMedium,
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    height: 1.5, // 24/16
  );

  static const TextStyle title = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 20,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.4, // 28/20
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 24,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.33, // 32/24
  );

  static const TextStyle display = TextStyle(
    fontFamily: interSemiBold,
    fontSize: 30,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.47, // 44/30
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: interBold,
    fontSize: 36,
    fontWeight: FontWeight.w700, // Bold
    height: 1.33, // 48/36
  );

  static const TextStyle bodyStrong = TextStyle(
    fontFamily: interBold,
    fontSize: 14,
    fontWeight: FontWeight.w700, // Bold
    height: 1.43, // 20/14
  );
}
