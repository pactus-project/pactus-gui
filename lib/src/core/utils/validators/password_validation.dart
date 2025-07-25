import 'dart:async';

import 'package:rxdart/rxdart.dart';

class PasswordValidation {
  final _password = BehaviorSubject<String>();

  Stream<String> get password => _password.stream.transform(_validatePassword);

  void Function(String) get changePassword => _password.sink.add;

  static final _validatePassword =
      StreamTransformer<String, String>.fromHandlers(
        handleData: (password, sink) {
          const passwordPattern =
              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@!])[a-zA-Z0-9@!]{8,}$';
          if (password.isEmpty) {
            sink.addError('Password cannot be empty');
          } else if (!RegExp(passwordPattern).hasMatch(password)) {
            sink.addError(
              'Password must be at least 8 characters,contain\n'
              'uppercase, lowercase, and special character (@!)',
            );
          } else {
            sink.add(password);
          }
        },
      );

  // Cleanup
  void dispose() {
    _password.close();
  }
}
