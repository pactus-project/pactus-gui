import 'dart:io';

import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:path/path.dart' as path;

mixin ProcessCloserManager {
  // Terminates all running processes from a specific directory path.
  static Future<int> closeProcessesByPath({
    required String directoryPath,
    String? executableName,
  }) async {
    var closedCount = 0;

    try {
      if (Platform.isWindows) {
        // Windows OS
        final processes = await _getWindowsProcesses();
        for (final process in processes) {
          if (_isProcessInDirectory(process, directoryPath, executableName)) {
            await _killWindowsProcess(process.pid);
            closedCount++;
          }
        }
      } else {
        // Non-Windows OS
        final processes = await _getLinuxProcesses();
        for (final process in processes) {
          if (_isProcessInDirectory(process, directoryPath, executableName)) {
            await _killLinuxProcess(process.pid);
            closedCount++;
          }
        }
      }
    } on Exception catch (e) {
      printDebug('Error closing processes : $e');
    }

    return closedCount;
  }

  // Checks whether the process was executed in the specified target directory.
  static bool _isProcessInDirectory(
    ProcessInfo process,
    String directoryPath,
    String? executableName,
  ) {
    try {
      final processPath = process.executablePath;
      if (processPath == null) {
        return false;
      }

      // Checks if an executable name is specified (for matching purposes)
      if (executableName != null) {
        if (!Platform.isWindows &&
            !processPath.contains('$executableName start')) {
          return false;
        }

        if (Platform.isWindows && !processPath.endsWith(executableName)) {
          return false;
        }
      }

      // Normalizes path format for consistent cross-platform comparison
      final normalizedDirPath = path.normalize(directoryPath);
      final normalizedProcessPath = path.normalize(path.dirname(processPath));

      return normalizedProcessPath.startsWith(normalizedDirPath);
    } on Exception catch (_) {
      return false;
    }
  }

// --- Windows Utilities ---
  static Future<List<ProcessInfo>> _getWindowsProcesses() async {
    final result = await Process.run(
      'wmic',
      ['process', 'get', 'ExecutablePath,ProcessId', '/format:list'],
    );
    return _parseWindowsWmicOutput(result.stdout.toString());
  }

  static List<ProcessInfo> _parseWindowsWmicOutput(String output) {
    final processes = <ProcessInfo>[];
    final lines = output.split('\n');

    String? currentPath;
    int? currentPid;

    for (final line in lines) {
      if (line.startsWith('ExecutablePath=')) {
        currentPath = line.substring('ExecutablePath='.length).trim();
      } else if (line.startsWith('ProcessId=')) {
        currentPid = int.tryParse(line.substring('ProcessId='.length).trim());
      }

      if (currentPath != null && currentPid != null) {
        processes
            .add(ProcessInfo(pid: currentPid, executablePath: currentPath));
        currentPath = null;
        currentPid = null;
      }
    }

    return processes;
  }

  static Future<void> _killWindowsProcess(int pid) async {
    await Process.run('taskkill', ['/pid', pid.toString(), '/f']);
  }

// --- Linux Utilities ---
  static Future<List<ProcessInfo>> _getLinuxProcesses() async {
    final result = await Process.run('ps', ['-eo', 'pid,cmd']);
    return _parseLinuxPsOutput(result.stdout.toString());
  }

  static List<ProcessInfo> _parseLinuxPsOutput(String output) {
    final processes = <ProcessInfo>[];
    final lines = output.split('\n').skip(1); // Skips the header line

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) {
        continue;
      }

      final pidEnd = trimmed.indexOf(' ');
      if (pidEnd <= 0) {
        continue;
      }

      final pid = int.tryParse(trimmed.substring(0, pidEnd));
      if (pid == null) {
        continue;
      }

      final cmd = trimmed.substring(pidEnd).trim();
      processes.add(ProcessInfo(pid: pid, executablePath: cmd));
    }

    return processes;
  }

  static Future<void> _killLinuxProcess(int pid) async {
    await Process.run('kill', ['-9', pid.toString()]);
  }
}

class ProcessInfo {
  ProcessInfo({required this.pid, this.executablePath});
  final int pid;
  final String? executablePath;
}
