import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/animations/fade_animation.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/utils/navigation.dart';
import '/core/utils/shared_storage.dart';

class GeneralWidgetScaffold extends StatelessWidget {
  const GeneralWidgetScaffold({
    super.key,
    this.body,
    this.resizeToAvoidBottomInset =false,
    this.vertical = 0.0,
    this.horizontal = 10.0,
  });

  final Widget? body;
  final double vertical;
  final double horizontal;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigation.pop(context);
          },
          icon: Icon(
            SharedStorage.getLanguage() == "ar"
                ? Icons.arrow_forward
                : Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: SvgPicture.asset(AppAssets.homePageAppBarLogo),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: FadeAnimation(
          fadeDirection: FadeDirection.bottom,
          child: body ?? const SizedBox(),
        ),
      ),
    );
  }
}
