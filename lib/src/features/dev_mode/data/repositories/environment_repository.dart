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

    final parentDirPathAndSelectedNet = '${parentDir.path}/$latestPartOfPath';
    //print('Full directory path to check: $parentDirPathAndSelectedNet');

    final dirSelectedNet = Directory(parentDirPathAndSelectedNet);

    // Check if directory exists
    if (dirSelectedNet.existsSync()) {
      //print('Directory already exists at: $parentDirPathAndSelectedNet');

      // Check directory contents
      final contents = dirSelectedNet.listSync();
      if (contents.isEmpty) {
        // print('✅ Directory is EMPTY (ready for use)');
        return false;
      } else {
        //print('⚠️ Directory is NOT empty
        // (contains ${contents.length} items)');
        return true;
      }
    } else {
      //print('Directory does not exist at: $parentDirPathAndSelectedNet');

      // Try to create directory
      try {
        //print('Attempting to create directory...');
        /*final createdDir =*/
        await dirSelectedNet.create(recursive: true);
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

  Future<Directory> detectCurrentDirectoryForInitNode({
    required String latestPartOfPath,
  }) async {
    final parentDir = Directory.current.parent;
    //print('Checking parent directory: ${parentDir.path}');

    final parentDirPathAndSelectedNet = '${parentDir.path}/$latestPartOfPath';
    //print('Full directory path to check: $parentDirPathAndSelectedNet');

    final dirSelectedNet = Directory(parentDirPathAndSelectedNet);
    return Future<Directory>.value(dirSelectedNet);
  }
}
