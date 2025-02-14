import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [CustomExpandableWidget] Class Documentation
///
/// The `CustomExpandableWidget` is a customizable collapsible container
/// that expands or collapses when the header is tapped.
///
/// ### Properties:
///
/// - **[header]** (`String`)
///   - The title displayed in the header section.
///
/// - **[headerStyle]** (`TextStyle?`)
///   - Custom styling for the header text.
///
/// - **[body]** (`Widget`)
///   - The widget displayed when expanded.
///
/// - **[headerColor]** (`Color`)
///   - The background color of the header section.
///   - Defaults to `Color(0xFF0078D4)`.
///
/// - **[expandedColor]** (`Color`)
///   - The background color when expanded.
///   - Defaults to `Color(0xFFE6F0FB)`.
///
/// - **[padding]** (`EdgeInsetsGeometry`)
///   - The padding inside the container.
///   - Defaults to `EdgeInsets.all(10)`.
///
/// - **[initiallyExpanded]** (`bool`)
///   - Determines whether the widget starts expanded.
///   - Defaults to `false`.
///
/// - **[animationDuration]** (`double`)
///   - Duration of the expand/collapse animation in milliseconds.
///   - Defaults to `300.0`.
///
/// - **[width]** (`double`)
///   - The width of the widget.
///   - Defaults to `double.infinity`.
///
/// - **[maxHeight]** (`double?`)
///   - The maximum height of the expanded body.
///   - Optional.
///
/// ### Constructor:
///
/// - `CustomExpandableWidget({required this.header, required this.body, ...})`
///   - Initializes the widget with customizable properties.
///
/// ### Important Notes:
///
/// - Uses `GestureDetector` to handle tap interactions.
/// - Implements `AnimatedCrossFade` for smooth expand/collapse transitions.
/// - Adapts colors and text styles dynamically based on the theme.

class CustomExpandableWidget extends StatefulWidget {
  const CustomExpandableWidget({
    super.key,
    required this.header,
    required this.body,
    this.headerColor = const Color(0xFF0078D4),
    this.expandedColor = const Color(0xFFE6F0FB),
    this.padding = const EdgeInsets.all(10),
    this.initiallyExpanded = false,
    this.animationDuration = 300.0,
    this.width = double.infinity,
    this.maxHeight,
    this.headerStyle,
  });
  final String header;
  final TextStyle? headerStyle;
  final Widget body;
  final Color headerColor;
  final Color expandedColor;
  final EdgeInsetsGeometry padding;
  final bool initiallyExpanded;
  final double animationDuration;
  final double width;
  final double? maxHeight;

  @override
  CustomExpandableWidgetState createState() => CustomExpandableWidgetState();
}

class CustomExpandableWidgetState extends State<CustomExpandableWidget> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: AppTheme.of(context).extension<LightPallet>()!.light900,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(widget.header),
                  style: widget.headerStyle ??
                      InterTextStyles.captionMedium.copyWith(
                        color: AppColors.primaryGray,
                      ),
                ),
                Icon(
                  _isExpanded
                      ? FluentIcons.chevron_up
                      : FluentIcons.chevron_down,
                  color: AppColors.primaryGray,
                  size: 20,
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
            duration: Duration(milliseconds: widget.animationDuration.toInt()),
            firstChild: SizedBox.shrink(),
            secondChild: SizedBox(
              height: widget.maxHeight != null && _isExpanded
                  ? widget.maxHeight
                  : null,
              child: widget.body,
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }
}
