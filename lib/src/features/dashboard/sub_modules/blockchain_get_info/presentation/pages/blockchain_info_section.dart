import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/shimmer_card_item.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/entities/blockchain_info_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/presentation/bloc/blockchain_get_info_bloc.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/presentation/widgets/customized_text_item.dart';

class BlockchainInfoSection extends StatelessWidget {
  const BlockchainInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<BlockchainGetInfoBloc, BlockchainGetInfoState>(
          builder: (context, BlockchainGetInfoState state) {
            return state.maybeWhen(
              orElse: () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  ShimmerCardItem(width: 100),
                  ShimmerCardItem(width: 100),
                  ShimmerCardItem(width: 100),
                  ShimmerCardItem(width: 100),
                  ShimmerCardItem(width: 100),
                  ShimmerCardItem(width: 100),
                  ShimmerCardItem(width: 100),
                ],
              ),
              loaded: (BlockchainInfoEntity data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  CustomizedTextItem(
                    title: 'lastBlockHash : ${data.lastBlockHash}',
                  ),
                  CustomizedTextItem(
                    title: 'lastBlockHeight : ${data.lastBlockHeight}',
                  ),
                  CustomizedTextItem(
                    title: 'committeeSize : ${data.committeeSize}',
                  ),
                  CustomizedTextItem(
                    title: 'committeePower : ${data.committeePower}',
                  ),
                  CustomizedTextItem(title: 'totalPower : ${data.totalPower}'),
                  CustomizedTextItem(
                    title: 'totalValidators : ${data.totalValidators}',
                  ),
                  CustomizedTextItem(title: 'isPruned : ${data.isPruned}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
