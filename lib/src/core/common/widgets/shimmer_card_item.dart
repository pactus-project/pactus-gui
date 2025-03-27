import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardItem extends StatelessWidget {
  const ShimmerCardItem({
    super.key,
    this.width = double.infinity,
    this.height = 24,
    this.borderRadius = 4.0,
    this.baseColor,
    this.highlightColor,
  });
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: FluentTheme.of(context).extension<GrayPallet>()!.gray300!,
      highlightColor: FluentTheme.of(context).extension<GrayPallet>()!.gray500!,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: FluentTheme.of(context).extension<GrayPallet>()!.gray300,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
