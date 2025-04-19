import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/extensions/context_extensions.dart';
import 'package:gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:gui/src/features/dashboard/core/enums/pane_item_type.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class TitlePaneItem extends StatelessWidget {
  const TitlePaneItem({
    super.key,
    required this.type,
  });
  final PaneItemType type;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, NavigationState>(
      builder: (context, state) {
        return Text(
          context.tr(type.name),
          style: TextStyle(
            color: context.detectPaneTextColor(
              isEnabledTextStyle: type.id == state.selectedIndex,
            ),
          ),
        );
      },
    );
  }
}
