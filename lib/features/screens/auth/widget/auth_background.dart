import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_paint_bg.dart';
import 'package:terminator/features/components/custom_svg.dart';

class AuthBackground extends StatelessWidget {
  final Widget? child;

  const AuthBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
          color: AppColors.kPurpleColorFour,
          gradient: AppColors.appBackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 1.sw,
              height: 295.h,
              child: CustomPaint(
                painter: CustomPaintBG(),
                child: Column(
                  children: [
                    kHeightBox50,
                    CustomSvg(
                        icon: AppImages.iconsLogo, size: AppCommonSize.s72),
                    10.verticalSpace,
                    Text(
                      AppStrings.appName.tr(),
                      style: kLogoText.copyWith(
                          color: AppColors.kPurpleColorTwo,
                          fontFamily: GoogleFonts.ebGaramond().fontFamily,
                          fontWeight: FontWeight.w700),
                    ),
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
            SizedBox(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
