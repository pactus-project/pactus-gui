import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/shimmer_card_item.dart';
import 'package:pactus_gui/src/features/dashboard/core/extensions/list_validator_info_extension.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/widgets/addresses_card_content_item.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/presentation/bloc/blockchain_get_info_bloc.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_addresses/data/models/get_node_addresse_model.dart';

class AddressesCardContent extends StatelessWidget {
  const AddressesCardContent({super.key, required this.contact});

  final AddressModel contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        AddressesCardContentItem(contact: contact.label, width: 120),
        AddressesCardContentItem(contact: contact.address, width: 296),
        BlocBuilder<BlockchainGetInfoBloc, BlockchainGetInfoState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => ShimmerCardItem(width: 100),
              loaded: (response) {
                final stakeValue =
                    response.committeeValidators
                        .getByAddress(contact.address)
                        ?.stake
                        .toInt() ??
                    0;
                final result =
                    (double.tryParse('${stakeValue / 1000000000}') ?? 0.0)
                        .toStringAsFixed(2)
                        .replaceAll(RegExp(r'\.0+$'), '');

                return AddressesCardContentItem(
                  contact: result == '0' ? '' : result,
                  width: 32,
                );
              },
            );
          },
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              BlocBuilder<BlockchainGetInfoBloc, BlockchainGetInfoState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => ShimmerCardItem(width: 48),
                    loaded: (response) {
                      final result =
                          response.committeeValidators.any(
                            (item) => item.address == contact.address,
                          )
                          ? 'Yes'
                          : 'No';
                      return AddressesCardContentItem(
                        contact: result,
                        width: 32,
                      );
                    },
                  );
                },
              ),
              BlocBuilder<BlockchainGetInfoBloc, BlockchainGetInfoState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => ShimmerCardItem(width: 32),
                    loaded: (response) {
                      return AddressesCardContentItem(
                        contact:
                            (response.committeeValidators
                                        .getByAddress(contact.address)
                                        ?.availabilityScore ??
                                    '')
                                .toString(),
                        width: 32,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
