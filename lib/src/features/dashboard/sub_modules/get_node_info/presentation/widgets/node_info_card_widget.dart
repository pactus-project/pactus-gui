import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:pactus_gui/src/core/common/widgets/shimmer_card_item.dart'
    show ShimmerCardItem;
import 'package:pactus_gui/src/features/dashboard/core/enums/get_node_info_enum.dart'
    show GetNodeInfoEnum;
import 'package:pactus_gui/src/features/dashboard/core/extensions/get_node_info_extension.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/presentation/bloc/get_node_info_bloc.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet;

class NodeInfoCard extends StatelessWidget {
  const NodeInfoCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.width = 470,
    this.height = 320,
    this.headerHeight = 24,
    this.iconSize = 24,
    this.spacing = 4,
  });
  final String iconPath;
  final String title;
  final String description;
  final double width;
  final double headerHeight;
  final double height;
  final double iconSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: width),
      child: SizedBox(
        height: height,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(spacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Column(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: GetNodeInfoEnum.values
                      .map(
                        (nodeInfoEnum) => SizedBox(
                          height: 24,
                          width: 32,
                          child: SvgPicture.asset(
                            nodeInfoEnum.getIconPath(),
                            colorFilter: ColorFilter.mode(
                              AppTheme.of(
                                context,
                              ).extension<DarkPallet>()!.contrast!,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ) // Convert enum to string
                      .toList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: GetNodeInfoEnum.values
                      .map(
                        (nodeInfoEnum) => SizedBox(
                          height: 24,
                          child: Center(
                            child: Text(
                              context.tr(nodeInfoEnum.getTitle()),
                              textAlign: TextAlign.center,
                              style: AppTheme.of(context).typography.body!
                                  .copyWith(
                                    color: AppTheme.of(
                                      context,
                                    ).extension<DarkPallet>()!.contrast,
                                  ),
                            ),
                          ),
                        ),
                      ) // Convert enum to string
                      .toList(),
                ),
                Expanded(
                  child: BlocBuilder<GetNodeInfoBloc, GetNodeInfoState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: ShimmerCardItem.new,
                        loaded: (response) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: response
                                .toList()
                                .map(
                                  (itemData) => SizedBox(
                                    height: 24,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        itemData,
                                        style: AppTheme.of(context)
                                            .typography
                                            .body!
                                            .copyWith(
                                              color: AppTheme.of(context)
                                                  .extension<DarkPallet>()!
                                                  .contrast,
                                            ),
                                      ),
                                    ),
                                  ),
                                ) // Convert enum to string
                                .toList(),
                          );
                        },
                      );
                    },
                  ),
                ),
                // Add additional content here if needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
