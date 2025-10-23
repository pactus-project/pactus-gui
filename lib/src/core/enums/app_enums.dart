import '../utils/gen/localization/locale_keys.dart';

enum ValidatorQty {
  seven(qty: 7),
  twentyFour(qty: 24),
  thirtyTwo(qty: 32);

  const ValidatorQty({required this.qty});

  final int qty;
}

enum InitialMode { remote, create, restore }

enum DelayTime {
  zero(Duration.zero),
  oneSeconds(Duration(seconds: 1)),
  twoSeconds(Duration(seconds: 2)),
  threeSeconds(Duration(seconds: 3)),
  fiveSeconds(Duration(seconds: 5)),
  tenSeconds(Duration(seconds: 10)),
  fifteenSeconds(Duration(seconds: 15));

  const DelayTime(this.duration);

  final Duration duration;
}

enum DialogType { warning, info, succeed, error, normal }

enum TransactionType {
  withdraw(LocaleKeys.withdraw, 0),
  bond(LocaleKeys.bond, 1),
  unbond(LocaleKeys.unbond, 2),
  transfer(LocaleKeys.transfer, 3);

  const TransactionType(this.title, this.id);

  final String title;
  final int id;
}

enum TransactionStep {
  transactionForm(LocaleKeys.transaction_form, 0),
  confirmation(LocaleKeys.confirm, 1),
  result(LocaleKeys.result, 2);

  const TransactionStep(this.title, this.id);

  final String title;
  final int id;
}
