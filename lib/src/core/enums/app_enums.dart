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
