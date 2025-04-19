import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/features/dashboard/presentation/widgets/addresses_card_header_item.dart';

class AddressesCardHeader extends StatelessWidget {
  const AddressesCardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        AddressesCardHeaderItem(label: 'Label', size: 120),
        AddressesCardHeaderItem(label: 'Address', size: 284),
        AddressesCardHeaderItem(label: 'Stake', size: 48),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AddressesCardHeaderItem(label: 'Committee', size: null),
              AddressesCardHeaderItem(label: 'Score', size: null),
            ],
          ),
        ),
      ],
    );
  }
}
