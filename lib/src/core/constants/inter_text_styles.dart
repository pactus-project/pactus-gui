import 'package:flutter/material.dart' show FontWeight, TextStyle;

/// ## [InterTextStyles] Class Documentation
///
/// The `InterTextStyles` class provides a set of predefined text styles
/// designed for use throughout the application.
/// These styles are based on the Inter font family, with multiple weight
/// variants to ensure consistent typography.
///
/// ### Overview:
/// - Font families: Inter-Thin, Inter-ExtraLight, Inter-Light, Inter-Regular,
/// Inter-Medium, Inter-SemiBold, Inter-Bold, Inter-ExtraBold.
/// - Each style specifies font size, weight, and line height for consistent
/// vertical spacing.
///
/// ### Text Styles:
///
/// - **Caption:**
///   - Font: Inter-Light (300 weight)
///   - Size: 10px
///   - Line Height: 1.6 (16px/10px)
///   - Usage: Small descriptive text or captions.
///
/// - **Body:**
///   - Font: Inter-Regular (400 weight)
///   - Size: 14px
///   - Line Height: 1.43 (20px/14px)
///   - Usage: Default body text for content.
///
/// - **Subtitle:**
///   - Font: Inter-Medium (500 weight)
///   - Size: 16px
///   - Line Height: 1.5 (24px/16px)
///   - Usage: Subheadings or emphasized text.
///
/// - **Title:**
///   - Font: Inter-SemiBold (600 weight)
///   - Size: 20px
///   - Line Height: 1.4 (28px/20px)
///   - Usage: Section titles or prominent labels.
///
/// - **Title Large:**
///   - Font: Inter-SemiBold (600 weight)
///   - Size: 24px
///   - Line Height: 1.33 (32px/24px)
///   - Usage: Larger section headings or important text.
///
/// - **Display:**
///   - Font: Inter-SemiBold (600 weight)
///   - Size: 30px
///   - Line Height: 1.47 (44px/30px)
///   - Usage: Highlighted or primary display text.
///
/// - **Body Large:**
///   - Font: Inter-Bold (700 weight)
///   - Size: 36px
///   - Line Height: 1.33 (48px/36px)
///   - Usage: Prominent content or primary display.
///
/// - **Body Strong:**
///   - Font: Inter-Bold (700 weight)
///   - Size: 14px
///   - Line Height: 1.43 (20px/14px)
///   - Usage: Strong emphasis on body text.
///
/// ### Properties:
/// - Text styles include specific font families, sizes, weights, and line
/// heights.
/// - The `height` property ensures consistent vertical spacing relative to
/// font size.
///
/// ### Example Usage:
///
/// ```dart
/// Text(
///   'This is a caption',
///   style: InterTextStyles.caption, // Apply the caption style
/// );
/// ```
///
/// ### Notes:
/// - The `InterTextStyles` class is a centralized resource for typography,
/// ensuring design consistency.
/// - The font family "Inter" must be included in the project for these styles
/// to render correctly.

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

// Caption/light
  static const TextStyle caption = TextStyle(
    fontFamily: interLight, // font-family: InterLight;
    fontSize: 10, // font-size: 10px;
    fontWeight: FontWeight.w300, // font-weight: 300 (Light);
    height: 1.6, // line-height: 16px (16px line-height / 10px font-size = 1.6);
  );

// Body/regular
  static const TextStyle body = TextStyle(
    fontFamily: interRegular, // font-family: InterRegular;
    fontSize: 14, // font-size: 14px;
    fontWeight: FontWeight.w400, // font-weight: 400 (Regular);
    height: 1.43, // line-height: 20px (20px line-height / 14px font-size =
    // 1.43);
  );

// Subtitle/medium
  static const TextStyle subtitle = TextStyle(
    fontFamily: interMedium, // font-family: InterMedium;
    fontSize: 16, // font-size: 16px;
    fontWeight: FontWeight.w500, // font-weight: 500 (Medium);
    height: 1.5, // line-height: 24px (24px line-height / 16px font-size = 1.5);
  );

// Title/semi-bold
  static const TextStyle title = TextStyle(
    fontFamily: interSemiBold, // font-family: InterSemiBold;
    fontSize: 20, // font-size: 20px;
    fontWeight: FontWeight.w600, // font-weight: 600 (SemiBold);
    height: 1.4, // line-height: 28px (28px line-height /
    // 20px font-size = 1.4);
  );

