import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pactus_gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:pactus_gui/src/features/dashboard/core/enums/pane_item_type.dart';
import 'package:pactus_gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, PanePallet;

class IconPaneItem extends StatelessWidget {
  const IconPaneItem({
    super.key,
    required this.type,
  });
  final PaneItemType type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, NavigationState>(
      builder: (context, state) {
        return SvgPicture.asset(
          type.asset,
          colorFilter: ColorFilter.mode(
            AppTheme.of(context).extension<PanePallet>()!.itemColor!,
            BlendMode.srcIn,
          ),
        );
      },
    );
  }
}
