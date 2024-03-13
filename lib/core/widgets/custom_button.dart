import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_icons.dart';
import '/core/constants/app_styles.dart';
import '/core/constants/app_theme.dart';
import '/core/extensions/widget_extension.dart';

const double iconSize = 15.0;

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color color;
  final IconData icon;

  const CustomButton({
    Key? key,
    this.onPressed,
    this.title = 'press',
    this.color = AppColors.primaryColor,
    this.icon = AppIcons.circle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        title.tr(),
        style: AppTheme.button,
      ),
      icon: Icon(
        icon,
        color: Colors.indigoAccent.withOpacity(0.7), // TODO to edit
        size: iconSize,
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(150, 50),
          maximumSize: const Size(150, 50),
          shape: AppStyles.roundedRectangleBorder),
    );
  }
}

class CustomIconButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color iconColor;
  final Color circleColor;
  final double? minWidth;
  final String tooltip;

  const CustomIconButton(
      {Key? key,
      this.onPressed,
      this.circleColor = AppColors.white,
      this.icon = AppIcons.circle,
      this.iconColor = Colors.grey,
      this.minWidth,
      this.tooltip = 'press'})
      : super(key: key);

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.minWidth ?? 35.0,
        height: widget.minWidth ?? 35.0,
        decoration: AppStyles.iconBoxDecoration.copyWith(
          color: widget.circleColor,
        ),
        child: IconButton(
          icon: Icon(
            widget.icon,
            color: widget.iconColor,
            /* color: iconColor == AppColors.grey
                ? Colors.indigoAccent.withOpacity(0.7) // TODO to edit
                : AppColors.white.withOpacity(0.7),*/
            size: iconSize,
          ),
          onPressed: widget.onPressed,
          tooltip: widget.tooltip.tr(),
        )).addNeumorphism(
      bottomShadowColor: widget.iconColor.withOpacity(0.4),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color? color;
  final Color? backgroundColor;
  final Color? titleColor;
  final Size minimumSize;
  final Size maximumSize;
  final TextStyle? style;

  const CustomTextButton({
    Key? key,
    this.onPressed,
    this.style,
    this.backgroundColor,
    this.title = 'press',
    this.color,
    this.minimumSize = const Size(150, 50),
    this.maximumSize = const Size(150, 50),
    this.titleColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
//        primary: color??AppColors.primaryColor,
        backgroundColor: backgroundColor ?? AppColors.transparent,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        shape: AppStyles.roundedRectangleBorder,
      ),
      onPressed: onPressed,
      child: Text(
        title.tr(),
        style: style ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: color == AppColors.grey
                      ? AppColors.primaryColor
                      : titleColor,
                ), // TODO to edit
      ),
    );
  }
}
