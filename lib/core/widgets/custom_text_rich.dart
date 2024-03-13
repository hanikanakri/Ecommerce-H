import '/core/constants/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    this.mainStyle,
    required this.mainText,
    this.secondText,
    this.thirdText,
    this.secondStyle,
    this.thirdStyle,
  });

  final TextStyle? mainStyle;
  final TextStyle? secondStyle;
  final TextStyle? thirdStyle;
  final String mainText;
  final String? secondText;
  final String? thirdText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: mainText.tr(),
        style: mainStyle ?? AppTheme.headline,
        children: [
          TextSpan(
            text: secondText?.tr(),
            style: secondStyle ?? AppTheme.bodySmall,
          ),
          TextSpan(
            text: thirdText?.tr(),
            style: thirdStyle ?? AppTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