// TitleLarge/semi-bold
  static const TextStyle titleLarge = TextStyle(
    fontFamily: interSemiBold, // font-family: InterSemiBold;
    fontSize: 24, // font-size: 24px;
    fontWeight: FontWeight.w600, // font-weight: 600 (SemiBold);
    height:
        1.33, // line-height: 32px (32px line-height / 24px font-size = 1.33);
  );

// Display/semi-bold
  static const TextStyle display = TextStyle(
    fontFamily: interSemiBold, // font-family: InterSemiBold;
    fontSize: 30, // font-size: 30px;
    fontWeight: FontWeight.w600, // font-weight: 600 (SemiBold);
    height:
        1.47, // line-height: 44px (44px line-height / 30px font-size = 1.47);
  );

// BodyLarge/bold
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: interBold, // font-family: InterBold;
    fontSize: 36, // font-size: 36px;
    fontWeight: FontWeight.w700, // font-weight: 700 (Bold);
    height:
        1.33, // line-height: 48px (48px line-height / 36px font-size = 1.33);
  );

// BodyStrong/bold
  static const TextStyle bodyStrong = TextStyle(
    fontFamily: interBold, // font-family: InterBold;
    fontSize: 14, // font-size: 14px;
    fontWeight: FontWeight.w700, // font-weight: 700 (Bold);
    height:
        1.43, // line-height: 20px (20px line-height / 14px font-size = 1.43);
  );
}

