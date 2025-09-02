import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_addresses/data/models/get_node_addresse_model.dart';

mixin AddressMapper {
  static List<AddressModel> fromText(String inputText) {
    final lines = inputText.split('\n');
    return lines
        .where((line) => line.trim().isNotEmpty)
        .map(_parseLine)
        .toList();
  }

  static AddressModel _parseLine(String line) {
    final parts = line.split('-');
    if (parts.length < 2) {
      throw FormatException('Invalid address format in line: $line');
    }

    final id = int.tryParse(parts[0].trim()) ?? 0;
    final remainingParts = parts[1].trim().split(RegExp(r'\s+'));

    if (remainingParts.isEmpty) {
      throw FormatException('Missing address in line: $line');
    }

    return AddressModel(
      // set id , only to validators
      id: (id == 1 ? '' : id - 1).toString(),
      address: remainingParts[0].trim(),
      label: remainingParts[1].trim(),
    );
  }

  static String toText(List<AddressModel> addresses) {
    return addresses
        .map((address) => '${address.id}- ${address.address} ${address.label}')
        .join('\n');
  }
}
