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

/// Enum representing different types of addresses in the system.
enum AddressType {
  /// Wallet address type, typically used for user accounts
  wallet,

  /// Validator address type, typically used for network validators
  validator,
}

enum InputFilter {
  numbersOnly(
    pattern: r'[0-9]',
    description: 'Numbers only (0-9)',
    example: '12345',
  ),

  numbersWithDecimal(
    // Use per-character pattern (so typing works properly)
    pattern: r'[0-9.]',
    description: 'Numbers and decimal point',
    example: '123.45',
  ),

  lettersOnly(
    pattern: r'[a-zA-Z]',
    description: 'Letters only (a-z, A-Z)',
    example: 'HelloWorld',
  ),

  alphanumeric(
    pattern: r'[a-zA-Z0-9]',
    description: 'Letters and numbers only',
    example: 'User123',
  ),

  uppercaseAlphanumeric(
    pattern: r'[A-Z0-9]',
    description: 'Uppercase letters and numbers',
    example: 'CODE123',
  ),

  uppercaseAlphanumericWithHyphen(
    pattern: r'[A-Z0-9-]',
    description: 'Uppercase letters, numbers, and hyphens',
    example: 'PRODUCT-CODE-001',
  ),

  lowercaseAlphanumericWithUnderscore(
    pattern: r'[a-z0-9_]',
    description: 'Lowercase letters, numbers, and underscore',
    example: 'user_name123',
  ),

  email(
    pattern: r'[a-zA-Z0-9@._-]',
    description: 'Email address characters',
    example: 'user@example.com',
  ),

  custom(
    pattern: null,
    description: 'Custom pattern',
    example: 'Set your own regex',
  ),

  any(
    pattern: null,
    description: 'Any character (no restrictions)',
    example: 'Free text input',
  );

  const InputFilter({
    required this.pattern,
    required this.description,
    required this.example,
  });

  final String? pattern;
  final String description;
  final String example;

  String get displayName => toString().split('.').last;

  RegExp? get regExp => pattern == null ? null : RegExp(pattern!);

  bool allows(String character) {
    if (pattern == null) {
      return true;
    }
    return regExp!.hasMatch(character);
  }

  String filter(String input) {
    if (pattern == null) {
      return input;
    }

    // ✨ Special case for decimals
    if (this == InputFilter.numbersWithDecimal) {
      // Remove invalid characters first
      var cleaned = input.replaceAll(RegExp(r'[^0-9.]'), '');
      // Allow only one dot
      final dotIndex = cleaned.indexOf('.');
      if (dotIndex != -1) {
        // Keep only the first dot
        cleaned =
            cleaned.substring(0, dotIndex + 1) +
            cleaned.substring(dotIndex + 1).replaceAll('.', '');
      }
      return cleaned;
    }

    // FIX: Use StringBuffer for better performance
    final buffer = StringBuffer();
    for (var i = 0; i < input.length; i++) {
      final character = input[i];
      if (allows(character)) {
        buffer.write(character);
      }
    }
    return buffer.toString();
  }
}
