import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/blockchain_get_info/presentation/bloc/blockchain_get_info_bloc.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class BlockchainInfoSection extends StatelessWidget {
  const BlockchainInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlockchainGetInfoBloc, BlockchainGetInfoState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(
            child: Text(
              'Initial State',
              style: TextStyle(color: AppTheme.of(context).accentColor),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (data) => Center(
            child: Text(
              data.lastBlockHash,
              style: TextStyle(color: AppTheme.of(context).accentColor),
            ),
          ),
          error: (error) => Center(
            child: Text(
              'Error: $error',
              style: TextStyle(color: AppTheme.of(context).accentColor),
            ),
          ),
        );
      },
    );
  }
}
