import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/widgets/custom_filled_button.dart';
import '../../../../core/common/widgets/custom_password_widget.dart';

class UnlockScreen extends StatefulWidget {
  const UnlockScreen({super.key});

  @override
  State<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen> {
  final TextEditingController _passwordController = TextEditingController();

  // Constants for layout
  static const double _maxContentWidth = 400;
  static const double _lockIconSize = 406;
  static const double _lockIconContainerSize = 364;
  static const double _smallLockIconSize = 30;
  static const double _spacingMedium = 10;
  static const double _spacingLarge = 20;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colors = AppTheme.of(context).extension<DarkPallet>()!;

    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(
          '',
          style: theme.typography.body!.copyWith(
            color: colors.dark900,
          ),
        ),
      ),
      content: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: _maxContentWidth),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lock Icon Container
              _buildLockIcon(isDark),
              const SizedBox(height: _spacingMedium),

              // Small Lock Icon
              Assets.icons.lock.image(
                width: _smallLockIconSize,
                height: _smallLockIconSize,
                fit: BoxFit.contain,
                color: isDark ? AppColors.primaryLight : AppColors.primaryDark,
              ),
              const SizedBox(height: _spacingMedium),
              // Instruction Text
              Text(
                context.tr(LocaleKeys.unlock_wallet_description),
                style: theme.typography.body!.copyWith(
                  color: colors.dark700,
                ),
              ),
              const SizedBox(height: _spacingLarge),

              CustomPasswordWidget(
                width: 280,
                placeholder: 'Enter your password',
                onChanged: (value) {
                  debugPrint('Text changed: $value');
                },
              ),
              const SizedBox(height: _spacingLarge),

              // Unlock Button
              _buildUnlockButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLockIcon(bool isDark) {
    return Container(
      width: _lockIconSize,
      height: _lockIconContainerSize,
      decoration: BoxDecoration(
        color: AppTheme.of(context).scaffoldBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          isDark
              ? Assets.images.masterPasswordDark
              : Assets.images.masterPasswordLight,
          width: _lockIconSize,
          height: _lockIconContainerSize,
        ),
      ),
    );
  }

  Widget _buildUnlockButton() {
    return CustomFilledButton(
      text: LocaleKeys.unlock_wallet,
      onPressed: () {
        context.goNamed(AppRoute.dashboard.name);
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsDirectional?>(
          EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 4),
        ),
        backgroundColor: WidgetStateProperty.all(Color(0xFF0066B4)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Future<void> _handleUnlock() async {
    // setState(() => _isLoading = true);

    // try {
    //   final password = _passwordController.text;
    //   if (password.isEmpty) {
    //     // Show error message
    //     return;
    //   }

    //   // TODO: Add actual unlock logic
    //   await Future.delayed(const Duration(seconds: 1)); // Mock delay

    //   _navigateToDashboard(password);
    // } catch (e) {
    //   // Show error to user
    // } finally {
    //   if (mounted) {
    //     setState(() => _isLoading = false);
    //   }
    // }
  }

  void _navigateToDashboard(String decrypted) {
    // TODO: Implement navigation logic
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
