import 'dart:io';

import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:path/path.dart' as path;

mixin FileRemover {
  /// Deletes a file at the specified path
  /// Returns true if successful, false otherwise
  static Future<bool> deleteFile({
    required String directoryPath,
    required String fileName,
  }) async {
    try {
      // Normalize the path for the current OS
      final fullPath = path.join(directoryPath, fileName);
      final file = File(fullPath);

      // Check if file exists
      //ignore:avoid_slow_async_io
      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } on Exception catch (e) {
      printDebug('Error deleting file: $e');
      return false;
    }
  }

  /// Deletes a file with error handling and platform-specific considerations
  static Future<FileDeleteResult> deleteFileWithChecks({
    required String directoryPath,
    required String fileName,
  }) async {
    try {
      final fullPath = path.join(directoryPath, fileName);
      final file = File(fullPath);

      //ignore:avoid_slow_async_io
      if (!await file.exists()) {
        return FileDeleteResult(
          success: false,
          error: 'File does not exist',
          path: fullPath,
        );
      }

      // Platform-specific checks
      if (Platform.isLinux || Platform.isMacOS) {
        // Check execute permission on Unix-like systems
        //ignore:avoid_slow_async_io
        final stat = await file.stat();
        if (stat.mode & 0x100 == 0) {
          // Check if owner has execute permission
          return FileDeleteResult(
            success: false,
            error: 'Insufficient permissions (need execute permission)',
            path: fullPath,
          );
        }
      }

      await file.delete();
      return FileDeleteResult(
        success: true,
        path: fullPath,
      );
    } on Exception catch (e) {
      return FileDeleteResult(
        success: false,
        error: e.toString(),
        path: path.join(directoryPath, fileName),
      );
    }
  }
}

class FileDeleteResult {
  FileDeleteResult({
    required this.success,
    this.error,
    required this.path,
  });
  final bool success;
  final String? error;
  final String path;
}
