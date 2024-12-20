import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/constants/inter_text_styles.dart';
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
            child: TextFormField(
              controller: passwordController,
              obscureText: isObscured,
              style: InterTextStyles.regular14
                  .copyWith(color: AppColors.primaryGrey),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.compoundRest, width: 2),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.compoundRest, width: 2),
                ),
                contentPadding: const EdgeInsetsDirectional.symmetric(
                    vertical: 5, horizontal: 12),
                border: const OutlineInputBorder(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 9,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      context
                          .read<MasterPasswordHandlerCubit>()
                          .toggleVisibility();
                    },
                  ),
                ),
              ),
              validator: (value) {
                return null;
              },
            ),
          );
        },
      ),
    );
  }
}
