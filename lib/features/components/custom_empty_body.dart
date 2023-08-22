import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_svg.dart';

enum EmptyType {
  termine,
}

class CustomEmptyBody extends StatelessWidget {
  final String? icons;
  final String? text;

  const CustomEmptyBody({Key? key, this.icons, this.text}) : super(key: key);

  Widget getEmptyBody({EmptyType? type}) {
    switch (type) {
      case EmptyType.termine:
        return CustomEmptyBody(
            icons: AppImages.activeDoc, text: AppStrings.noDataFound.tr());

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSvg(
          icon: icons ?? AppImages.iconsNoCost,
          color: AppColors.kAshColorThree,
          size: AppCommonSize.s64,
        ),
        kHeightBox35,
        Text(
          text ?? "",
          style: kH1Text.copyWith(
            color: AppColors.kPurpleColorTwo,
            fontWeight: semiBoldFont,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
