import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AnimationText extends StatelessWidget {
  const AnimationText({
    super.key,
    required this.text,
    this.style,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String text;
  final TextStyle? style;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Marquee(
        text: text.tr(),
        style: style ?? AppTheme.bodySmall.copyWith(
          color: AppColors.black,
        ),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: crossAxisAlignment,
        blankSpace: 20.0,
        velocity: 100.0,
        pauseAfterRound: const Duration(seconds: 1),
        startPadding: 10.0,
        accelerationDuration: const Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: const Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}
