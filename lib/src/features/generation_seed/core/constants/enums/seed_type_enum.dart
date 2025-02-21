enum SeedTypeEnum {
  none(0, 'no words'),
  twelve(1, '12 words'),
  twentyFour(2, '24 words');

  const SeedTypeEnum(
      this.id,
      this.text,
      );
  final int id;
  final String text;
}