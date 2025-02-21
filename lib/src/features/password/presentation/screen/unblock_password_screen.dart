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

class UnblockPasswordScreen extends StatefulWidget {
  const UnblockPasswordScreen({super.key, required this.fromRegistrationRoute});
  final bool fromRegistrationRoute;

  @override
  State<UnblockPasswordScreen> createState() => _UnblockPasswordScreenState();
}

class _UnblockPasswordScreenState extends State<UnblockPasswordScreen> {
  String? _errorMessage;
  String _passwordValue = '';
  // Constants for layout
  static const double _maxContentWidth = 400;
  static const double _lockIconSize = 406;
  static const double _lockIconContainerSize = 364;
  static const double _smallLockIconSize = 30;
  static const double _spacingMedium = 10;
  static const double _spacingLarge = 20;
  @override
  Widget build(BuildContext context) {
    // If password is not set, show loading indicator
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
              // Password Field
              CustomPasswordWidget(
                width: 280,
                placeholder: '••••••••',
                onChanged: (value) {
                  setState(() {
                    _errorMessage = null;
                    _passwordValue = value;
                  });
                  debugPrint('Password value: $value');
                },
              ),

              // Error Message
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _errorMessage!,
                    style: theme.typography.body!.copyWith(
                      color: Colors.red,
                    ),
                  ),
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
      onPressed: _handleUnlock,
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
    setState(() {
      _errorMessage = null;
    });
    final password = _passwordValue.trim();
    if (password.isEmpty) {
      setState(() {
        _errorMessage = context.tr(LocaleKeys.password_cannot_be_empty);
      });
      return;
    }
    _navigateToDashboard();
  }

  void _navigateToDashboard() {
    if (widget.fromRegistrationRoute) {
      context.goNamed(AppRoute.dashboard.name);
    } else {
      context.goNamed(AppRoute.basicDashboard.name);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
