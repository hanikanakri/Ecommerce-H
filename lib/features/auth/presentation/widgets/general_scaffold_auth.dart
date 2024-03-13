import 'package:flutter/material.dart';

import '/core/animations/fade_animation.dart';
import '/core/constants/app_colors.dart';
import '/core/utils/navigation.dart';
import '/core/utils/shared_storage.dart';

class GeneralScaffoldAuth extends StatelessWidget {
  const GeneralScaffoldAuth({
    super.key,
    this.body,
    this.leading,
    this.title,
    this.actions,
    this.horizontal = 34.0,
    this.fadeDirection = FadeDirection.top,
  });

  final Widget? body;
  final double horizontal;
  final FadeDirection fadeDirection;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: title,
        actions: actions,
        leading: leading ??
            IconButton(
              onPressed: () {
                Navigation.pop(context);
              },
              icon: SharedStorage.getLanguage() == 'en'
                  ? const Icon(
                      Icons.arrow_back,
                      color: AppColors.black,
                    )
                  : const Icon(
                      Icons.arrow_forward,
                      color: AppColors.black,
                    ),
            ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: 10,
        ),
        child: FadeAnimation(
          fadeDirection: fadeDirection,
          child: body ?? const SizedBox(),
        ),
      ),
      /*body: Material(
        color: Colors.red,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: 10,
          ),
          child: FadeAnimation(
            fadeDirection: fadeDirection,
            child: body ?? const SizedBox(),
          ),
        ),
      ),*/
    );
  }
}
