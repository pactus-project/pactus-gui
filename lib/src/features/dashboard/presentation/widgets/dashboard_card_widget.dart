import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pactus_gui/src/core/common/widgets/shimmer_card_item.dart';
import 'package:pactus_gui/src/features/dashboard/core/enums/dashboard_card_type.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/presentation/bloc/blockchain_get_info_bloc.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class DashboardCardWidget extends StatelessWidget {
  const DashboardCardWidget({
    super.key,
    required this.dashboardCardType,
  });
  final DashboardCardType dashboardCardType;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark200!,
            blurRadius: 6,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
        color: AppTheme.of(context).extension<LightPallet>()!.light900,
        border: Border(
          left: BorderSide(
            color: AppTheme.of(context).accentColor,
            width: 4,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12, top: 12),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(dashboardCardType.title),
                  style: AppTheme.of(context).typography.body!.copyWith(
                        color: AppTheme.of(context)
                            .extension<DarkPallet>()!
                            .dark900,
                      ),
                ),
                BlocBuilder<BlockchainGetInfoBloc, BlockchainGetInfoState>(
                  builder: (context, BlockchainGetInfoState state) {
                    return state.maybeWhen(
                      orElse: () => ShimmerCardItem(
                        height: 48,
                        width: 48,
                      ),
                      loaded: (res) {
                        return SizedBox(
                          height: 48,
                          child: Text(
                            switch (dashboardCardType) {
                              DashboardCardType.committeeSize =>
                                '${res.committeeSize}',
                              DashboardCardType.committeePower =>
                                '${res.committeePower}',
                              DashboardCardType.numberOfValidators =>
                                '${res.totalValidators}',
                              DashboardCardType.totalPower =>
                                '${res.totalPower}',
                            },
                            style:
                                AppTheme.of(context).typography.body!.copyWith(
                                      color: AppTheme.of(context)
                                          .extension<DarkPallet>()!
                                          .dark900,
                                    ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 32, end: 16),
            child: SvgPicture.asset(
              dashboardCardType.asset,
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
