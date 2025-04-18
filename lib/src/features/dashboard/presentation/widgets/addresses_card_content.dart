import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/features/dashboard/presentation/widgets/addresses_card_content_item.dart';
import 'package:gui/src/features/dashboard/sub_modules/get_node_addresses/data/models/get_node_addresse_model.dart';

class AddressesCardContent extends StatelessWidget {
  const AddressesCardContent({
    super.key,
    required this.contact,
  });

  final AddressModel contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        AddressesCardContentItem(contact: contact.label, width: 120),
        AddressesCardContentItem(contact: contact.address, width: 296),
        Builder(
          builder: (context) {
            final content = (double.tryParse('9.88888') ?? 0.0)
                .toStringAsFixed(2)
                .replaceAll(RegExp(r'\.0+$'), '');
            return AddressesCardContentItem(
              contact: content,
              width: 38,
              textAlign: TextAlign.center,
            );
          },
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              AddressesCardContentItem(contact: 'Yes', width: 32),
              AddressesCardContentItem(contact: '1.0', width: 32),
            ],
          ),
        ),
      ],
    );
  }
}
