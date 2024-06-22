import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pactus/provider/password_provider.dart';
import 'package:pactus/provider/validator_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final processManagerProvider =
    StateNotifierProvider<ProcessManager, Process?>(ProcessManager.new);

class ProcessManager extends StateNotifier<Process?> {
  ProcessManager(this.ref) : super(null);
  final Ref ref;
  StreamController<String>? _outputController;
  String? _password;
  int? _pid;

  Stream<String> get output =>
      _outputController?.stream ?? const Stream.empty();

  Future<void> startDaemonWithPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    final daemonPath = prefs.getString('daemonPath');
    final dataDirPath = prefs.getString('dataDirPath');

    if (daemonPath == null || dataDirPath == null) {
      throw Exception('Daemon path or data directory path not set');
    }

    await _outputController?.close();
    _outputController = StreamController<String>.broadcast();

    try {
      final param = _paramBuilder(password, ref);
      final process = await Process.start(
        daemonPath,
        ['start', ...param],
        runInShell: true,
        mode: ProcessStartMode.detachedWithStdio,
      );

      state = process;
      _pid = process.pid;

      final stdoutStream = process.stdout.asBroadcastStream();
      stdoutStream
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .listen(
        (data) {
          print(data.toString());
          _outputController?.add(data);
        },
        onDone: () => _outputController?.close(),
        onError: (e) => ContentDialog(
          title: const Text("Error occured"),
          content: Text(e.toString()),
        ),
      );

      final isValid = await _readInitialOutputForValidation(stdoutStream);
      if (!isValid) {
        throw Exception('Invalid password');
      }

      _password = password;
    } on Exception catch (e) {
      // Throw an exception if the process fails to start
      throw Exception('Failed to start the daemon: $e');
    }
  }

  Future<bool> _readInitialOutputForValidation(
    Stream<List<int>> stdoutStream,
  ) async {
    try {
      final output = await stdoutStream
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .first
          .timeout(
            const Duration(seconds: 1),
            onTimeout: () => 'Timeout waiting for output',
          );
      // return output.trim() != 'invalid password';
      return true;
    } on Exception catch (e) {
      ContentDialog(title: Text("error occured"),content: Text(e.toString()));
      return true; // Assume invalid password or error if there's a problem reading the output
    }
  }

  bool isRunning() => _pid != null;

  // Future<void> restartDaemon() async {
  //   final password = _password;

  //   if (password == null) {
  //     throw Exception('No password available for daemon restart');
  //   }

  //   state?.kill();
  //   await startDaemonWithPassword(password);
  // }

  @override
  Future<void> dispose() async {
    await _outputController?.close();
    state?.kill(); // Kill the process when the manager is disposed
    super.dispose();
  }
}

List<String> _paramBuilder(String password, Ref<Object?> ref) {
  ref.read(confirmPasswordProvider.notifier).state = password;
  final passParam = <String>['-p', password];
  final path = Platform.isMacOS || Platform.isLinux
      ? ref.read(dataPathProvider.notifier).state ??
          "${Platform.environment['HOME']!}/wallet"
      : ref.read(dataPathProvider.notifier).state ??
          "${Platform.environment['USERPROFILE']!}/pactus-wallet";
          debugPrint(path);
  return ['-w', path, ...passParam];
}
// Path: lib/provider/validator_provider.dart
