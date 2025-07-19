import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:gap/gap.dart';
import 'package:pactus_gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:pactus_gui/src/core/common/widgets/screen_header_widget.dart';
import 'package:pactus_gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:pactus_gui/src/core/utils/gen/assets/assets.gen.dart'
    show Assets;
import 'package:pactus_gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:pactus_gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet;

/// ## [NodeTypeScreen] Class Documentation
///
class NodeTypeScreen extends StatelessWidget {
  const NodeTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, NavigationState>(
      builder: (context, selectedIndex) {
        return StandardPageLayout(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHeaderWidget(
                title: 'Node type',
                description:
                    'Please select a snapshot to download'
                    ':',
              ),
              const Gap(35),
              SnapshotList(),
            ],
          ),
          footer: NavigationFooterSection(
            selectedIndex: selectedIndex.selectedIndex,
            onNextPressed: () {
              context.read<NavigationPaneCubit>().setSelectedIndex(
                selectedIndex.selectedIndex + 1,
              );
            },
            onBackPressed: () {
              context.read<NavigationPaneCubit>().setSelectedIndex(
                selectedIndex.selectedIndex - 1,
              );
            },
          ),
        );
      },
    );
  }
}

class SnapshotList extends StatefulWidget {
  const SnapshotList({super.key});

  @override
  State<SnapshotList> createState() => _SnapshotListState();
}

class _SnapshotListState extends State<SnapshotList> {
  int? selectedIndex;
  final double itemHeight = 48;
  final List<String> items = [
    'snapshot 2025-03-10 (303.87 MB)',
    'snapshot 2025-03-11 (320.87 MB)',
    'snapshot 2025-03-12 (323.87 MB)',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: items.length * itemHeight,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: itemHeight,
            child: ListTile.selectable(
              selected: selectedIndex == index,
              onSelectionChange: (selected) {
                setState(() {
                  selectedIndex = selected ? index : null;
                });
              },
              title: Text(
                items[index],
                style: TextStyle(
                  color: selectedIndex == index
                      ? AppTheme.of(context).extension<DarkPallet>()!.contrast
                      : AppTheme.of(context).extension<DarkPallet>()!.dark500,
                ),
              ),
              leading: SvgPicture.asset(
                selectedIndex == index
                    ? Assets.icons.icSnapshotSelected
                    : Assets.icons.icSnapshotUnSelected,
                color: selectedIndex == index
                    ? AppTheme.of(context).accentColor
                    : AppTheme.of(context).extension<DarkPallet>()!.contrast,
              ),
            ),
          );
        },
      ),
    );
  }
}
