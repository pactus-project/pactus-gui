import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [CustomExpandableWidget] Class Documentation
///
/// The [CustomExpandableWidget] is a UI component for creating
/// expandable and collapsible sections.
///
/// ### Properties:
///
/// - **[header]** (String):
///   - The title displayed in the header.
///
/// - **[headerStyle]** (TextStyle?):
///   - Optional text style for the header.
///
/// - **[body]** (Widget):
///   - The content displayed when expanded.
///
/// - **[headerColor]** (Color?):
///   - Background color for the header.
///
/// - **[expandedColor]** (Color?):
///   - Background color when expanded.
///
/// - **[borderHighlightColor]** (Color?):
///   - Border color when expanded.
///
/// - **[padding]** (EdgeInsetsGeometry):
///   - Padding inside the widget, defaults to [EdgeInsets.all(10)].
///
/// - **[isExpanded]** (bool):
///   - Determines if the widget is expanded.
///
/// - **[animationDuration]** (double):
///   - Duration of the expansion animation.
///
/// - **[width]** (double):
///   - Width of the widget.
///
/// - **[maxHeight]** (double?):
///   - Maximum height of the expanded content.
///
/// - **[onTap]** (VoidCallback?):
///   - Callback function for toggling expansion.

class CustomExpandableWidget extends StatelessWidget {
  const CustomExpandableWidget({
    super.key,
    required this.header,
    required this.body,
    this.headerColor,
    this.expandedColor,
    this.borderHighlightColor,
    this.padding = const EdgeInsets.all(10),
    required this.isExpanded,
    this.animationDuration = 300.0,
    this.width = double.infinity,
    this.maxHeight,
    this.headerStyle,
    this.onTap,
  });

  final String header;
  final TextStyle? headerStyle;
  final Widget body;
  final Color? headerColor;
  final Color? expandedColor;
  final Color? borderHighlightColor;
  final EdgeInsetsGeometry padding;
  final bool isExpanded;
  final double animationDuration;
  final double width;
  final double? maxHeight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: isExpanded
              ? (expandedColor ??
                  AppTheme.of(context).extension<DarkPallet>()!.dark900)
              : (headerColor ??
                  AppTheme.of(context).extension<DarkPallet>()!.dark900),
          borderRadius: BorderRadius.circular(8),
          border: isExpanded && borderHighlightColor != null
              ? Border(
                  bottom: BorderSide(
                    color: borderHighlightColor!,
                    width: 2,
                  ),
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(header),
                  style: headerStyle ??
                      InterTextStyles.captionMedium.copyWith(
                        color: AppColors.primaryGray,
                      ),
                ),
                Icon(
                  isExpanded
                      ? FluentIcons.chevron_up
                      : FluentIcons.chevron_down,
                  color: AppColors.primaryGray,
                  size: 20,
                ),
              ],
            ),
            AnimatedCrossFade(
              duration: Duration(milliseconds: animationDuration.toInt()),
              firstChild: SizedBox.shrink(),
              secondChild: SizedBox(
                height: maxHeight != null && isExpanded ? maxHeight : null,
                child: body,
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
          ],
        ),
      ),
    );
  }
}
