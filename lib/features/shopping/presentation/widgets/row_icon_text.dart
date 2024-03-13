import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class RowIconText extends StatelessWidget {
  const RowIconText({
    super.key,
    this.icon,
    this.text,
    this.vertical = 10,
    this.horizontal = 10,
  });

  final IconData? icon;
  final String? text;
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.black,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: Text(
            text?.tr() ?? '',
            style: AppTheme.headline,
          ),
        ),
      ],
    );
  }
}
