import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onPress;
  const CustomAppBar({
    Key? key,
    this.title,
    this.onPress,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppHeight.s60);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppHeight.s60),
      child: AppBar(
        centerTitle: true,
        leadingWidth: 100.w,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                AppColors.kGradientColorEndOne,
                AppColors.kGradientColorStartOne,
              ],
            ),
          ),
        ),
        leading: InkWell(
          onTap: onPress ?? () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSvg(
                icon: AppImages.backIcon,
                size: AppCommonSize.s24,
              ),
              kWidthBox10,
              Text(
                AppStrings.back.tr(),
                style: kP2Text.copyWith(
                  color: AppColors.kGrayColorThree,
                  fontWeight: regularFont,
                ),
              )
            ],
          ),
        ),
        title: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: kH3Text.copyWith(
            fontWeight: semiBoldFont,
            color: AppColors.kWhiteColorOne,
          ),
        ),
      ),
    );
  }
}
