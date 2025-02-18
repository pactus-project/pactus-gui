import 'dart:io';

Future<bool> isNotEmptyDirectory({required String text}) async {
  final directory = Directory(text);
  if (!directory.existsSync()) {
    try {
      await directory.create(recursive: true);
    } on Exception catch (_) {}
  }
  return directory.listSync().isNotEmpty;
}
