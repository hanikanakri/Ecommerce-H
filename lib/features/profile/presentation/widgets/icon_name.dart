import '/core/constants/app_theme.dart';
import '/core/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class IconName extends StatelessWidget {
  const IconName({
    super.key,
    //this.icon,
    this.text,
    this.image,
    this.mainAxisAlignment=MainAxisAlignment.start,

  });

  //final IconData? icon;
  final String? text;
  final String? image;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        CustomImage.rectangle(
          image: image,
          isNetworkImage: false,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text?.tr() ?? '',
          style: AppTheme.headline,
        ),
      ],
    );
  }
}
