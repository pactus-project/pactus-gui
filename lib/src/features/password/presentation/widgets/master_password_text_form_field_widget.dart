import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/widgets/text_field_wrapper.dart';
import 'package:gui/src/features/password/presentation/cubits/master_password_handler_cubit.dart';

class MasterPasswordTextFormFieldWidget extends StatefulWidget {
  const MasterPasswordTextFormFieldWidget({super.key});

  @override
  State<MasterPasswordTextFormFieldWidget> createState() =>
      _MasterPasswordTextFormFieldWidgetState();
}

class _MasterPasswordTextFormFieldWidgetState
    extends State<MasterPasswordTextFormFieldWidget> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MasterPasswordHandlerCubit(),
      child: BlocBuilder<MasterPasswordHandlerCubit, bool>(
        builder: (context, isObscured) {
          return SizedBox(
            height: 32,
            width: 280,
            child: TextFieldWrapper(
              child: PasswordBox(),
            ),
          );
        },
      ),
    );
  }
}
