import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/widgets/app_layout.dart';
import 'package:gui/src/core/enums/app_environment.dart';
import 'package:gui/src/features/dev_mode/presentation/bloc/directory_check_bloc.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/environment_selector.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/generate_seed_and_set_password_section.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/header_title_widget.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/submit_button_widget.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class DeveloperModeScreen extends StatefulWidget {
  const DeveloperModeScreen({super.key});

  @override
  State<DeveloperModeScreen> createState() => _DeveloperModeScreenState();
}

class _DeveloperModeScreenState extends State<DeveloperModeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<DirectoryCheckBloc>()
      ..add(
        CheckDirectoryEvent(
          latestPartOfPath: AppEnvironment.mainnet.name,
          networkType: AppEnvironment.mainnet,
        ),
      )
      ..add(
        CheckDirectoryEvent(
          latestPartOfPath: AppEnvironment.testnet.name,
          networkType: AppEnvironment.testnet,
        ),
      )
      ..add(
        CheckDirectoryEvent(
          latestPartOfPath: AppEnvironment.localnet.name,
          networkType: AppEnvironment.localnet,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
    );
    return AppLayout(
      content: ScaffoldPage(
        header: HeaderTitleWidget(textStyle: textStyle),
        content: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EnvironmentSelector(
                textStyle: textStyle,
              ),
              GenerateSeedAndSetPasswordSection(textStyle: textStyle),
              Spacer(),
              // Submit button
              Center(
                child: SubmitButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
