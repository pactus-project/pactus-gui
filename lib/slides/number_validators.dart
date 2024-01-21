import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/support/app_sizes.dart';

class NumberValidatorsSlide extends ConsumerStatefulWidget {
  const NumberValidatorsSlide({super.key});

  @override
  ConsumerState<NumberValidatorsSlide> createState() => _NumberValidatorsSlide();
}

class _NumberValidatorsSlide extends ConsumerState<NumberValidatorsSlide> {
  @override
  void initState() {
    super.initState();
    // context.afterBuild(() {
    //   ref.read(nextButtonDisableProvider.notifier).state = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = ref.watch(appThemeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Validator config",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        gapH8,
        Text(
          "Setting Your Path to Decentralized Consensus with Precision and Scalability",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: theme.textColor.withOpacity(0.5)),
        ),
        //TODO TO DO
      ],
    );
  }
}
