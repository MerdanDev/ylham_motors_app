import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:ylham_motors/auth/auth.dart';

class LoginContent extends HookWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Form(
      key: formKey,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final readOnly = state.status.isInProgress;

              return PhoneInput(
                readOnly: readOnly,
                onChanged: (phone) => context.read<LoginBloc>().add(LoginPhoneChanged(phone)),
                error: state.phone.error?.toString(),
              );
            },
          ),
          const SizedBox(height: AppSpacing.md),

          /// Next button
          NextButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                context.read<LoginBloc>().add(LoginPhoneSubmitted());
              }
            },
          ),
        ],
      ),
    );
  }
}
