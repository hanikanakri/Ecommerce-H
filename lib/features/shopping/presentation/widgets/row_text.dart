import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:e_commerce_h/core/utils/shared_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/read_more_widget.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    this.secondText,
    this.firstText,
    this.style,
    this.isReadMore = false,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  final String? firstText;
  final String? secondText;
  final TextStyle? style;
  final MainAxisAlignment mainAxisAlignment;

  final bool isReadMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          firstText?.tr() ?? '',
          // /textAlign: TextAlign.start,
          style: style ??
              AppTheme.bodySmall.copyWith(
                color: AppColors.black,
              ),
        ),
        Expanded(
          child: AnimatedConditionalBuilder(
            condition: isReadMore == false,
            builder: (context) => Align(
              alignment: SharedStorage.getLanguage() == "en"
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                secondText?.tr() ?? "",
                style: style ?? AppTheme.bodySmall,
              ),
            ),
            fallback: (context) => Align(
              alignment: SharedStorage.getLanguage() == "ar"
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: ReadMoreWidget(
                text: secondText?.tr() ?? "",
              ),
            ),
          ),
        )
      ],
    );
  }
}

/*import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/read_more_widget.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    this.secondText,
    this.firstText,
    this.style,
    this.isReadMore = false,
    this.isExpanded = true,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  final String? firstText;
  final String? secondText;
  final TextStyle? style;
  final MainAxisAlignment mainAxisAlignment;

  final bool isReadMore;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          firstText?.tr() ?? '',
          style: style ??
              AppTheme.bodySmall.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        AnimatedConditionalBuilder(
          condition: isExpanded ==true,
          builder: (context) => Expanded(
            child: AnimatedConditionalBuilder(
              condition: isReadMore == false,
              builder: (context) => Text(secondText?.tr() ?? "",
                  style: style ?? AppTheme.bodySmall),
              fallback: (context) => ReadMoreWidget(
                text: secondText?.tr() ?? "",
              ),
            ),
          ),
          fallback: (context) => AnimatedConditionalBuilder(
            condition: isReadMore == false,
            builder: (context) => Text(secondText?.tr() ?? "",
                style: style ?? AppTheme.bodySmall),
            fallback: (context) => ReadMoreWidget(
              text: secondText?.tr() ?? "",
            ),
          ),
        ),
        // Expanded(
        //   child: AnimatedConditionalBuilder(
        //     condition: isReadMore == false,
        //     builder: (context) => Text(secondText?.tr() ?? "",
        //         style: style ?? AppTheme.bodySmall),
        //     fallback: (context) => ReadMoreWidget(
        //       text: secondText?.tr() ?? "",
        //     ),
        //   ),
        // )
        /*Expanded(
          child: Text(
            secondText?.tr() ?? "",

            style: style ??
                AppTheme.bodySmall.copyWith(
                  color: AppColors.black,
                ),
          ),
        ),*/
      ],
    );
  }
}
*/
