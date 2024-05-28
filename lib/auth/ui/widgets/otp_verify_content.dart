import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ylham_motors/auth/auth.dart';

class OtpVerifyContent extends HookWidget {
  const OtpVerifyContent({
    required this.phone,
    super.key,
  });

  final String phone;

  @override
  Widget build(BuildContext context) {
    final otpController = useTextEditingController();

    final isLoading = context.select((AuthenticationBloc bloc) => bloc.state.status == AuthenticationStatus.loading);

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
        OtpCodeInput(controller: otpController),

        const SizedBox(height: AppSpacing.md),

        /// Next button
        NextButton(
          isLoading: isLoading,
          onPressed: () {
            context.read<AuthenticationBloc>().add(
                  AuthenticationVerifyRequested(
                    phone: phone,
                    otp: otpController.text,
                  ),
                );
          },
        ),
      ],
    );
  }
}
