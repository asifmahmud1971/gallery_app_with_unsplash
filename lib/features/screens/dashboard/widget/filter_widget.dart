import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_dialogs.dart';
import 'package:terminator/features/components/custom_time_formatter.dart';
import 'package:terminator/features/screens/dashboard/cubit/dashboard_cubit.dart';

enum FilterOptionType { today, yesterday, last_week, last_month, custom }

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<FilterOptionType, String>> menuItems = [
      {FilterOptionType.today: AppStrings.today.tr()},
      {FilterOptionType.yesterday: AppStrings.yesterday.tr()},
      {FilterOptionType.last_week: AppStrings.lastWeek.tr()},
      {FilterOptionType.last_month: AppStrings.lastMonth.tr()},
      {FilterOptionType.custom: AppStrings.custom.tr()},
    ];
    return SizedBox(
      width: double.infinity,
      child: PopupMenuButton<FilterOptionType>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppCommonSize.s10),
            bottomRight: Radius.circular(AppCommonSize.s10),
            bottomLeft: Radius.circular(AppCommonSize.s10),
          ),
          side: BorderSide(color: AppColors.kGrayColorThree, width: 1.0),
        ),
        child: Row(
          children: [
            Icon(
              Icons.filter_alt,
              color: AppColors.kPurpleColorFour,
              size: AppCommonSize.s16,
            ),
            kWidthBox5,
            Text(
              AppStrings.filter.tr(),
              style: kP2Text.copyWith(
                fontWeight: boldFont,
                color: AppColors.kPurpleColorFour,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.kAshColorThree,
              size: AppCommonSize.s20,
            )
          ],
        ),
        offset: Offset(0, 20),
        position: PopupMenuPosition.under,
        onSelected: (value) async {
          if (value == FilterOptionType.custom) {
            CustomDialog.showDateRangeCalender(
              context,
              onReset: () {
                Navigator.pop(context);
                context.read<DashboardCubit>().toggleFilter();
              },
              onApply: () {
                Navigator.pop(context);
                context.read<DashboardCubit>().toggleFilter(
                    filter: value,
                    range: context.read<DashboardCubit>().dateTimeRange);
              },
            );
          } else {
            context.read<DashboardCubit>().toggleFilter(
                filter: value,
                range: CustomTimeFormatter.filterDateRange(value));
          }
        },
        itemBuilder: (context) {
          return menuItems
              .map(
                (item) => PopupMenuItem<FilterOptionType>(
                  height: AppHeight.s35,
                  value: item.keys.first,
                  child: SizedBox(
                    width: .6.sw,
                    child: Text(
                      item.values.first.toString(),
                      style: kP1Text.copyWith(
                        fontWeight: regularFont,
                        color: context.read<DashboardCubit>().selectedFilter ==
                                item.keys.first.toString().split('.').last
                            ? AppColors.kPurpleColorFour
                            : AppColors.kAshColorOne,
                      ),
                    ),
                  ),
                ),
              )
              .toList();
        },
      ),
    );
  }
}
