/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/clipboard.png
  AssetGenImage get clipboard =>
      const AssetGenImage('assets/icons/clipboard.png');

  /// File path: assets/icons/ic_clock.svg
  String get icClock => 'assets/icons/ic_clock.svg';

  /// File path: assets/icons/ic_close.svg
  String get icClose => 'assets/icons/ic_close.svg';

  /// File path: assets/icons/ic_code.svg
  String get icCode => 'assets/icons/ic_code.svg';

  /// File path: assets/icons/ic_connection.svg
  String get icConnection => 'assets/icons/ic_connection.svg';

  /// File path: assets/icons/ic_dark_mode.svg
  String get icDarkMode => 'assets/icons/ic_dark_mode.svg';

  /// File path: assets/icons/ic_light_mode.svg
  String get icLightMode => 'assets/icons/ic_light_mode.svg';

  /// File path: assets/icons/ic_logo_dark.svg
  String get icLogoDark => 'assets/icons/ic_logo_dark.svg';

  /// File path: assets/icons/ic_logo_light.svg
  String get icLogoLight => 'assets/icons/ic_logo_light.svg';

  /// File path: assets/icons/ic_maximize.svg
  String get icMaximize => 'assets/icons/ic_maximize.svg';

  /// File path: assets/icons/ic_minimize.svg
  String get icMinimize => 'assets/icons/ic_minimize.svg';

  /// File path: assets/icons/ic_reachbility.svg
  String get icReachbility => 'assets/icons/ic_reachbility.svg';

  /// File path: assets/icons/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/icons/lock.png');

  /// File path: assets/icons/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/logo.png');

  /// List of all assets
  List<dynamic> get values => [
        clipboard,
        icClock,
        icClose,
        icCode,
        icConnection,
        icDarkMode,
        icLightMode,
        icLogoDark,
        icLogoLight,
        icMaximize,
        icMinimize,
        icReachbility,
        lock,
        logo
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background_initializing.svg
  String get backgroundInitializing =>
      'assets/images/background_initializing.svg';

  /// File path: assets/images/bg_finish_dark.svg
  String get bgFinishDark => 'assets/images/bg_finish_dark.svg';

  /// File path: assets/images/bg_finish_light.svg
  String get bgFinishLight => 'assets/images/bg_finish_light.svg';

  /// File path: assets/images/gears.png
  AssetGenImage get gears => const AssetGenImage('assets/images/gears.png');

  /// File path: assets/images/gift.png
  AssetGenImage get gift => const AssetGenImage('assets/images/gift.png');

  /// File path: assets/images/logo_name.png
  AssetGenImage get logoName =>
      const AssetGenImage('assets/images/logo_name.png');

  /// File path: assets/images/master_password.png
  AssetGenImage get masterPassword =>
      const AssetGenImage('assets/images/master_password.png');

  /// File path: assets/images/master_password_dark.svg
  String get masterPasswordDark => 'assets/images/master_password_dark.svg';

  /// File path: assets/images/master_password_light.svg
  String get masterPasswordLight => 'assets/images/master_password_light.svg';

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/welcome_pic.png
  AssetGenImage get welcomePic =>
      const AssetGenImage('assets/images/welcome_pic.png');

  /// List of all assets
  List<dynamic> get values => [
        backgroundInitializing,
        bgFinishDark,
        bgFinishLight,
        gears,
        gift,
        logoName,
        masterPassword,
        masterPasswordDark,
        masterPasswordLight,
        splash,
        welcomePic
      ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
