import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_svg.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';
import 'package:terminator/features/screens/termine_details/model/termin_details_model.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TerminDetailsCubit, TerminDetailsState>(
      builder: (context, state) {
        return Container(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                textCardWithBox(
                    isData:
                        state.terminDetailsModel?.availability?.isNotEmpty ??
                            false,
                    title: AppStrings.accessibility.tr(),
                    list: state.terminDetailsModel?.availability ?? []),
                10.verticalSpace,
                textCard(
                    title: AppStrings.desiredConsultingChannel.tr(),
                    value:
                        state.terminDetailsModel?.desiredConsultationChannel ??
                            ""),
              ],
            ),
          ),
        );
      },
    );
  }

  textCardWithBox(
      {title, bool isData = true, day, from, to, List<Availability>? list}) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                title,
                style: kRegularLine14.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
              )),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomSvg(
                    icon:
                        isData ? AppImages.uncheckedBox : AppImages.checkedBox,
                    size: 12.r,
                  ),
                  5.horizontalSpace,
                  Text(
                    AppStrings.noData.tr(),
                    style: kRegularLine13.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.kAshColorOne),
                  ),
                ],
              )),
            ],
          ),
          10.verticalSpace,
          Column(
            children: List.generate(
                list?.length ?? 0,
                (index) => infoCard(
                    day: list?[index].day ?? "",
                    firstStartTime: removeLastThreeCharacters(
                        list![index].firstStartTime.toString()),
                    firstEndTime: removeLastThreeCharacters(
                        list[index].firstEndTime.toString()),
                    lastStartTime: removeLastThreeCharacters(
                        list[index].lastStartTime.toString()),
                    lastEndTime: removeLastThreeCharacters(
                        list[index].lastEndTime.toString()))),
          )
        ],
      ),
    );
  }

  String removeLastThreeCharacters(String? inputString) {
    if ((inputString?.length ?? 0) >= 3 && inputString != null) {
      return inputString.substring(0, inputString.length - 3);
    } else {
      // Handle cases where the input string is shorter than 3 characters
      return "";
    }
  }

  infoCard(
      {bool isData = true,
      day,
      firstStartTime,
      firstEndTime,
      lastStartTime,
      lastEndTime}) {
    return Padding(
      padding: REdgeInsets.only(bottom: 10),
      child: Container(
        padding: REdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day ?? "Monday",
              style: kRegularLine14.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
            ),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.from.tr(),
                            style: kRegularLine14.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.kAshColorOne)),
                        5.verticalSpace,
                        Text(firstStartTime ?? "09:00",
                            style: kRegularLine13.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.kAshColorOne)),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.to.tr(),
                            style: kRegularLine14.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.kAshColorOne)),
                        5.verticalSpace,
                        Text(firstEndTime ?? "09:00",
                            style: kRegularLine13.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.kAshColorOne)),
                      ],
                    )),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.from.tr(),
                            style: kRegularLine14.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.kAshColorOne)),
                        5.verticalSpace,
                        Text(lastStartTime ?? "09:00",
                            style: kRegularLine13.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.kAshColorOne)),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.to.tr(),
                            style: kRegularLine14.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.kAshColorOne)),
                        5.verticalSpace,
                        Text(lastEndTime ?? "09:00",
                            style: kRegularLine13.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.kAshColorOne)),
                      ],
                    )),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  textCard({title, value}) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                fontWeight: FontWeight.w400, color: AppColors.kAshColorOne),
          )),
        ],
      ),
    );
  }
}
