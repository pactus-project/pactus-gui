import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';

enum PaneItemType {
  home(
    id: 0,
    asset: 'assets/icons/ic_dashboard.svg',
    name: LocaleKeys.dashboard,
  ),
  transaction(
    id: 1,
    asset: 'assets/icons/ic_transaction.svg',
    name: LocaleKeys.transaction,
  ),
  wallet(id: 2, asset: 'assets/icons/ic_wallet.svg', name: LocaleKeys.wallet),
  nodeLogs(
    id: 3,
    name: LocaleKeys.node_logs,
    asset: 'assets/icons/ic_node_logs.svg',
  ),
  settings(
    id: 4,
    name: LocaleKeys.settings,
    asset: 'assets/icons/ic_settings.svg',
  ),
  faqs(id: 5, name: LocaleKeys.faqs, asset: 'assets/icons/ic_faqs.svg'),
  about(id: 6, name: LocaleKeys.about, asset: 'assets/icons/ic_about_us.svg');

  const PaneItemType({
    required this.id,
    required this.asset,
    required this.name,
  });
  final String asset;
  final String name;
  final int id;
}
