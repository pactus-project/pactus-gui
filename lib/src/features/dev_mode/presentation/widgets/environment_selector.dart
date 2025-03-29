import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/widgets/shimmer_card_item.dart';
import 'package:gui/src/core/enums/app_environment.dart';
import 'package:gui/src/features/dev_mode/data/repositories/environment_repository.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/environment_radio_option.dart';

class EnvironmentSelector extends StatelessWidget {
  const EnvironmentSelector({super.key, required this.textStyle});
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final repository = context.read<EnvironmentRepository>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FutureBuilder<bool>(
          future: repository.isDirectoryReadyForNode(
            latestPartOfPath: AppEnvironment.mainnet.name,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerCardItem(
                height: 36,
                width: 120,
              );
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}', style: textStyle);
            }

            final canCreate = snapshot.data == true;

            return EnvironmentRadioOption(
              environment: AppEnvironment.mainnet,
              textStyle: textStyle,
              isEnabled: !canCreate,
              disabledMessage:
                  canCreate ? 'Mainnet directory already contains files' : null,
            );
          },
        ),
        FutureBuilder<bool>(
          future: repository.isDirectoryReadyForNode(
            latestPartOfPath: AppEnvironment.testnet.name,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerCardItem(
                height: 36,
                width: 120,
              );
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}', style: textStyle);
            }

            final canCreate = snapshot.data == true;

            return EnvironmentRadioOption(
              environment: AppEnvironment.testnet,
              textStyle: textStyle,
              isEnabled: !canCreate,
              disabledMessage:
                  canCreate ? 'Testnet directory already contains files' : null,
            );
          },
        ),
        FutureBuilder<bool>(
          future: repository.isDirectoryReadyForNode(
            latestPartOfPath: AppEnvironment.localnet.name,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerCardItem(
                height: 36,
                width: 120,
              );
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}', style: textStyle);
            }

            final canCreate = snapshot.data == true;

            return EnvironmentRadioOption(
              environment: AppEnvironment.localnet,
              textStyle: textStyle,
              isEnabled: !canCreate,
              disabledMessage: canCreate
                  ? 'Localnet directory already contains files'
                  : null,
            );
          },
        ),
      ],
    );
  }
}
