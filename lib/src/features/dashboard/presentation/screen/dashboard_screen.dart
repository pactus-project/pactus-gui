import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/app_layout.dart';
import 'package:pactus_gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:pactus_gui/src/features/about_us/presentation/screens/about_us_screen.dart';
import 'package:pactus_gui/src/features/dashboard/core/enums/pane_item_type.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/screen/dashboard_home_screen.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/widgets/icon_pane_item.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/widgets/menu_button.dart';
import 'package:pactus_gui/src/features/faq/presentation/screen/faq_screen.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui/src/features/node_logs/presentation/screens/node_logs_screen.dart';
import 'package:pactus_gui/src/features/settings/presentation/screens/settings_screen.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/bond_form_validation.dart'
    show BondFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/transter_form_validation.dart'
    show TransferFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/unbond_form_validation.dart'
    show UnBondFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/withdraw_form_validator.dart'
    show WithdrawFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_step_cubit.dart'
    show TransactionStepCubit;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/screens/transactions_screen.dart';
import 'package:pactus_gui/src/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, PanePallet;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, NavigationState>(
      builder: (context, state) {
        return AppLayout(
          isDashboard: true,
          content: NavigationView(
            pane: NavigationPane(
              displayMode: context.read<NavigationPaneCubit>().state.isMenuOpen
                  ? PaneDisplayMode.open
                  : PaneDisplayMode.compact,
              menuButton: MenuButton(),
              size: const NavigationPaneSize(
                openMaxWidth: 209,
                compactWidth: 52,
              ),
              selected: state.selectedIndex,
              onChanged: (index) {
                context.read<NavigationPaneCubit>().setSelectedIndex(index);
              },
              footerItems: [
                PaneItem(
                  icon: IconPaneItem(type: PaneItemType.settings),
                  title: Text(
                    context.tr(PaneItemType.settings.name),
                    style: TextStyle(
                      color: AppTheme.of(
                        context,
                      ).extension<PanePallet>()!.itemColor,
                    ),
                  ),
                  body: SettingsScreen(),
                ),
                PaneItem(
                  icon: IconPaneItem(type: PaneItemType.faqs),
                  title: Text(
                    context.tr(PaneItemType.faqs.name),
                    style: TextStyle(
                      color: AppTheme.of(
                        context,
                      ).extension<PanePallet>()!.itemColor,
                    ),
                  ),
                  body: FaqScreen(),
                ),
                PaneItem(
                  icon: IconPaneItem(type: PaneItemType.about),
                  title: Text(
                    context.tr(PaneItemType.about.name),
                    style: TextStyle(
                      color: AppTheme.of(
                        context,
                      ).extension<PanePallet>()!.itemColor,
                    ),
                  ),
                  body: AboutUsScreen(),
                ),
              ],
              items: [
                PaneItem(
                  icon: IconPaneItem(type: PaneItemType.home),
                  title: Text(
                    context.tr(PaneItemType.home.name),
                    style: TextStyle(
                      color: AppTheme.of(
                        context,
                      ).extension<PanePallet>()!.itemColor,
                    ),
                  ),
                  body: DashboardHomeScreen(),
                ),
                PaneItem(
                  icon: IconPaneItem(type: PaneItemType.transaction),
                  title: Text(
                    context.tr(PaneItemType.transaction.name),
                    style: TextStyle(
                      color: AppTheme.of(
                        context,
                      ).extension<PanePallet>()!.itemColor,
                    ),
                  ),
                  body: MultiBlocProvider(
                    providers: [
                      BlocProvider<TransactionTypeCubit>(
                        create: (_) => TransactionTypeCubit(),
                      ),
                      BlocProvider<TransactionStepCubit>(
                        create: (_) => TransactionStepCubit(),
                      ),
                      BlocProvider<TransferFormValidation>(
                        create: (_) => TransferFormValidation(),
                      ),
                      BlocProvider<BondFormValidation>(
                        create: (_) => BondFormValidation(),
                      ),
                      BlocProvider<UnBondFormValidation>(
                        create: (_) => UnBondFormValidation(),
                      ),
                      BlocProvider<WithdrawFormValidation>(
                        create: (_) => WithdrawFormValidation(),
                      ),
                    ],
                    child: TransactionsScreen(),
                  ),
                ),
                PaneItem(
                  icon: IconPaneItem(type: PaneItemType.wallet),
                  title: Text(
                    context.tr(PaneItemType.wallet.name),
                    style: TextStyle(
                      color: AppTheme.of(
                        context,
                      ).extension<PanePallet>()!.itemColor,
                    ),
                  ),
                  body: WalletScreen(),
                ),
                PaneItem(
                  icon: IconPaneItem(type: PaneItemType.nodeLogs),
                  title: Text(
                    context.tr(PaneItemType.nodeLogs.name),
                    style: TextStyle(
                      color: AppTheme.of(
                        context,
                      ).extension<PanePallet>()!.itemColor,
                    ),
                  ),
                  body: NodeLogsScreen(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
