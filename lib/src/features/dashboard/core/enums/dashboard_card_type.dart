import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';

enum DashboardCardType {
  committeeSize(
    title: LocaleKeys.committeeSize,
    asset: 'assets/icons/ic_committee_size.svg',
  ),
  numberOfValidators(
    title:LocaleKeys.numberOfValidators,
    asset: 'assets/icons/ic_validators.svg',
  ),
  committeePower(
    title: LocaleKeys.committeePower,
    asset: 'assets/icons/ic_committee_power.svg',
  ),
  totalPower(
    title: LocaleKeys.totalPower,
    asset: 'assets/icons/ic_total_power.svg',
  );

  const DashboardCardType({
    required this.title,
    required this.asset,
  });
  final String title;
  final String asset;
}
