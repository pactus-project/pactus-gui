import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/widgets/shimmer_card_item.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart';

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
          return Text(
            state.output,
            style: TextStyle(color: Colors.green),
          );
        } else {
          return ShimmerCardItem();
        }
      },
    );
  }
}
