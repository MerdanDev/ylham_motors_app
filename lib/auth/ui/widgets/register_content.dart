import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:ylham_motors/auth/auth.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        /// Phone Input
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final readOnly = state.status.isInProgress;

            return PhoneInput(
              readOnly: readOnly,
              onChanged: (phone) =>
                  context.read<RegisterBloc>().add(RegisterPhoneChanged(phone)),
            );
          },
        ),

        const SizedBox(height: AppSpacing.md),

        /// Name Input
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final readOnly = state.status.isInProgress;

            return UsernameInput(
              readOnly: readOnly,
              onChanged: (username) => context
                  .read<RegisterBloc>()
                  .add(RegisterUsernameChanged(username)),
            );
          },
        ),

        const SizedBox(height: AppSpacing.md),

        /// Surname Input
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final readOnly = state.status.isInProgress;

            return SurnameInput(
              readOnly: readOnly,
              onChanged: (surname) => context
                  .read<RegisterBloc>()
                  .add(RegisterSurnameChanged(surname)),
            );
          },
        ),

        const SizedBox(height: AppSpacing.md),

        /// Email Input
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final readOnly = state.status.isInProgress;

            return EmailInput(
              readOnly: readOnly,
              onChanged: (email) =>
                  context.read<RegisterBloc>().add(RegisterEmailChanged(email)),
            );
          },
        ),

        const SizedBox(height: AppSpacing.md),

        /// Next button
        NextButton(
          onPressed: () =>
              context.read<RegisterBloc>().add(RegisterSubmitted()),
        ),
      ],
    );
  }
}
