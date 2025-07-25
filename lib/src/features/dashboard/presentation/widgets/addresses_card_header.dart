import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/widgets/addresses_card_header_item.dart';

class AddressesCardHeader extends StatelessWidget {
  const AddressesCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        AddressesCardHeaderItem(label: LocaleKeys.label, size: 120),
        AddressesCardHeaderItem(label: LocaleKeys.address, size: 284),
        AddressesCardHeaderItem(label: LocaleKeys.stake, size: 48),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AddressesCardHeaderItem(label: LocaleKeys.committee, size: null),
              AddressesCardHeaderItem(label: LocaleKeys.score, size: null),
            ],
          ),
        ),
      ],
    );
  }
}
