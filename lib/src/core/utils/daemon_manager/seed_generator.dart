import 'dart:math';
import 'dart:typed_data';
import 'package:bcrypt/bcrypt.dart';
import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:convert/convert.dart';

class SeedGenerator {
  Mnemonic? generateSeed(int wordCount) {
    Mnemonic? mnemonic;
    try {
      // Determine the entropy length based on the word count
      final entropyLength = (wordCount == 12)
          ? 128
          : (wordCount == 24)
              ? 256
              : 128;

      // Generate secure random bytes for entropy
      final secureRandomBytes = generateSecureRandomBytes(entropyLength ~/ 8);

      // Generate a secure passphrase
      final securePassphrase = generateSecurePassphrase(secureRandomBytes);

      // Generate the mnemonic based on the entropy and passphrase
      mnemonic = Mnemonic.generate(
        Language.english,
        passphrase: securePassphrase,
        entropyLength: entropyLength,
      );
    } on Exception catch (_) {
      throw Exception('Error generating seed!');
    }
    return mnemonic;
  }

  Uint8List generateSecureRandomBytes(int length) {
    final random = Random.secure();
    final randomBytes = List<int>.generate(length, (_) => random.nextInt(256));
    return Uint8List.fromList(randomBytes);
  }

  String generateSecurePassphrase(Uint8List randomBytes) {
    final bcryptHash = BCrypt.hashpw(hex.encode(randomBytes), BCrypt.gensalt());
    return bcryptHash;
  }
}
