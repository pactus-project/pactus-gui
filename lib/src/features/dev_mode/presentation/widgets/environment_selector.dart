import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/enums/app_environment.dart';
import 'package:gui/src/features/dev_mode/data/repositories/environment_repository.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/directory_checker_bloc_widget.dart';

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
        DirectoryCheckerBlocWidget(
          textStyle: textStyle,
          appEnvironment: AppEnvironment.mainnet,
        ),
        DirectoryCheckerBlocWidget(
          textStyle: textStyle,
          appEnvironment: AppEnvironment.testnet,
        ),
        DirectoryCheckerBlocWidget(
          textStyle: textStyle,
          appEnvironment: AppEnvironment.localnet,
        ),
      ],
    );
  }
}
