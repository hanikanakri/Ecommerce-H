// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class HomeBottomNavBar extends StatefulWidget {
  HomeBottomNavBar({
    super.key,
    this.currentIndex,
    this.index,
  });

  int? currentIndex;

  ValueChanged<int>? index;

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    double disPlayWidth = MediaQuery.of(context).size.width;
//    double disPlayHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.1),
            blurRadius: 30.0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _navButton(
              assetsName: AppAssets.homeNave,
              buttonName: "home",
              color: widget.currentIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.black,
              onTap: () {
                setState(() {
                  widget.currentIndex = 0;
                  widget.index!(widget.currentIndex!);
                });
              },
            ),
            _navButton(
              flex: 2,
              assetsName: AppAssets.heartNave,
              buttonName: 'wishlist',
              color: widget.currentIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.black,
              onTap: () {
                setState(() {
                  widget.currentIndex = 1;
                  widget.index!(widget.currentIndex!);
                });
              },
            ),
            const Spacer(),
            _navButton(
              flex: 2,
              assetsName: AppAssets.searchNave,
              buttonName: 'search',
              color: widget.currentIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.black,
              onTap: () {
                setState(() {
                  widget.currentIndex = 3;
                  widget.index!(widget.currentIndex!);
                });
              },
            ),
            _navButton(
              assetsName: AppAssets.settingsNave,
              buttonName: 'settings',
              color: widget.currentIndex == 4
                  ? AppColors.primaryColor
                  : AppColors.black,
              onTap: () {
                setState(() {
                  widget.currentIndex = 4;
                  widget.index!(widget.currentIndex!);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _navButton({
    VoidCallback? onTap,
    String? assetsName,
    String? buttonName,
    Color? color,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetsName ?? '',
              color: color,
            ),
            Text(
              buttonName?.tr() ?? '',
              style: AppTheme.headline5.copyWith(
                color: color,
                fontSize: 10,
                overflow:TextOverflow.ellipsis
              ),
            ),
          ],
        ),
      ),
    );
  }

/*  Widget _navButton({
    VoidCallback? onTap,
    String? assetsName,
    String? buttonName,
    Color? color,
    int? flix,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              SvgPicture.asset(
                assetsName ?? '',
                color: color,
              ),
              Text(
                buttonName?.tr() ?? '',
                style: AppTheme.bodySmall.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}
