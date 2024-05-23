import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/auth/auth.dart';

class OtpVerifyContent extends StatelessWidget {
  const OtpVerifyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        /// Phone number
        const PhoneInput(
          readOnly: true,
          initialValue: "64530230",
        ),

        const SizedBox(height: AppSpacing.md),

        /// Otp code input
        const OtpCodeInput(),

        const SizedBox(height: AppSpacing.md),

        /// Next button
        NextButton(
          onPressed: () => context.read<RegisterBloc>().add(const RegisterEmailChanged('')),
        ),
      ],
    );
  }
}
