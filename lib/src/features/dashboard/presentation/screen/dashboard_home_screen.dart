import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart';
import 'package:pactus_gui/src/features/dashboard/core/enums/dashboard_card_type.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/widgets/dashboard_card_widget.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/widgets/load_node_validator_addresses.dart'
    show LoadNodeValidatorAddresses;

class DashboardHomeScreen extends StatelessWidget {
  const DashboardHomeScreen({super.key});

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
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 32),
                child: LoadNodeValidatorAddresses(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
