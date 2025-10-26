import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/mandatory_star_widget.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart' show TransactionType;
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart'
    show DaemonManagerBloc;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_type_selector.dart'
    show TransactionTypeSelector;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/address_combo_box.dart'
    show AddressComboBox;
import 'package:pactus_gui_widgetbook/app_styles.dart';

class UnbondInputForm extends StatelessWidget {
  const UnbondInputForm({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DaemonManagerBloc>(create: (_) => DaemonManagerBloc()),
      ],
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.tr(LocaleKeys.transaction_type),
                  style: TextStyle(
                    color: AppTheme.of(
                      context,
                    ).extension<DarkPallet>()!.contrast,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ),
              TransactionTypeSelector(
                initialValue: TransactionType.unbond,
                onChanged: (selectedItem) {
                  context.read<TransactionTypeCubit>().selectType(
                    selectedItem!,
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(
                context.tr(LocaleKeys.validator),
                style: TextStyle(
                  color: AppTheme.of(context).extension<DarkPallet>()!.contrast,
                ),
              ),
              MandatoryStarWidget(),
              Spacer(),
              AddressComboBox(),
            ],
          ),
        ],
      ),
    );
  }
}
