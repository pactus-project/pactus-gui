import 'dart:io';
import 'package:flutter_app_info/package_info_plus.dart' show PackageInfo;
import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:path/path.dart' as path;

/// ## [createNodeDirectory] Function Documentation
///
/// Creates a new Pactus node directory with version-specific naming inside
/// the specified base path.
///
/// Returns the full path of the newly created directory if successful.
/// Returns `null` if the base directory doesn't exist or if creation fails.
/// Silently handles errors with debug logging.
///
/// The generated directory follows the naming pattern: `pactus_node_[version]`
/// where version is derived from the app's package info.
///
/// Example:
/// ```dart
/// final nodeDir = await createNodeDirectory('/user/documents');
/// if (nodeDir != null) {
///   // Success - use the new directory path
///   print('Created node directory at: $nodeDir');
/// }
/// ```

Future<String?> createNodeDirectory(String basePath) async {
  try {
    // Verify base directory exists
    final baseDir = Directory(basePath);
    if (!baseDir.existsSync()) {
      return null;
    }

    // Generate unique directory name
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version.replaceAll('.', '_');
    final dirName = 'pactus_node_$version';

    // Create new directory
    final newPath = path.join(basePath, dirName);
    await Directory(newPath).create(recursive: true);
    return newPath;
  } on Exception catch (e) {
    printDebug('Directory creation error: $e');
    return null;
  }
}
