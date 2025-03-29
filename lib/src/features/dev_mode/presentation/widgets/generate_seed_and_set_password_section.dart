import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/enums/app_enums.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/dialog_action_widget.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/dialog_content_widget.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/dialog_title_widget.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/generate_seeds_widget.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/set_password_widget.dart';

class GenerateSeedAndSetPasswordSection extends StatelessWidget {
  const GenerateSeedAndSetPasswordSection({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DaemonManagerBloc, DaemonManagerState>(
      listener: (context, state) {
        if (state is DaemonManagerSuccess) {
          showDialog(
            context: context,
            builder: (context) => ContentDialog(
              constraints: BoxConstraints(
                minWidth: 600,
                maxWidth: 600,
                maxHeight: 600,
                minHeight: 600,
              ),
              style: ContentDialogThemeData(
                titleStyle: textStyle,
                bodyStyle: textStyle,
              ),
              title: DialogTitleWidget(
                title: 'The Node Created Successfully!',
                dialogType: DialogType.succeed,
              ),
              content: DialogContentWidget(
                title: state.output,
              ),
              actions: [
                DialogActionWidget(
                  dialogType: DialogType.normal,
                  title: 'Ok',
                  callToAction: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }
        if (state is DaemonManagerError) {
          showDialog(
            context: context,
            builder: (context) => ContentDialog(
              constraints: BoxConstraints(
                minWidth: 600,
                maxWidth: 600,
                maxHeight: 600,
              ),
              style: ContentDialogThemeData(
                titleStyle: textStyle,
                bodyStyle: textStyle,
              ),
              title: DialogTitleWidget(
                title: 'The Operation Failed!',
                dialogType: DialogType.error,
              ),
              content: DialogContentWidget(
                title: state.error,
              ),
              actions: [
                DialogActionWidget(
                  dialogType: DialogType.normal,
                  title: 'Ok',
                  callToAction: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DaemonManagerLoading) {
          return Center(
            child: ProgressRing(),
          );
        }
        return Column(
          spacing: 24,
          children: [
            GenerateSeedsWidget(textStyle: textStyle),
            SetPasswordWidget(textStyle: textStyle),
          ],
        );
      },
    );
  }
}
