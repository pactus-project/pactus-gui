import 'dart:io';

class EnvironmentRepository {
  /// ## [isDirectoryReadyForNode] Function Documentation
  ///
  /// Checks if directory is ready for new node creation.
  /// Returns `true` when:
  ///   - Directory doesn't exist (and gets created successfully), OR
  ///   - Directory exists but is empty
  /// Returns `false` when:
  ///   - Directory exists AND contains files (pre-existing node detected)
  ///   - Any filesystem error occurs
  Future<bool> isDirectoryReadyForNode({
    required String latestPartOfPath,
  }) async {
    final parentDir = Directory.current.parent;
    //print('Checking parent directory: ${parentDir.path}');

    final parentDirPathAndLocalNet = '${parentDir.path}/$latestPartOfPath';
    //print('Full directory path to check: $parentDirPathAndLocalNet');

    final dirLocalNet = Directory(parentDirPathAndLocalNet);

    // Check if directory exists
    if (dirLocalNet.existsSync()) {
      //print('Directory already exists at: $parentDirPathAndLocalNet');

      // Check directory contents
      final contents = dirLocalNet.listSync();
      if (contents.isEmpty) {
        // print('✅ Directory is EMPTY (ready for use)');
        return false;
      } else {
        //print('⚠️ Directory is NOT empty
        // (contains ${contents.length} items)');
        return true;
      }
    } else {
      //print('Directory does not exist at: $parentDirPathAndLocalNet');

      // Try to create directory
      try {
        //print('Attempting to create directory...');
        /*final createdDir =*/ await dirLocalNet.create(recursive: true);
        //print('✅ Successfully created directory at: ${createdDir.path}');
        //print('✅ Directory is EMPTY (ready for use)');
        return false;
      } on PathNotFoundException catch (_) {
        //print('❌ Path creation failed (PathNotFoundException): $e');
        rethrow;
      } on Exception catch (_) {
        //print('❌ Path creation failed (Exception): $e');
        rethrow;
      }
    }
  }
}
