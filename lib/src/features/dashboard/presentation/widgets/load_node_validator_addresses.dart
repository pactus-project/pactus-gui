import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/shimmer_card_item.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/widgets/addresses_card_content.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/widgets/addresses_card_header.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_addresses/data/mappers/get_node_addresses_mapper.dart';

class LoadNodeValidatorAddresses extends StatefulWidget {
  const LoadNodeValidatorAddresses({super.key});

  @override
  State<LoadNodeValidatorAddresses> createState() =>
      _LoadNodeValidatorAddressesState();
}

class _LoadNodeValidatorAddressesState
    extends State<LoadNodeValidatorAddresses> {
  @override
  void initState() {
    super.initState();
    context.read<DaemonManagerBloc>().add(
          RunGetNodeValidatorAddressesCommand(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaemonManagerBloc, DaemonManagerState>(
      builder: (context, state) {
        if (state is DaemonManagerSuccess) {
          final result = state.output;
          final list = AddressMapper.fromText(result);
          return SizedBox(
            height: 230,
            width: 660,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    AddressesCardHeader(),
                    SizedBox(
                      height: 180,
                      width: 660,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          final contact = list[index];
                          return Column(
                            children: [
                              AddressesCardContent(contact: contact),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return ShimmerCardItem();
        }
      },
    );
  }
}
