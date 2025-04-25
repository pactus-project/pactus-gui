import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';

enum DashboardCardType {
  committeeSize(
    title: LocaleKeys.committee_size,
    asset: 'assets/icons/ic_committee_size.svg',
  ),
  numberOfValidators(
    title: LocaleKeys.number_of_validators,
    asset: 'assets/icons/ic_validators.svg',
  ),
  committeePower(
    title: LocaleKeys.committee_power,
    asset: 'assets/icons/ic_committee_power.svg',
  ),
  totalPower(
    title: LocaleKeys.total_power,
    asset: 'assets/icons/ic_total_power.svg',
  );

  const DashboardCardType({
    required this.title,
    required this.asset,
  });
  final String title;
  final String asset;
}
