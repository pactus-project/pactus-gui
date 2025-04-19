import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/features/about_us/presentation/screens/about_us_screen.dart';
import 'package:gui/src/features/dashboard/core/enums/pane_item_type.dart';
import 'package:gui/src/features/dashboard/presentation/screen/dashboard_home_screen.dart';
import 'package:gui/src/features/dashboard/presentation/widgets/icon_pane_item.dart';
import 'package:gui/src/features/dashboard/presentation/widgets/title_pane_item.dart';
import 'package:gui/src/features/faq/presentation/screen/faq_screen.dart';
import 'package:gui/src/features/node_logs/presentation/screens/node_logs_screen.dart';
import 'package:gui/src/features/settings/presentation/screens/settings_screen.dart';
import 'package:gui/src/features/transactions/presentation/screens/transactions_screen.dart';
import 'package:gui/src/features/wallet/presentation/screens/wallet_screen.dart';

class PaneItems {
  PaneItems._();

  static final nodeLogs = PaneItem(
    icon: IconPaneItem(
      type: PaneItemType.nodeLogs,
    ),
    title: TitlePaneItem(
      type: PaneItemType.nodeLogs,
    ),
    body: NodeLogsScreen(),
  );

  static final wallet = PaneItem(
    icon: IconPaneItem(
      type: PaneItemType.wallet,
    ),
    title: TitlePaneItem(
      type: PaneItemType.wallet,
    ),
    body: WalletScreen(),
  );

  static final transactions = PaneItem(
    icon: IconPaneItem(
      type: PaneItemType.transaction,
    ),
    title: TitlePaneItem(
      type: PaneItemType.transaction,
    ),
    body: TransactionsScreen(),
  );

  static final home = PaneItem(
    icon: IconPaneItem(
      type: PaneItemType.home,
    ),
    title: TitlePaneItem(
      type: PaneItemType.home,
    ),
    body: DashboardHomeScreen(),
  );

  static final aboutUs = PaneItem(
    icon: IconPaneItem(
      type: PaneItemType.about,
    ),
    title: TitlePaneItem(
      type: PaneItemType.about,
    ),
    body: AboutUsScreen(),
  );

  static final faq = PaneItem(
    icon: IconPaneItem(
      type: PaneItemType.faqs,
    ),
    title: TitlePaneItem(
      type: PaneItemType.faqs,
    ),
    body: FaqScreen(),
  );

  static final settings = PaneItem(
    icon: IconPaneItem(
      type: PaneItemType.settings,
    ),
    title: TitlePaneItem(
      type: PaneItemType.settings,
    ),
    body: SettingsScreen(),
  );
}
