import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    this.icon,
    this.onTap,
    this.text,
    this.color = AppColors.blue,
  });

  final void Function()? onTap;
  final IconData? icon;
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text?.tr() ?? '',
            style: AppTheme.bodySmall.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
