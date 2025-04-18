import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/common/widgets/app_layout.dart';
import 'package:gui/src/core/extensions/context_extensions.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:gui/src/features/blockchain_get_info/presentation/pages/blockchain_info_section.dart';
import 'package:gui/src/features/faq/presentation/sections/faq_section.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, NavigationState>(
      builder: (context, selectedIndex) {
        return AppLayout(
          isDashboard: true,
          content: NavigationView(
            pane: NavigationPane(
              displayMode: context.read<NavigationPaneCubit>().state.isMenuOpen
                  ? PaneDisplayMode.open
                  : PaneDisplayMode.compact,
              menuButton: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: HoverButton(
                  cursor: SystemMouseCursors.click,
                  onPressed: () {
                    context.read<NavigationPaneCubit>().toggleMenu();
                  },
                  builder: (context, states) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(material.Icons.menu),
                    );
                  },
                ),
              ),
              size:
                  const NavigationPaneSize(openMaxWidth: 209, compactWidth: 52),
              selected: selectedIndex.selectedIndex,
              onChanged: (index) {
                context.read<NavigationPaneCubit>().setSelectedIndex(index);
              },
              footerItems: [
                PaneItem(
                  icon: SvgPicture.asset(
                    Assets.icons.icSettings,
                    colorFilter: ColorFilter.mode(
                      context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 4,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    context.tr(LocaleKeys.settings),
                    style: TextStyle(
                      color: context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 4,
                      ),
                    ),
                  ),
                  body: Container(
                    color: AppTheme.of(context)
                        .extension<BlueGrayPallet>()!
                        .blueGray700,
                    width: double.infinity,
                  ),
                ),
                PaneItem(
                    icon: SvgPicture.asset(
                      Assets.icons.icFaqs,
                      colorFilter: ColorFilter.mode(
                        context.detectPaneTextColor(
                          isEnabledTextStyle: selectedIndex.selectedIndex == 5,
                        ),
                        BlendMode.srcIn,
                      ),
                    ),
                    title: Text(
                      context.tr(LocaleKeys.faqs),
                      style: TextStyle(
                        color: context.detectPaneTextColor(
                          isEnabledTextStyle: selectedIndex.selectedIndex == 5,
                        ),
                      ),
                    ),
                    body: FaqSection(),),
                PaneItem(
                  icon: SvgPicture.asset(
                    Assets.icons.icAboutUs,
                    colorFilter: ColorFilter.mode(
                      context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 6,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    context.tr(LocaleKeys.about),
                    style: TextStyle(
                      color: context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 6,
                      ),
                    ),
                  ),
                  body: Container(
                    color: AppTheme.of(context)
                        .extension<PurplePallet>()!
                        .purple700,
                    width: double.infinity,
                  ),
                ),
              ],
              items: [
                PaneItem(
                  icon: SvgPicture.asset(
                    Assets.icons.icDashboard,
                    colorFilter: ColorFilter.mode(
                      context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 0,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    context.tr(LocaleKeys.dashboard),
                    style: TextStyle(
                      color: context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 0,
                      ),
                    ),
                  ),
                  body: BlockchainInfoSection(),
                ),
                PaneItem(
                  icon: SvgPicture.asset(
                    Assets.icons.icTransaction,
                    colorFilter: ColorFilter.mode(
                      context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 1,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    context.tr(LocaleKeys.transaction),
                    style: TextStyle(
                      color: context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 1,
                      ),
                    ),
                  ),
                  body: Container(
                    color:
                        AppTheme.of(context).extension<PinkPallet>()!.pink600,
                    width: double.infinity,
                  ),
                ),
                PaneItem(
                  icon: SvgPicture.asset(
                    Assets.icons.icWallet,
                    colorFilter: ColorFilter.mode(
                      context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 2,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    context.tr(LocaleKeys.wallet),
                    style: TextStyle(
                      color: context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 2,
                      ),
                    ),
                  ),
                  body: Container(
                    color: AppTheme.of(context)
                        .extension<YellowPallet>()!
                        .yellow700,
                    width: double.infinity,
                  ),
                ),
                PaneItem(
                  icon: SvgPicture.asset(
                    Assets.icons.icNodeLogs,
                    colorFilter: ColorFilter.mode(
                      context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 3,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    context.tr(LocaleKeys.node_logs),
                    style: TextStyle(
                      color: context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 3,
                      ),
                    ),
                  ),
                  body: Container(
                    color:
                        AppTheme.of(context).extension<BluePallet>()!.blue700,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
