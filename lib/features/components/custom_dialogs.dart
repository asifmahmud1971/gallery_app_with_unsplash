import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:terminator/core/constants/app_responsive.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_button2.dart';
import 'package:terminator/features/components/custom_time_formatter.dart';
import 'package:terminator/features/components/default_btn.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:terminator/features/screens/termine/cubit/termin_cubit.dart';

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

  static showDateRangeCalender(
    BuildContext context, {
    dynamic onSelectionChanged,
    VoidCallback? onReset,
    VoidCallback? onApply,
    PickerDateRange? pickerDateRange,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppCommonSize.s6)),
            child: Padding(
              padding: EdgeInsets.all(AppWeight.s15),
              child: SizedBox(
                width: AppResponsive.isMobile(context) ? 1.sw : 0.3.sw,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          GetContext.context
                              .read<DashboardCubit>()
                              .pickerStartEnd();
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: AppCommonSize.s16,
                          color: AppColors.kPurpleColorFour,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppWeight.s15,
                        left: AppWeight.s15,
                        bottom: AppWeight.s15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppStrings.custom.tr(),
                              textAlign: TextAlign.left,
                              style: kP1Text.copyWith(
                                fontWeight: semiBoldFont,
                                color: AppColors.kPurpleColorFour,
                              ),
                            ),
                          ),
                          kHeightBox20,
                          BlocBuilder<DashboardCubit, DashboardState>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(AppCommonSize.s10),
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: AppColors.kGrayColorThree,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            AppCommonSize.s8),
                                      ),
                                    ),
                                    child: Text(
                                      CustomTimeFormatter.dateRangeFormat(
                                        state.start,
                                      ),
                                      style: kP2Text.copyWith(
                                        color: AppColors.kAshColorOne,
                                        fontWeight: regularFont,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: AppCommonSize.s5),
                                    height: 1,
                                    width: AppCommonSize.s25,
                                    color: AppColors.kAshColorThree,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(AppCommonSize.s10),
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: AppColors.kGrayColorThree,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            AppCommonSize.s8),
                                      ),
                                    ),
                                    child: Text(
                                      CustomTimeFormatter.dateRangeFormat(
                                          state.end),
                                      style: kP2Text.copyWith(
                                        color: AppColors.kAshColorOne,
                                        fontWeight: regularFont,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          kHeightBox15,
                          Container(
                            margin: EdgeInsets.only(bottom: AppHeight.s35),
                            height: .3.sh,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppWeight.s20,
                              vertical: AppHeight.s10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.kWhiteColorOne,
                              border: Border.all(
                                width: 1,
                                color: AppColors.kGrayColorThree,
                              ),
                              borderRadius:
                                  BorderRadius.circular(AppCommonSize.s15),
                              boxShadow: [AppColors.kOrdinaryShadow],
                            ),
                            child: SfDateRangePicker(
                                headerStyle: DateRangePickerHeaderStyle(
                                  textAlign: TextAlign.left,
                                  textStyle: kP1Text.copyWith(
                                    fontWeight: semiBoldFont,
                                    color: AppColors.kBlackColorOne,
                                  ),
                                ),
                                initialSelectedRange: pickerDateRange,
                                backgroundColor: AppColors.kWhiteColorOne,
                                selectionColor: AppColors.kPurpleColorTwo,
                                startRangeSelectionColor:
                                    AppColors.kPurpleColorTwo,
                                endRangeSelectionColor:
                                    AppColors.kPurpleColorTwo,
                                rangeSelectionColor: AppColors.kPurpleColorFour,
                                allowViewNavigation: true,
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
                                maxDate:
                                    DateTime.now().add(Duration(days: 365)),
                                monthViewSettings:
                                    DateRangePickerMonthViewSettings(
                                  firstDayOfWeek: 1,
                                  weekendDays: [6, 7],
                                ),
                                onSelectionChanged:
                                    CustomTimeFormatter.dateTimeRange),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton2(
                                  title: AppStrings.reset.tr(),
                                  radius: AppCommonSize.s12,
                                  btnColor: AppColors.kWhiteColorOne,
                                  textColor: AppColors.kPurpleColorFour,
                                  outlineButton: true,
                                  borderColor: AppColors.kGrayColorThree,
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppHeight.s10,
                                  ),
                                  onPress: onReset,
                                ),
                              ),
                              kWidthBox12,
                              Expanded(
                                child: CustomButton2(
                                  title: AppStrings.apply.tr(),
                                  radius: AppCommonSize.s12,
                                  isGradient: true,
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppHeight.s10,
                                  ),
                                  onPress: onApply,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  static showDateRangeCalenderFilter(
    BuildContext context, {
    dynamic onSelectionChanged,
    VoidCallback? onReset,
    VoidCallback? onApply,
    PickerDateRange? pickerDateRange,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppCommonSize.s6)),
            child: Padding(
              padding: EdgeInsets.all(AppWeight.s15),
              child: SizedBox(
                width: AppResponsive.isMobile(context) ? 1.sw : 0.3.sw,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          context.read<TerminCubit>().changeDateRange();
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: AppCommonSize.s16,
                          color: AppColors.kPurpleColorFour,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppWeight.s15,
                        left: AppWeight.s15,
                        bottom: AppWeight.s15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppStrings.custom.tr(),
                              textAlign: TextAlign.left,
                              style: kP1Text.copyWith(
                                fontWeight: semiBoldFont,
                                color: AppColors.kPurpleColorFour,
                              ),
                            ),
                          ),
                          kHeightBox20,
                          BlocBuilder<TerminCubit, TerminState>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(AppCommonSize.s10),
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: AppColors.kGrayColorThree,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            AppCommonSize.s8),
                                      ),
                                    ),
                                    child: Text(
                                      CustomTimeFormatter.dateRangeFormat(
                                          state.selectedDateRange?.start),
                                      style: kP2Text.copyWith(
                                        color: AppColors.kAshColorOne,
                                        fontWeight: regularFont,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: AppCommonSize.s5),
                                    height: 1,
                                    width: AppCommonSize.s25,
                                    color: AppColors.kAshColorThree,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(AppCommonSize.s10),
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: AppColors.kGrayColorThree,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            AppCommonSize.s8),
                                      ),
                                    ),
                                    child: Text(
                                      CustomTimeFormatter.dateRangeFormat(
                                          state.selectedDateRange?.end),
                                      style: kP2Text.copyWith(
                                        color: AppColors.kAshColorOne,
                                        fontWeight: regularFont,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          kHeightBox15,
                          Container(
                            margin: EdgeInsets.only(bottom: AppHeight.s35),
                            height: .3.sh,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppWeight.s20,
                              vertical: AppHeight.s10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.kWhiteColorOne,
                              border: Border.all(
                                width: 1,
                                color: AppColors.kGrayColorThree,
                              ),
                              borderRadius:
                                  BorderRadius.circular(AppCommonSize.s15),
                              boxShadow: [AppColors.kOrdinaryShadow],
                            ),
                            child: SfDateRangePicker(
                                headerStyle: DateRangePickerHeaderStyle(
                                  textAlign: TextAlign.left,
                                  textStyle: kP1Text.copyWith(
                                    fontWeight: semiBoldFont,
                                    color: AppColors.kBlackColorOne,
                                  ),
                                ),
                                initialSelectedRange: pickerDateRange,
                                backgroundColor: AppColors.kWhiteColorOne,
                                selectionColor: AppColors.kPurpleColorTwo,
                                startRangeSelectionColor:
                                    AppColors.kPurpleColorTwo,
                                endRangeSelectionColor:
                                    AppColors.kPurpleColorTwo,
                                rangeSelectionColor: AppColors.kPurpleColorFour,
                                allowViewNavigation: true,
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
                                maxDate:
                                    DateTime.now().add(Duration(days: 365)),
                                monthViewSettings:
                                    DateRangePickerMonthViewSettings(
                                  firstDayOfWeek: 1,
                                  weekendDays: [6, 7],
                                ),
                                onSelectionChanged:
                                    CustomTimeFormatter.dateTimeRangeFilter),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton2(
                                  title: AppStrings.reset.tr(),
                                  radius: AppCommonSize.s12,
                                  btnColor: AppColors.kWhiteColorOne,
                                  textColor: AppColors.kPurpleColorFour,
                                  outlineButton: true,
                                  borderColor: AppColors.kGrayColorThree,
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppHeight.s10,
                                  ),
                                  onPress: onReset,
                                ),
                              ),
                              kWidthBox12,
                              Expanded(
                                child: CustomButton2(
                                  title: AppStrings.apply.tr(),
                                  radius: AppCommonSize.s12,
                                  isGradient: true,
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppHeight.s10,
                                  ),
                                  onPress: onApply,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
