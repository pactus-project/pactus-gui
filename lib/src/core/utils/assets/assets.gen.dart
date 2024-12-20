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

  /// File path: assets/icons/ic_dark_mode.svg
  String get icDarkMode => 'assets/icons/ic_dark_mode.svg';

  /// File path: assets/icons/ic_light_mode.svg
  String get icLightMode => 'assets/icons/ic_light_mode.svg';

  /// File path: assets/icons/ic_lock.svg
  String get icLock => 'assets/icons/ic_lock.svg';

  /// File path: assets/icons/ic_logo_dark.svg
  String get icLogoDark => 'assets/icons/ic_logo_dark.svg';

  /// File path: assets/icons/ic_logo_light.svg
  String get icLogoLight => 'assets/icons/ic_logo_light.svg';

  /// File path: assets/icons/ic_master_password.svg
  String get icMasterPassword => 'assets/icons/ic_master_password.svg';

  /// File path: assets/icons/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/logo.png');

  /// List of all assets
  List<dynamic> get values => [
        clipboard,
        icDarkMode,
        icLightMode,
        icLock,
        icLogoDark,
        icLogoLight,
        icMasterPassword,
        logo
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

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

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [gears, gift, logoName, masterPassword, splash];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/es.json
  String get es => 'assets/translations/es.json';

  /// File path: assets/translations/fr.json
  String get fr => 'assets/translations/fr.json';

  /// List of all assets
  List<String> get values => [en, es, fr];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
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
    FilterQuality filterQuality = FilterQuality.low,
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
