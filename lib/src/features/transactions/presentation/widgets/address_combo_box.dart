import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart' show AddressType;
import 'package:pactus_gui/src/core/extensions/address_type_extension.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart'
    show
        DaemonManagerBloc,
        DaemonManagerState,
        DaemonManagerSuccess,
        RunGetNodeValidatorAddressesCommand;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_addresses/data/mappers/get_node_addresses_mapper.dart'
    show AddressMapper;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_addresses/data/models/get_node_addresse_model.dart'
    show AddressModel;
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';

class AddressComboBox extends StatefulWidget {
  const AddressComboBox({
    super.key,
    this.onChanged,
    this.isMandatory = true,
    this.height = 32,
    this.width = 428,
    required this.addressType,
  });

  final bool isMandatory;
  final AddressType addressType;
  final double width;
  final double height;
  final ValueChanged<AddressModel?>? onChanged;

  @override
  State<AddressComboBox> createState() => _AddressComboBoxState();
}

class _AddressComboBoxState extends State<AddressComboBox> {
  late final ValueNotifier<AddressModel?> _validatorNotifier;
  final double comboBoxInnerGap = 44;

  @override
  void initState() {
    super.initState();
    _validatorNotifier = ValueNotifier<AddressModel?>(null);
    _sendRequestGetValidators();
  }

  @override
  void dispose() {
    _validatorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: BlocBuilder<DaemonManagerBloc, DaemonManagerState>(
        builder: (context, state) {
          if (state is DaemonManagerSuccess) {
            final validators = _filterValidators(
              _processDaemonOutput(state.output),
              addressType: widget.addressType,
            );
            return _succeedWidget(validators);
          }
          return _errorWidget(context);
        },
      ),
    );
  }

  Widget _errorWidget(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        context.read<DaemonManagerBloc>().add(
          RunGetNodeValidatorAddressesCommand(),
        );
      },
      child: IgnorePointer(
        child: ComboBox<AddressModel?>(
          isExpanded: true,
          items: [],
          placeholder: Text(context.tr(LocaleKeys.retryGettingData)),
          onChanged: _handleValidatorChanged,
        ),
      ),
    );
  }

  Widget _succeedWidget(List<AddressModel> validators) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: ValueListenableBuilder<AddressModel?>(
        valueListenable: _validatorNotifier,
        builder: (context, currentValidator, _) {
          return ComboBox<AddressModel?>(
            isExpanded: true,
            value: currentValidator,
            items: _buildValidatorItems(validators),
            placeholder: switch (widget.addressType) {
              AddressType.wallet => Text(context.tr(LocaleKeys.selectWallet)),
              AddressType.validator => Text(
                context.tr(LocaleKeys.selectValidator),
              ),
            },
            onChanged: _handleValidatorChanged,
          );
        },
      ),
    );
  }

  void _sendRequestGetValidators() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DaemonManagerBloc>().add(
        RunGetNodeValidatorAddressesCommand(),
      );
    });
  }

  List<ComboBoxItem<AddressModel?>> _buildValidatorItems(
    List<AddressModel> validators,
  ) {
    return validators.map<ComboBoxItem<AddressModel?>>((validator) {
      return ComboBoxItem<AddressModel?>(
        value: validator,
        child: SizedBox(
          width: widget.width - comboBoxInnerGap,
          child: Row(
            children: [
              if (validator.id.isNotEmpty) Text('${validator.id} - '),
              Text(validator.address),
            ],
          ),
        ),
      );
    }).toList();
  }

  void _handleValidatorChanged(AddressModel? newValidator) {
    _validatorNotifier.value = newValidator;
    widget.onChanged?.call(newValidator);
  }

  List<AddressModel> _filterValidators(
    List<AddressModel> validators, {
    required AddressType addressType,
  }) {
    return validators.where((validator) {
      return !validator.label.toLowerCase().startsWith(
        addressType.removeFilter(),
      );
    }).toList();
  }

  List<AddressModel> _processDaemonOutput(String output) {
    final addresses = AddressMapper.fromText(output);
    return addresses
        .map(
          (address) => AddressModel(
            address: address.address,
            label: address.label,
            id: address.id,
          ),
        )
        .toList();
  }
}
