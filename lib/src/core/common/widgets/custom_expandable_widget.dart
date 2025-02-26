import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

// Generic Dropdown Widget
class CustomDropdownWidget<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) itemLabel;

  const CustomDropdownWidget({
    required this.items,
    required this.itemLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit<T>, T>(
      builder: (context, selectedItem) {
        return ComboBox<T>(
          value: selectedItem,
          onChanged: (T? newValue) {
            if (newValue != null) {
              context.read<DropdownCubit<T>>().selectItem(newValue);
            }
          },
          items: items.map((item) {
            return ComboBoxItem<T>(
              value: item,
              child: Text(itemLabel(item)),
            );
          }).toList(),
        );
      },
    );
  }
}

// BlocProvider(
//   create: (context) => DropdownCubit<ValidatorQty>(ValidatorQty.one),
//   child: CustomDropdown<ValidatorQty>(
//     items: ValidatorQty.values,
//     itemLabel: (item) => item.name,
//   ),
// ),
