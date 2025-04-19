enum DashboardCardType {
  committeeSize(
    title: 'Committee Size',
    asset: 'assets/icons/ic_committee_size.svg',
  ),
  numberOfValidators(
    title: 'Number of Validators',
    asset: 'assets/icons/ic_validators.svg',
  ),
  committeePower(
    title: 'Committee Power',
    asset: 'assets/icons/ic_committee_power.svg',
  ),
  totalPower(
    title: 'Total Power',
    asset: 'assets/icons/ic_total_power.svg',
  );

  const DashboardCardType({
    required this.title,
    required this.asset,
  });
  final String title;
  final String asset;
}
