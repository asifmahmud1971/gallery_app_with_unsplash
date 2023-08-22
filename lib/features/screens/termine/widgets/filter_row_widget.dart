import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/features/components/custom_dialogs.dart';
import 'package:terminator/features/components/custom_svg.dart';
import 'package:terminator/features/components/custom_time_formatter.dart';
import 'package:terminator/features/screens/termine/cubit/termin_cubit.dart';
import 'package:terminator/features/screens/termine/model/filter_model.dart';
import 'package:terminator/features/screens/termine/widgets/expended_details.dart';
import 'package:time_range_picker/time_range_picker.dart';

class FilterRowWidget extends StatefulWidget {
  final String? labelText;
  final bool isDropDownEnable;
  final String? hintText;
  final List<Filter>? filterData;
  final TerminFilterType? filterType;
  final DateTimeRange? dateTime;
  final TimeRange? time;
  final bool isDate;
  const FilterRowWidget({
    super.key,
    this.labelText,
    this.isDropDownEnable = true,
    this.isDate = true,
    this.hintText,
    this.filterData,
    this.filterType = TerminFilterType.date,
    this.dateTime,
    this.time,
  });

  @override
  State<FilterRowWidget> createState() => _FilterRowWidgetState();
}

class _FilterRowWidgetState extends State<FilterRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppCommonSize.s20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText ?? '',
            style: kP2Text.copyWith(
              fontWeight: regularFont,
              color: AppColors.kBlackColorOne,
            ),
          ),
          kHeightBox10,
          !widget.isDropDownEnable
              ? GestureDetector(
                  onTap: () async {
                    if (widget.isDate) {
                      CustomDialog.showDateRangeCalenderFilter(
                        context,
                        onReset: () {
                          Navigator.pop(context);
                          context.read<TerminCubit>().changeDateRange();
                        },
                        onApply: () => Navigator.pop(context),
                      );
                    } else {
                      TimeRange? result = await showTimeRangePicker(
                        context: context,
                        use24HourFormat: true,
                        barrierDismissible: false,
                        builder: (BuildContext context, Widget? child) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child ?? SizedBox(),
                          );
                        },
                      );
                      context.read<TerminCubit>().changeTimeRange(time: result);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        vertical: AppCommonSize.s10,
                        horizontal: AppCommonSize.s14),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColors.kGrayColorThree,
                      ),
                      borderRadius: BorderRadius.circular(AppCommonSize.s8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.isDate
                            ? Text(
                                widget.dateTime == null
                                    ? (widget.hintText ?? '')
                                    : "${CustomTimeFormatter.dateRangeFormat(widget.dateTime?.start)} - ${CustomTimeFormatter.dateRangeFormat(widget.dateTime?.end)}",
                                style: kP3Text.copyWith(
                                  color: AppColors.kAshColorOne,
                                  fontWeight: regularFont,
                                ),
                              )
                            : Text(
                                widget.time == null
                                    ? (widget.hintText ?? '')
                                    : "${CustomTimeFormatter.timeRangeFormat(widget.time!.startTime)} - ${CustomTimeFormatter.timeRangeFormat(widget.time!.endTime)}",
                                style: kP3Text.copyWith(
                                  color: AppColors.kAshColorOne,
                                  fontWeight: regularFont,
                                ),
                              ),
                        CustomSvg(
                          icon: widget.isDate
                              ? AppImages.calender
                              : AppImages.clockFilter,
                          size: AppCommonSize.s18,
                        )
                      ],
                    ),
                  ),
                )
              : ExpendedDetails(
                  title: widget.hintText,
                  filterData: widget.filterData,
                  filterType: widget.filterType,
                ),
        ],
      ),
    );
  }
}
