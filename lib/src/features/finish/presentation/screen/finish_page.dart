import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/extensions/context_extensions.dart';
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
  @override
  Widget build(BuildContext context) {
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
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsetsDirectional.only(end: 8),
                      children: [
                        Text(
                          context.tr(LocaleKeys.your_journey_finalized),
                          style: FluentTheme.of(context)
                              .typography
                              .title
                              ?.copyWith(
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
                          style:
                              FluentTheme.of(context).typography.body?.copyWith(
                                    color: AppTheme.of(context)
                                        .extension<DarkPallet>()!
                                        .dark900,
                                  ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          context
                              .tr(
                                LocaleKeys
                                    .your_journey_finalized_description_last,
                              )
                              .replaceHashWithSpecialCharacter(),
                          style:
                              FluentTheme.of(context).typography.body?.copyWith(
                                    color: AppTheme.of(context)
                                        .extension<DarkPallet>()!
                                        .dark900,
                                  ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 64),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: CustomFilledButton(
                        text: LocaleKeys.go_to_dashboard,
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 4, // 40% of the width
              child: Center(
                child: SvgPicture.asset(
                  context.isDarkTheme()
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
}
