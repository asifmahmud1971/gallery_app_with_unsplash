import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_time_formatter.dart';

class HistoryCard extends StatelessWidget {
  final String? time;
  final String? userName;
  final String? action;
  final String? comments;
  final bool? statusChange;
  final bool? categoryChange;
  final String? oldStatus;
  final String? newStatus;
  final String? oldCategory;
  final String? newCategory;

  const HistoryCard(
      {super.key,
      this.time,
      this.userName,
      this.action,
      this.comments,
      this.statusChange,
      this.categoryChange,
      this.oldStatus,
      this.newStatus,
      this.oldCategory,
      this.newCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: AppColors.kAshColorTwo)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textCard(
              title: AppStrings.time.tr(),
              value:
                  "${CustomTimeFormatter.utcToLocalDayTimeFormat(time ?? DateTime.now().toString())}"),
          10.verticalSpace,
          textCard(
              title: AppStrings.user.tr(),
              value: userName ?? "",
              valueColor: AppColors.kBlueColorOne),
          10.verticalSpace,
          textCard(title: AppStrings.action.tr(), value: action ?? ""),
          10.verticalSpace,
          textCard(title: AppStrings.comments.tr(), value: comments ?? ""),
          10.verticalSpace,
          Visibility(
              visible: statusChange ?? true ? false : true,
              child: Column(
                children: [
                  textCard(
                      title: AppStrings.statusChange.tr(),
                      value: AppStrings.none.tr() ?? ""),
                  10.verticalSpace,
                ],
              )),
          Visibility(
            visible: statusChange ?? false,
            child: Column(
              children: [
                textCard(
                    title: AppStrings.oldStatus.tr(), value: oldStatus ?? ""),
                10.verticalSpace,
              ],
            ),
          ),
          Visibility(
            visible: statusChange ?? false,
            child: Column(
              children: [
                textCard(
                    title: AppStrings.newStatus.tr(), value: newStatus ?? ""),
                10.verticalSpace,
              ],
            ),
          ),
          Visibility(
              visible: categoryChange ?? true ? false : true,
              child: Column(
                children: [
                  textCard(
                      title: AppStrings.categoryChange.tr(),
                      value: AppStrings.none),
                  10.verticalSpace,
                ],
              )),
          Visibility(
            visible: categoryChange ?? false,
            child: Column(
              children: [
                textCard(
                    title: AppStrings.oldCategory.tr(),
                    value: oldCategory ?? ""),
                10.verticalSpace,
              ],
            ),
          ),
          Visibility(
            visible: categoryChange ?? false,
            child: Column(
              children: [
                textCard(
                    title: AppStrings.newCategory.tr(),
                    value: newCategory ?? ""),
                10.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  textCard({title, value, Color? valueColor}) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: kRegularLine14.copyWith(
                fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
          )),
          Expanded(
              child: Text(
            value,
            style: kRegularLine13.copyWith(
                fontWeight: FontWeight.w400,
                color: valueColor ?? AppColors.kAshColorOne),
          )),
        ],
      ),
    );
  }
}
