import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import 'custom_image.dart';

class ImageTitleSubtitle extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? imageUrl;
  final String? city;
  final String? region;
  final Function? onPressButton;

  const ImageTitleSubtitle(
      {Key? key,
      this.title,
      this.subTitle,
      this.imageUrl,
      this.city,
      this.region,
      this.onPressButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: CustomImage.rectangle(
              image: imageUrl!,
              svg: false,
              isNetworkImage: false,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            // flex: 2,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Text(
                    textAlign: TextAlign.start,
                    title!.tr(),
                    style: AppTheme.headline.copyWith(
                      fontFamily: 'Acknowledgement',
                      color: AppColors.black,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  child: Text(
                    subTitle!.tr(),
                    textAlign: TextAlign.start,
                    style: AppTheme.headline3.copyWith(
                      color: AppColors.grey60,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
