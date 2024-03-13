// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_constants.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';
import '/core/widgets/buttons/main_elevated_button.dart';

class GeneralChangeLanguageDialog {
  static showMainDialog(context,
      {String? tittle,
      String? imageUrl,
      IconData? icon,
      Color? iconColor,
      Widget? content}) {
    showDialog(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            DetailsCard(
              assetsName: imageUrl,
              icon: icon,
              iconColor: iconColor,
              authName: tittle,
              child: content,
            ),
          ],
        );
      },
    );
  }

  static showChangLanguageDialog(context) {
    GeneralChangeLanguageDialog.showMainDialog(
      context,
      imageUrl: AppAssets.changeLanguageURI,
      tittle: "app_language".tr(),
      iconColor: AppColors.green,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLanguage(context),
        ],
      ),
    );
  }

  static _buildLanguage(context) {
    String? local = SharedStorage.getLanguage();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: AppConstant.languages.keys.toList().map(
          (String value) {
            return Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: MainElevatedButton(
                text: value == "ar" ? 'arabic'.tr() : 'english'.tr(),
                buttonColor: SharedStorage.getLanguage() != value
                    ? AppColors.grey
                    : AppColors.primaryColor,
                onPressed: () {
                  if (local != value) {
                    debugPrint(value);
                    var newLocal =
                        SharedStorage.getLanguage() == "ar" ? "en" : "ar";
                    SharedStorage.writeLanguage(newLocal);
                    Keys.navigatorKey.currentContext!
                        .setLocale(AppConstant.languages[newLocal]!);
                    Phoenix.rebirth(context);
                  }
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final Widget? child;
  final String? assetsName;
  final String? assetsNamePNG;
  final String? authName;
  final IconData? icon;
  final Color? iconColor;
  Widget? stackChild;
  Color? authDetailsCardColors;

  DetailsCard({
    super.key,
    this.child,
    this.stackChild,
    this.authDetailsCardColors,
/*    this.marginBottom = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginTop = 0,
    this.horizontal = 0,
    this.vertical = 0,
    this.isNotSymmetric=true,*/
    this.assetsName,
    this.authName,
    this.icon,
    this.iconColor,
    this.assetsNamePNG,
  });

/*  final double marginTop;
  final double marginBottom;
  final double marginRight;
  final double marginLeft;
  final double horizontal;
  final double vertical;

  final bool isNotSymmetric;*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        elevation: 5,
        color:authDetailsCardColors ?? AppColors.backgroundGray,
        borderRadius: BorderRadius.circular(50),
        child: stackChild == null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
/*            margin: isNotSymmetric
                  ? EdgeInsets.only(
                      top: marginTop,
                      bottom: marginBottom,
                      right: marginRight,
                      left: marginLeft,
                    )
                  : EdgeInsets.symmetric(
                      horizontal: horizontal,
                      vertical: vertical,
                    ),*/
                    padding: const EdgeInsets.only(
                      bottom: 50,
                      top: 40,
                    ),
                    decoration: const BoxDecoration(
                      gradient: AppColors.authColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        topLeft: Radius.circular(100),
                        bottomRight: Radius.elliptical(450, 150),
                        bottomLeft: Radius.elliptical(450, 150),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        assetsName != null
                            ? SvgPicture.asset(
                                assetsName!,
                                color: iconColor,
                                height: 20,
                                width: 20,
                              )
                            : Container(),
                        assetsNamePNG != null
                            ? SizedBox(
                                /*width: 50,*/
                                height: 35,
                                child: Image.asset(
                                  assetsNamePNG!,
                                  /*width: 200,
                            height: 200,*/
                                  /*fit: BoxFit.contain,*/
                                ),
                              )
                            : const SizedBox(),
                        icon != null
                            ? Icon(
                                icon,
                                color: iconColor,
                              )
                            : const SizedBox(),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          authName ?? "",
                          style: AppTheme.headline.copyWith(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: child ?? const SizedBox(),
                  ),
                ],
              )
            : Stack(
                children: [
                  Container(
                    width: double.infinity,
/*            margin: isNotSymmetric
                  ? EdgeInsets.only(
                      top: marginTop,
                      bottom: marginBottom,
                      right: marginRight,
                      left: marginLeft,
                    )
                  : EdgeInsets.symmetric(
                      horizontal: horizontal,
                      vertical: vertical,
                    ),*/
                    padding: const EdgeInsets.only(
                      bottom: 50,
                      top: 40,
                    ),
                    decoration: const BoxDecoration(
                      gradient: AppColors.authColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        topLeft: Radius.circular(100),
                        bottomRight: Radius.elliptical(450, 150),
                        bottomLeft: Radius.elliptical(450, 150),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        assetsName != null
                            ? SvgPicture.asset(
                                assetsName!,
                                color: iconColor,
                                height: 20,
                                width: 20,
                              )
                            : Container(),
                        assetsNamePNG != null
                            ? SizedBox(
                                /*width: 50,*/
                                height: 35,
                                child: Image.asset(
                                  assetsNamePNG!,
                                  /*width: 200,
                            height: 200,*/
                                  /*fit: BoxFit.contain,*/
                                ),
                              )
                            : const SizedBox(),
                        icon != null
                            ? Icon(icon, color: iconColor)
                            : const SizedBox(),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          authName ?? "",
                          style: AppTheme.headline.copyWith(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 90,
                    ),
                    child: Center(
                      child: stackChild ?? const SizedBox(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
