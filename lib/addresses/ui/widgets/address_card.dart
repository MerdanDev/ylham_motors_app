import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    required this.address,
    super.key,
    this.onEditPressed,
    this.onPressed,
  });

  final AddressModel address;
  final VoidCallback? onEditPressed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: ListTile(
        title: Text(
          address.name,
          style: const AppTextStyle.text().md().regular().withColor(Colors.grey.shade600),
        ),
        subtitle: Text(
          address.address,
          style: const AppTextStyle.text().sm().medium(),
        ),
        trailing: IconButton(
          onPressed: onEditPressed,
          icon: const Icon(
            Icons.edit_outlined,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
