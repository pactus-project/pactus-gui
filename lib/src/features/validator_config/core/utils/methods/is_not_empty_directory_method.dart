import 'dart:io';
/// ## [isNotEmptyDirectory] Function Documentation
///
/// Checks if the given directory is not empty.
/// If the directory does not exist, it attempts to create it.
///
/// ### Parameters:
///
/// - **[text]** (String, required):
///   - The path of the directory to check.
///
/// ### Returns:
///
/// - **[Future<bool>]**:
///   - `true` if the directory exists and contains files/folders.
///   - `false` if the directory is empty or could not be created.
///
Future<bool> isNotEmptyDirectory({required String text}) async {
  final directory = Directory(text);
  if (!directory.existsSync()) {
    try {
      await directory.create(recursive: true);
    } on Exception catch (_) {}
  }
  return directory.listSync().isNotEmpty;
}
