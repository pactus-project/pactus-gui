class AddressModel {
  AddressModel({required this.id, required this.address, required this.label});
  final String id;
  final String address;
  final String label;

  @override
  String toString() {
    return 'AddressModel{id: $id, address: $address, label: $label}';
  }
}
