import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/constants/app_responsive.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/core/constants/app_strings.dart';
import 'package:unsplash_gallery/features/components/custom_button2.dart';
import 'package:unsplash_gallery/features/components/custom_time_formatter.dart';
import 'package:unsplash_gallery/features/components/default_btn.dart';
import 'package:unsplash_gallery/features/components/my_context.dart';
import 'package:unsplash_gallery/features/screens/gallery/cubit/gallery_cubit.dart';

import '../../core/constants/app_colors.dart';

class CustomDialog {
  static showCustomDialog({
    required BuildContext context,
    required Function() onYes,
    String? title,
    String? details,
    String? confirmText,
    String? cancelText,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCommonSize.s10)),
          //this right here
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(top: AppCommonSize.s16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title ?? '',
                    style: kRegularLine16.copyWith(
                      color: AppColors.kBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: AppTextSize.s20,
                    ),
                  ),
                  kHeightBox8,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppWeight.s10),
                    child: Text(
                      details ?? '',
                      style: kRegularLine16.copyWith(
                        color: AppColors.kBlackColor,
                        fontSize: AppTextSize.s16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  kHeightBox20,
                  Divider(
                    height: 0,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              GetContext.back();
                            },
                            child: Text(
                              "",
                              style: kRegularLine16.copyWith(
                                  color: AppColors.kSecondaryColor),
                            ),
                          ),
                        ),
                        VerticalDivider(),
                        Expanded(
                          child: TextButton(
                            onPressed: onYes,
                            child: Text(
                              "",
                              style: kRegularLine16.copyWith(
                                  color: AppColors.kPrimaryOne),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showBottomDialog({
    required VoidCallback? takePhoto,
    required VoidCallback? selectImage,
  }) {
    showDialog<void>(
      barrierDismissible: true,
      context: GetContext.context,
      builder: (BuildContext context) {
        return new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppCommonSize.s10),
              child: new Container(
                width: 1.sw,
                color: Colors.transparent,
                child: Material(
                  color: Colors.transparent,
                  type: MaterialType.transparency,
                  child: new Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: 1.sw,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kHeightBox5,
                              tapButton(
                                  onTap: takePhoto,
                                  title: AppStrings.takePhoto.tr()),
                              Divider(),
                              tapButton(
                                  onTap: selectImage,
                                  title: AppStrings.uploadPhoto.tr()),
                              kHeightBox5,
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 1.sw,
                          child: DefaultBtn(
                            onPress: () {
                              GetContext.back();
                            },
                            radius: 10,
                            title: AppStrings.cancel.tr(),
                            btnColor: Colors.white,
                            textStyle: kRegularLine16.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )),
                      kHeightBox10,
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static showCustomDialog2({
    required BuildContext context,
    required Function() onYes,
    String? title,
    String? details,
    String? confirmText,
    String? cancelText,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCommonSize.s10)),
          //this right here
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(top: AppCommonSize.s16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title ?? '',
                    style: kH2Text.copyWith(
                      color: AppColors.kPurpleColorFour,
                      fontWeight: mediumFont,
                    ),
                  ),
                  kHeightBox8,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppWeight.s10),
                    child: Text(
                      details ?? '',
                      style: kP1Text.copyWith(
                        color: AppColors.kGrayColorOne,
                        fontWeight: regularFont,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppCommonSize.s20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton2(
                          title: cancelText ?? AppStrings.no.tr(),
                          isGradient: false,
                          radius: AppCommonSize.s10,
                          outlineButton: true,
                          btnColor: AppColors.kWhiteColorOne,
                          borderColor: AppColors.kGrayColorThree,
                          textColor: AppColors.kPurpleColorFour,
                          padding: EdgeInsets.symmetric(
                            vertical: AppCommonSize.s10,
                            horizontal: AppCommonSize.s35,
                          ),
                          onPress: () {
                            GetContext.back();
                          },
                        ),
                        kWidthBox12,
                        CustomButton2(
                          title: confirmText ?? AppStrings.yes.tr(),
                          radius: AppCommonSize.s10,
                          padding: EdgeInsets.symmetric(
                            vertical: AppCommonSize.s10,
                            horizontal: AppCommonSize.s35,
                          ),
                          onPress: onYes,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showUnAuthorisedDialog({
    required BuildContext context,
    required Function() onYes,
    String? title,
    String? details,
    String? confirmText,
    String? cancelText,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCommonSize.s10)),
          //this right here
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(top: AppCommonSize.s16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title ?? 'Unauthorised',
                    style: kRegularLine16.copyWith(
                      color: AppColors.kPurpleColorFour,
                      fontWeight: FontWeight.w600,
                      fontSize: AppTextSize.s16,
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      details ??
                          'You need to sign in or sign up before continuing.',
                      textAlign: TextAlign.center,
                      style: kRegularLine16.copyWith(
                        color: Color(0XFF535353),
                        fontWeight: FontWeight.w400,
                        fontSize: AppTextSize.s14,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  CustomButton2(
                    isGradient: true,
                    onPress: onYes,
                    radius: 10,
                    title: AppStrings.ok.tr(),
                    textStyle: kRegularLine16.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  20.verticalSpace
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static tapButton({onTap, title}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Center(
          child: Text(title ?? "Test",
              textAlign: TextAlign.center,
              style: kRegularLine16.copyWith(
                  fontWeight: FontWeight.w500, color: Colors.black)),
        ),
      ),
    );
  }

  static errorDialog({
    required BuildContext context,
    Function()? onYes,
    String? title,
    String? details,
    String? confirmText,
    String? cancelText,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCommonSize.s10)),
          //this right here
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(top: AppCommonSize.s16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title ?? "",
                    style: kRegularLine16.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: AppTextSize.s20,
                    ),
                  ),
                  kHeightBox8,
                  Text(
                    details ??
                        'You need to sign in or sign up before continuing.',
                    textAlign: TextAlign.center,
                    style: kRegularLine16.copyWith(
                      color: AppColors.kBlackColor,
                      fontSize: AppTextSize.s16,
                    ),
                  ),
                  kHeightBox20,
                  Divider(
                    height: 0,
                  ),
                  TextButton(
                    onPressed: onYes ??
                        () {
                          GetContext.back();
                        },
                    child: Text(
                      "Ok",
                      style: kRegularLine16.copyWith(
                          color: AppColors.kSecondaryColor),
                    ),
                  ),
                  VerticalDivider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
