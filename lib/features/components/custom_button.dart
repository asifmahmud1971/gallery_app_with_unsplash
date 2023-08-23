import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/custom_svg.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;
  final bool isCenter;
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

  const CustomButton({
    Key? key,
    required this.title,
    this.textColor = Colors.white,
    this.btnColor = AppColors.kPurpleColorOne,
    this.borderColor = AppColors.kPurpleColorOne,
    this.border = 0,
    this.onPress,
    this.textStyle,
    this.outlineButton = false,
    this.isCenter = true,
    this.isIconEnable = false,
    this.enable = true,
    this.icon,
    this.radius = 30.0,
    this.textPadding = 15,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isIconEnable
        ? TextButton(
            onPressed: onPress,
            style: ButtonStyle(
              padding:
                  MaterialStateProperty.all(EdgeInsets.all(AppCommonSize.s10)),
              backgroundColor: MaterialStateProperty.all(
                  enable ? btnColor : AppColors.kPurpleColorOne),
              elevation: MaterialStateProperty.all(0.0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(
                    width: outlineButton ? 1 : border,
                    color: outlineButton
                        ? borderColor
                        : border == 0
                            ? Colors.transparent
                            : borderColor,
                  ),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppCommonSize.s10),
              child: Row(
                mainAxisAlignment: isCenter
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  CustomSvg(icon: icon!, size: iconSize ?? AppCommonSize.s24),
                  kWidthBox8,
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
          )
        : TextButton(
            onPressed: onPress,
            style: ButtonStyle(
              padding:
                  MaterialStateProperty.all(EdgeInsets.all(AppCommonSize.s10)),
              backgroundColor: MaterialStateProperty.all(
                  enable ? btnColor : AppColors.kPurpleColorOne),
              elevation: MaterialStateProperty.all(0.0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(
                    width: outlineButton ? 1 : border,
                    color: outlineButton
                        ? borderColor
                        : border == 0
                            ? Colors.transparent
                            : borderColor,
                  ),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppCommonSize.s10),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: textStyle ??
                    kButtonText.copyWith(
                      color: outlineButton ? textColor : textColor,
                    ),
              ),
            ),
          );
  }
}
