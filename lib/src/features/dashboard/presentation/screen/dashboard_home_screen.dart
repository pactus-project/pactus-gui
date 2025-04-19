import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart';
import 'package:gui/src/features/dashboard/core/enums/dashboard_card_type.dart';
import 'package:gui/src/features/dashboard/presentation/widgets/dashboard_card_widget.dart';
import 'package:gui/src/features/dashboard/presentation/widgets/load_node_validator_addresses.dart';

class DashboardHomeScreen extends StatelessWidget {
  const DashboardHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (_) => DaemonManagerBloc(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 32,
                  start: 32,
                  bottom: 32,
                ),
                child: Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: [
                    DashboardCardWidget(
                      dashboardCardType: DashboardCardType.committeeSize,
                    ),
                    DashboardCardWidget(
                      dashboardCardType: DashboardCardType.committeePower,
                    ),
                    DashboardCardWidget(
                      dashboardCardType: DashboardCardType.numberOfValidators,
                    ),
                    DashboardCardWidget(
                      dashboardCardType: DashboardCardType.totalPower,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 32),
                child: LoadNodeValidatorAddresses(),
              ),
            ),

            // Container(color: Colors.red,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8),
            //     child: BlocBuilder<GetValidatorAddressesBloc,
            //         GetValidatorAddressesState>(
            //       builder: (context, state) {
            //         return state.maybeWhen(
            //           orElse: ProgressRing.new,
            //           loaded: (response) => Text(
            //             '${response.addresses.length} / ${response.addresses.first}',
            //             style: TextStyle(color: Colors.green),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
