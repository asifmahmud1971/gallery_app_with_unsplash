import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_images.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/custom_svg.dart';

class RowWidget extends StatelessWidget {
  final String? icon;
  final Color? iconColor;
  final String? title;
  const RowWidget({super.key, this.icon, this.title, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppWeight.s28),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconColor != null
              ? Container(
                  width: AppCommonSize.s16,
                  height: AppCommonSize.s16,
                  decoration: BoxDecoration(
                    color: iconColor ?? AppColors.kWhiteColor,
                    shape: BoxShape.circle,
                  ),
                )
              : CustomSvg(
                  icon: icon ?? AppImages.iconsClock,
                  size: AppCommonSize.s16,
                  color: iconColor ?? AppColors.kAshColorThree,
                ),
          kWidthBox10,
          Text(
            title ?? '',
            style: kP2Text.copyWith(
              color: AppColors.kAshColorOne,
              fontWeight: regularFont,
            ),
          )
        ],
      ),
    );
  }
}
