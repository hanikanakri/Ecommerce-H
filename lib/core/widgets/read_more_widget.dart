import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class ReadMoreWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final TrimMode trimMode;


  const ReadMoreWidget({
    Key? key,
    this.text,
    this.color,
    this.trimMode = TrimMode.Line,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text ?? "",
      textAlign: TextAlign.start,
      style: AppTheme.bodyText3.copyWith(color: color ?? AppColors.grey),
      colorClickableText: AppColors.primaryColor,
      trimMode: trimMode,
      trimLines: 1,
      trimLength: 40,
      trimCollapsedText: 'show_more'.tr(),
      trimExpandedText: 'show_less'.tr(),
      moreStyle: AppTheme.bodyText2.copyWith(color: AppColors.black),
      lessStyle: AppTheme.bodyText2.copyWith(color: AppColors.black),
    );
  }
}

/*ReadMoreText(
  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
  trimLines: 2,
  colorClickableText: Colors.pink,
  trimMode: TrimMode.Line,
  trimCollapsedText: 'Show more',
  trimExpandedText: 'Show less',
  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
);*/