import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_image.dart';
import 'package:terminator/features/components/custom_time_formatter.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';
import 'package:terminator/features/screens/termine_details/model/termin_details_model.dart';

class TermineOption extends StatelessWidget {
  const TermineOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TerminDetailsCubit, TerminDetailsState>(
      builder: (context, state) {
        return Container(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                textCard(
                    isView:
                        state.terminDetailsModel?.lastAppointment?.prefixId !=
                            null,
                    title: AppStrings.terminId.tr(),
                    value:
                        state.terminDetailsModel?.lastAppointment?.prefixId ??
                            ""),
                textCard(
                    isView: state.terminDetailsModel?.createdAt != null,
                    title: AppStrings.terminDate.tr(),
                    value: CustomTimeFormatter.utcToLocalDayFormat(
                        DateTime.parse(state.terminDetailsModel?.lastAppointment
                                ?.appointmentDateTime ??
                            DateTime.now().toString()))),
                textCard(
                    isView: state.terminDetailsModel?.createdAt != null,
                    title: AppStrings.terminTime.tr(),
                    value: CustomTimeFormatter.utcToLocalTimeFormat(
                        DateTime.parse(state.terminDetailsModel?.lastAppointment
                                ?.appointmentDateTime ??
                            DateTime.now().toString()))),
                textCardWithCheckBox(
                    isView: state.terminDetailsModel?.intermediaryFeedback
                            ?.appointmentTookPlace !=
                        null,
                    enable: state.terminDetailsModel?.intermediaryFeedback
                                ?.appointmentTookPlace ==
                            0
                        ? false
                        : true,
                    title: AppStrings.appointmentHeld.tr(),
                    value: state.terminDetailsModel?.intermediaryFeedback
                                ?.appointmentTookPlace ==
                            0
                        ? AppStrings.no.tr()
                        : AppStrings.yes.tr()),
                textCard(
                    isView: state.terminDetailsModel?.intermediaryFeedback
                            ?.intermediaryRemarks !=
                        null,
                    title: AppStrings.intermediaryRemarks.tr(),
                    value: state.terminDetailsModel?.intermediaryFeedback
                            ?.intermediaryRemarks ??
                        ""),
                textCard(
                    isView: state.terminDetailsModel?.intermediaryFeedback
                            ?.reason?.label !=
                        null,
                    title: AppStrings.explanation.tr(),
                    value: state.terminDetailsModel?.intermediaryFeedback
                            ?.reason?.label ??
                        ""),
                textCardWithPhoto(
                    isView: state
                            .terminDetailsModel?.intermediaryFeedback?.images !=
                        null,
                    title: AppStrings.photoOnSite.tr(),
                    images: state
                            .terminDetailsModel?.intermediaryFeedback?.images ??
                        []),
                textCardWithCheckBox(
                    isView: state.terminDetailsModel?.intermediaryFeedback
                            ?.outcome?.label !=
                        null,
                    title: AppStrings.result.tr(),
                    value: state.terminDetailsModel?.intermediaryFeedback
                            ?.outcome?.label ??
                        ""),
                textCard(
                    isView: state.terminDetailsModel?.intermediaryFeedback
                            ?.contractsConcluded !=
                        null,
                    title: AppStrings.contractsSigned.tr(),
                    value: state.terminDetailsModel?.intermediaryFeedback
                            ?.contractsConcluded ??
                        ""),
              ],
            ),
          ),
        );
      },
    );
  }

  textCardWithPhoto(
      {title,
      List<DetailsImages>? images,
      bool? enable = true,
      bool? isView = false}) {
    return Visibility(
      visible: isView!,
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  title,
                  style: kRegularLine14.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.kAshColorOne),
                )),
                Expanded(
                    child: Wrap(
                  children: List.generate(
                      images?.length ?? 0,
                      (index) => Padding(
                            padding: REdgeInsets.all(5.0),
                            child: CustomImage(
                              imageUrl: images?[index].imageUrl ?? "",
                              radius: 10,
                              width: 60.r,
                              height: 60.r,
                            ),
                          )),
                )),
              ],
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  textCardWithCheckBox(
      {title, value, bool? enable = true, bool? isView = false}) {
    return Visibility(
      visible: isView!,
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  title,
                  style: kRegularLine14.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.kAshColorOne),
                )),
                Expanded(
                    child: Row(
                  children: [
                    Icon(
                      enable! ? Icons.radio_button_on : Icons.radio_button_off,
                      size: 13.r,
                      color: AppColors.kPurpleColorFour,
                    ),
                    5.horizontalSpace,
                    Text(
                      value,
                      style: kRegularLine13.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.kAshColorOne),
                    ),
                  ],
                )),
              ],
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  textCard({title, value, bool? isView = false}) {
    return Visibility(
      visible: isView!,
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  title,
                  style: kRegularLine14.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.kAshColorOne),
                )),
                Expanded(
                    child: Text(
                  "$value",
                  style: kRegularLine13.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.kAshColorOne),
                )),
              ],
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
