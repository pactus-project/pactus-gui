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
  fiveSeconds(Duration(seconds: 5)),
  tenSeconds(Duration(seconds: 10)),
  fifteenSeconds(Duration(seconds: 15));

  const DelayTime(this.duration);

  final Duration duration;
}
