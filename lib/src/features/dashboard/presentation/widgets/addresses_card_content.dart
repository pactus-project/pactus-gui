import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pactus_grpc/exports/blockchain.dart'
    show GetValidatorRequest;
import 'package:pactus_gui/src/core/common/widgets/shimmer_card_item.dart';
import 'package:pactus_gui/src/core/di/locator.dart' show getIt;
import 'package:pactus_gui/src/features/dashboard/presentation/widgets/addresses_card_content_item.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/presentation/bloc/blockchain_get_info_bloc.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_addresses/data/models/get_node_addresse_model.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/presentation/bloc/get_validator_bloc.dart'
    show GetValidatorBloc, GetValidatorEvent, GetValidatorState;


class AddressesCardContent extends StatelessWidget {
  const AddressesCardContent({super.key, required this.contact});

  final AddressModel contact;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetValidatorBloc>(
          create: (_) => GetValidatorBloc(getIt())
            ..add(
              GetValidatorEvent.fetch(
                params: GetValidatorRequest(address: contact.address),
              ),
            ),
        ),
      ],
      child: SizedBox(
        height: 24,
        child: Row(
          spacing: 4,
          children: [
            SimpleTextCard(text: '${contact.label} ${contact.id}', width: 80),
            TooltipTextCard(text: contact.address, width: 200),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlocBuilder<GetValidatorBloc, GetValidatorState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => ShimmerCardItem(width: 35),
                        error: (string) => SimpleTextCard(
                          width: 35,
                          textAlign: TextAlign.center,
                          text: '0.0',
                        ),
                        loaded: (response) {
                          return SimpleTextCard(
                            width: 35,
                            textAlign: TextAlign.center,
                            text: '${response.validatorStack / 1000000000}',
                          );
                        },
                      );
                    },
                  ),
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
                          return SimpleTextCard(text: result, width: 32);
                        },
                      );
                    },
                  ),
                  BlocBuilder<GetValidatorBloc, GetValidatorState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => ShimmerCardItem(width: 35),
                        error: (string) => SimpleTextCard(
                          height: 24,
                          width: 35,
                          textAlign: TextAlign.center,
                          text: '0.0',
                        ),
                        loaded: (response) {
                          return SimpleTextCard(
                            height: 24,
                            width: 35,
                            textAlign: TextAlign.center,
                            text: '${response.validatorAvailabilityScore}',
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
