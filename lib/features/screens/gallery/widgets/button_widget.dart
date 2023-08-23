import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_images.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/custom_svg.dart';

class ButtonWidget extends StatelessWidget {
  final String? icon;
  final VoidCallback? onPress;
  const ButtonWidget({super.key, this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.kPurpleColorFour,
        borderRadius: BorderRadius.circular(AppCommonSize.s5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPress,
          child: Container(
            padding: EdgeInsets.all(AppCommonSize.s6),
            width: AppCommonSize.s32,
            height: AppCommonSize.s32,
            child: CustomSvg(
              icon: icon ?? AppImages.settings,
              size: AppCommonSize.s18,
            ),
          ),
        ),
      ),
    );
  }
}
