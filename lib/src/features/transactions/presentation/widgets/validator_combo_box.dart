import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart'
    show
        DaemonManagerBloc,
        DaemonManagerState,
        DaemonManagerSuccess,
        RunGetNodeValidatorAddressesCommand;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_addresses/data/mappers/get_node_addresses_mapper.dart'
    show AddressMapper;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_addresses/data/models/get_node_addresse_model.dart'
    show AddressModel;

class ValidatorComboBox extends StatefulWidget {
  const ValidatorComboBox({
    super.key,
    this.onChanged,
    this.isMandatory = true,
    this.height = 32,
    this.width = 428,
  });

  final bool isMandatory;
  final double width;
  final double height;
  final ValueChanged<AddressModel?>? onChanged;

  @override
  State<ValidatorComboBox> createState() => _ValidatorComboBoxState();
}

class _ValidatorComboBoxState extends State<ValidatorComboBox> {
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
          placeholder: Text('Retry to getting Data'),
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
            placeholder: Text('Select Validator'),
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
            children: [Text('${validator.id} - '), Text(validator.address)],
          ),
        ),
      );
    }).toList();
  }

  void _handleValidatorChanged(AddressModel? newValidator) {
    _validatorNotifier.value = newValidator;
    widget.onChanged?.call(newValidator);
  }

  List<AddressModel> _filterValidators(List<AddressModel> validators) {
    return validators.where((validator) {
      // Remove items where label starts with 'r' (case insensitive)
      return !validator.label.toLowerCase().startsWith('r');
    }).toList();
  }

  List<AddressModel> _processDaemonOutput(String output) {
    // Use your existing AddressMapper or adapt it for validators
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
