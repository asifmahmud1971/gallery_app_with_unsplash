import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_time_formatter.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

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
                    title: AppStrings.title.tr(),
                    value: state.terminDetailsModel?.salutation ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.firstName.tr(),
                    value: state.terminDetailsModel?.firstName ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.lastName.tr(),
                    value: state.terminDetailsModel?.lastName ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.dateOfBirth.tr(),
                    value: CustomTimeFormatter.dateTime(
                            state.terminDetailsModel!.dateOfBirth.toString()) ??
                        ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.vintage.tr(),
                    value: CustomTimeFormatter.year(
                            state.terminDetailsModel!.dateOfBirth.toString()) ??
                        ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.mobilePhoneNumber.tr(),
                    value: state.terminDetailsModel?.fullPhoneNumber ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.e_mail.tr(),
                    value: state.terminDetailsModel?.email ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.correspondenceLanguage.tr(),
                    value:
                        state.terminDetailsModel?.correspondenceLanguage ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.otherLanguage.tr(),
                    value:
                        state.terminDetailsModel?.otherLanguages?.join(",") ??
                            ""),
              ],
            ),
          ),
        );
      },
    );
  }

  textCard({title, value}) {
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
                fontWeight: FontWeight.w400, color: AppColors.kAshColorOne),
          )),
        ],
      ),
    );
  }
}
