import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/addresses/addresses.dart';
import 'package:ylham_motors/l10n/l10n.dart';

class AddressEditBottomSheet extends HookWidget {
  const AddressEditBottomSheet({
    this.address,
    super.key,
  });

  final AddressModel? address;

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: address?.name);
    final addressController = useTextEditingController(text: address?.address);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xlg,
      ).copyWith(
          bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// NAME
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Ady",
              suffixIcon: PhosphorIcon(PhosphorIconsBold.addressBook),
              // errorText: error,
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          /// ADDRESS
          TextFormField(
            controller: addressController,
            keyboardType: TextInputType.text,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Salgysy",
              suffixIcon: Icon(Icons.location_on_outlined),
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          /// CONFIRM BUTTON
          SizedBox(
            width: double.infinity,
            child: AppButton.label(
              onPressed: () {
                if (address == null) {
                  context.read<AddressBloc>().add(
                        AddressCreateRequested(
                          AddressModel(
                            name: nameController.text,
                            address: addressController.text,
                          ),
                        ),
                      );
                } else {
                  context.read<AddressBloc>().add(
                        AddressUpdateRequested(
                          AddressModel(
                            uuid: address?.uuid,
                            name: nameController.text,
                            address: addressController.text,
                          ),
                        ),
                      );
                }
                Navigator.pop(context);
              },
              label: context.l10n.submit,
              buttonSize: AppButtonSize.large,
              buttonType: AppButtonType.primary,
            ),
          ),
        ],
      ),
    );
  }
}
