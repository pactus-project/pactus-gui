extension StringManipulationExtensions on String {
  String replaceHashWithSpecialCharacter() {
    return replaceAll('#', '’'); // Replace # with two spaces
  }
}