/// -----------------------------------------
/// Text Style Documentation
/// -----------------------------------------
///
/// Style #1:
/// - Weight: 200
/// - Size: 4px
/// - Line-Height: 10px (2.5)
/// - Name: extraLight4
/// - Category: Caption (Small Text)
///
/// Style #2:
/// - Weight: 200
/// - Size: 6px
/// - Line-Height: 16px (2.67)
/// - Name: extraLight6
/// - Category: Caption (Small Text)
///
/// Style #3:
/// - Weight: 200
/// - Size: 14px
/// - Line-Height: 28px (2)
/// - Name: extraLight14
/// - Category: Body (Default)
///
/// Style #4:
/// - Weight: 200
/// - Size: 15px
/// - Line-Height: 24px (1.6)
/// - Name: extraLight15
/// - Category: Body (Default)
///
/// Style #5:
/// - Weight: 200
/// - Size: 30px
/// - Line-Height: 44px (1.47)
/// - Name: extraLight30
/// - Category: Title (Large)
///
/// Style #6:
/// - Weight: 300
/// - Size: 9px
/// - Line-Height: 15px (1.67)
/// - Name: light9
/// - Category: Caption (Small Text)
///
/// Style #7:
/// - Weight: 300
/// - Size: 10px
/// - Line-Height: 20px (2)
/// - Name: light10
/// - Category: Overline (Small All Caps)
///
/// Style #8:
/// - Weight: 300
/// - Size: 14px
/// - Line-Height: 20px (1.43)
/// - Name: light14
/// - Category: Body (Default)
///
/// Style #9:
/// - Weight: 300
/// - Size: 15px
/// - Line-Height: 24px (1.6)
/// - Name: light15
/// - Category: Body (Default)
///
/// Style #10:
/// - Weight: 300
/// - Size: 18px
/// - Line-Height: 24px (1.33)
/// - Name: light18
/// - Category: Subheading
///
/// Style #11:
/// - Weight: 400
/// - Size: 8px
/// - Line-Height: 20px (2.5)
/// - Name: regular8
/// - Category: Caption (Small Text)
///
/// Style #12:
/// - Weight: 400
/// - Size: 10px
/// - Line-Height: 20px (2)
/// - Name: regular10H2
/// - Category: Overline (Small All Caps)
///
/// Style #13:
/// - Weight: 400
/// - Size: 10px
/// - Line-Height: 16px (1.6)
/// - Name: regular10H1
/// - Category: Body (Default)
///
/// Style #14:
/// - Weight: 400
/// - Size: 11px
/// - Line-Height: 18px (1.64)
/// - Name: regular11H1
/// - Category: Subheading
///
/// Style #15:
/// - Weight: 400
/// - Size: 11px
/// - Line-Height: 20px (1.82)
/// - Name: regular11H2
/// - Category: Subheading
///
/// Style #16:
/// - Weight: 400
/// - Size: 12px
/// - Line-Height: 20px (1.67)
/// - Name: regular12H2
/// - Category: Subheading
///
/// Style #17:
/// - Weight: 400
/// - Size: 12px
/// - Line-Height: 16px (1.33)
/// - Name: regular12H1
/// - Category: Body (Default)
///
/// Style #18:
/// - Weight: 400
/// - Size: 13px
/// - Line-Height: 25px (1.92)
/// - Name: regular13H3
/// - Category: Subheading
///
/// Style #19:
/// - Weight: 400
/// - Size: 14px
/// - Line-Height: 20px (1.43)
/// - Name: regular14H1
/// - Category: Body (Default)
///
/// Style #20:
/// - Weight: 400
/// - Size: 14px
/// - Line-Height: 28px (2)
/// - Name: regular14H2
/// - Category: Body (Default)
///
/// Style #21:
/// - Weight: 500
/// - Size: 11px
/// - Line-Height: 20px (1.82)
/// - Name: medium11
/// - Category: Subheading
///
/// Style #22:
/// - Weight: 500
/// - Size: 12px
/// - Line-Height: 20px (1.67)
/// - Name: medium12H2
/// - Category: Subheading
///
/// Style #23:
/// - Weight: 500
/// - Size: 12px
/// - Line-Height: 17px (1.42)
/// - Name: medium12H1
/// - Category: Body (Default)
///
/// Style #24:
/// - Weight: 500
/// - Size: 13px
/// - Line-Height: 16px (1.23)
/// - Name: medium13
/// - Category: Subheading
///
/// Style #25:
/// - Weight: 500
/// - Size: 14px
/// - Line-Height: 20px (1.43)
/// - Name: medium14
/// - Category: Body (Default)
///
/// Style #26:
/// - Weight: 600
/// - Size: 7px
/// - Line-Height: 20px (2.86)
/// - Name: semiBold7
/// - Category: Caption (Small Text)
///
/// Style #27:
/// - Weight: 600
/// - Size: 10px
/// - Line-Height: 20px (2)
/// - Name: semiBold10
/// - Category: Overline (Small All Caps)
///
/// Style #28:
/// - Weight: 600
/// - Size: 14px
/// - Line-Height: 16px (1.14)
/// - Name: semiBold14H1
/// - Category: Body (Default)
///
/// Style #29:
/// - Weight: 600
/// - Size: 14px
/// - Line-Height: 24px (1.71)
/// - Name: semiBold14H2
/// - Category: Subheading
///
/// Style #30:
/// - Weight: 600
/// - Size: 14px
/// - Line-Height: 28px (2)
/// - Name: semiBold14H2
/// - Category: Subheading
///
/// Style #31:
/// - Weight: 600
/// - Size: 14px
/// - Line-Height: 20px (1.43)
/// - Name: semiBold14H1
/// - Category: Body (Default)
///
/// Style #32:
/// - Weight: 600
/// - Size: 16px
/// - Line-Height: 24px (1.5)
/// - Name: semiBold16
/// - Category: Subheading
///
/// Style #33:
/// - Weight: 600
/// - Size: 24px
/// - Line-Height: 32px (1.33)
/// - Name: semiBold24
/// - Category: Heading (Medium)
///
/// Style #34:
/// - Weight: 700
/// - Size: 9px
/// - Line-Height: 20px (2.22)
/// - Name: bold9
/// - Category: Caption (Small Text)
///
/// Style #35:
/// - Weight: 700
/// - Size: 10px
/// - Line-Height: 20px (2)
/// - Name: bold10
/// - Category: Overline (Small All Caps)
///
/// Style #36:
/// - Weight: 700
/// - Size: 12px
/// - Line-Height: 20px (1.67)
/// - Name: bold12
/// - Category: Subheading
///
/// Style #37:
/// - Weight: 700
/// - Size: 13px
/// - Line-Height: 16px (1.23)
/// - Name: bold13
/// - Category: Subheading
///
/// Style #38:
/// - Weight: 700
/// - Size: 14px
/// - Line-Height: 28px (2)
/// - Name: bold14
/// - Category: Body (Default)
