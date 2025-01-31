import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

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
        color: AppTheme.of(context)
            .extension<SurfacePallet>()!
            .surface3,
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
                  widget.header,
                  style: widget.headerStyle ?? InterTextStyles.
                  captionMedium.copyWith(
                      color: AppColors.primaryGray,),
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
