import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/storage_utils.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import '../../../../core/common/widgets/custom_filled_button.dart';
import '../../../../core/utils/gen/assets/assets.gen.dart';
import '../../../../core/utils/gen/localization/locale_keys.dart';
import '../../../../core/utils/string_extension.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({super.key});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  Future<void> _handleFinish(BuildContext context) async {
    await StorageUtils.setInstallationFinished(isFinished: true);
    if (!context.mounted) {
      return;
    }

    if (NodeConfigData.instance.password.isNotEmpty) {
      await StorageUtils.savePasswordIfNotEmpty(
        NodeConfigData.instance.password,
      );
      if (!context.mounted) {
        return;
      }
      context.goNamed(AppRoute.dashboard.name);
    } else {
      await StorageUtils.savePasswordIfNotEmpty('');
      if (!context.mounted) {
        return;
      }
      context.goNamed(AppRoute.password.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return NavigationView(
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6, // 60% of the width
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(LocaleKeys.your_journey_finalized),
                    style: FluentTheme.of(context).typography.title?.copyWith(
                          color: AppTheme.of(context)
                              .extension<DarkPallet>()!
                              .dark900,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context
                        .tr(LocaleKeys.your_journey_finalized_description)
                        .replaceHashWithSpecialCharacter(),
                    style: FluentTheme.of(context).typography.body?.copyWith(
                          color: AppTheme.of(context)
                              .extension<DarkPallet>()!
                              .dark900,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context
                        .tr(LocaleKeys.your_journey_finalized_description_last)
                        .replaceHashWithSpecialCharacter(),
                    style: FluentTheme.of(context).typography.body?.copyWith(
                          color: AppTheme.of(context)
                              .extension<DarkPallet>()!
                              .dark900,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  _buildDaskBoardButton(context),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 4, // 40% of the width
              child: Center(
                child: SvgPicture.asset(
                  isDark
                      ? Assets.images.bgFinishDark
                      : Assets.images.bgFinishLight,
                  height: 400,
                  width: 400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaskBoardButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomFilledButton(
          text: LocaleKeys.go_to_dashboard,
          onPressed: () {
            _handleFinish(context);
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
        ),
      ],
    );
  }
}
