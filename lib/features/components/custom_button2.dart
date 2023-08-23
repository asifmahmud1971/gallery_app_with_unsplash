import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/custom_svg.dart';

class CustomButton2 extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;
  final bool isCenter;
  final bool isGradient;
  final double radius;
  final double border;
  final Color borderColor;
  final Color textColor;
  final Color btnColor;
  final TextStyle? textStyle;
  final double textPadding;
  final bool outlineButton;
  final bool isIconEnable;
  final String? icon;
  final double? iconSize;
  final bool enable;
  final EdgeInsetsGeometry? padding;

  const CustomButton2({
    Key? key,
    required this.title,
    this.textColor = Colors.white,
    this.btnColor = AppColors.kPurpleColorOne,
    this.borderColor = AppColors.kPurpleColorOne,
    this.border = 0,
    this.onPress,
    this.textStyle,
    this.outlineButton = false,
    this.isGradient = false,
    this.isCenter = true,
    this.isIconEnable = false,
    this.enable = true,
    this.icon,
    this.radius = 30.0,
    this.textPadding = 15,
    this.iconSize,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: isGradient ? null : btnColor,
        gradient: isGradient
            ? LinearGradient(
                begin: Alignment(-0.99, -0.12),
                end: Alignment(0.99, 0.12),
                colors: [
                  AppColors.kGradientColorEndOne,
                  AppColors.kGradientColorStartOne,
                ],
              )
            : null,
        border: Border.all(
          width: outlineButton ? 1 : border,
          color: outlineButton
              ? borderColor
              : border == 0
                  ? Colors.transparent
                  : borderColor,
        ),
        borderRadius: BorderRadius.circular(
          radius,
        ),
        boxShadow: [AppColors.kOrdinaryShadow],
      ),
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        child: InkWell(
          radius: radius,
          onTap: onPress,
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(
                    vertical: AppCommonSize.s8, horizontal: AppCommonSize.s20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isIconEnable ? CustomSvg(icon: icon ?? '') : SizedBox(),
                isIconEnable ? kWidthBox10 : SizedBox(),
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: textStyle ??
                      kButtonText.copyWith(
                        color: outlineButton ? textColor : textColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
