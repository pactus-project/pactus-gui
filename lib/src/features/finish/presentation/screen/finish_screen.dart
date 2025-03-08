import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/cubits/app_accent_color_cubit.dart';
import 'package:gui/src/core/common/widgets/custom_filled_button.dart';
import 'package:gui/src/core/extensions/context_extensions.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/core/utils/string_extension.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class FinishScreen extends StatefulWidget {
  const FinishScreen({super.key});

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
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
                      child: BlocBuilder<AppAccentColorCubit, Color>(
                        builder: (context, accentColor) {
                          return CustomFilledButton(
                            text: LocaleKeys.go_to_dashboard,
                            onPressed: () {
                              context.goNamed(AppRoute.dashboard.name);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all<Color?>(accentColor),
                            ),
                          );
                        },
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
