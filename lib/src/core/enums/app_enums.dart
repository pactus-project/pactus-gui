enum ValidatorQty {
  seven(
    qty: 7,
  ),
  twentyFour(
    qty: 24,
  ),
  thirtyTwo(
    qty: 32,
  );

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

enum DialogType {
  warning,
  info,
  succeed,
  error,
  normal,
}
