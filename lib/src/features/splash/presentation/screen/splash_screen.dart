import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.g.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _splashDuration = Duration(seconds: 2);
  static const _logoSize = 180.0;
  static const _logoNameWidth = 168.0;
  static const _logoNameHeight = 34.0;
  static const _spacingBetweenElements = 16.0;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future<void>.delayed(_splashDuration);
    if (mounted) {
      context.goNamed(AppRoute.welcome.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.logo.image(
                  width: _logoSize,
                  height: _logoSize,
                  fit: BoxFit.contain,
                ),
                Gap(_spacingBetweenElements),
                Assets.images.logoName.image(
                  width: _logoNameWidth,
                  height: _logoNameHeight,
                  fit: BoxFit.contain,
                ),
                Gap(_spacingBetweenElements),
                Text(
                  LocaleKeys.applications.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
