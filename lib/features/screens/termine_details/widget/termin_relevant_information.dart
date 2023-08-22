import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';

class TerminRelevantInformation extends StatelessWidget {
  const TerminRelevantInformation({super.key});

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
                    title: AppStrings.carInsurance.tr(),
                    value: state.terminDetailsModel?.carInsurance ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.pillarThree.tr(),
                    value: state.terminDetailsModel?.thirdPiller ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.homeContents.tr(),
                    value: state.terminDetailsModel?.householdGoods ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.legalProtection.tr(),
                    value: state.terminDetailsModel?.legalProtection ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.healthStatus.tr(),
                    value: state.terminDetailsModel?.healthStatus ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.healthInsurance.tr(),
                    value: state.terminDetailsModel?.healthInsurance ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.contactPersonForInsuranceIssue.tr(),
                    value: state.terminDetailsModel
                            ?.contactPersonForInsuranceQuestions ??
                        ""),
                textCard(
                    title: AppStrings.accident.tr(),
                    value: state.terminDetailsModel?.accident ?? ""),
                textCard(
                    title: AppStrings.franchise.tr(),
                    value: state.terminDetailsModel?.franchise ?? ""),
                textCard(
                    title: AppStrings.supplementaryInsurance.tr(),
                    value:
                        state.terminDetailsModel?.supplementaryInsurance ?? ""),
                textCard(
                    title: AppStrings.save.tr(),
                    value: state.terminDetailsModel?.save ?? ""),
                textCard(
                    title: AppStrings.lastChangeHealthInsurance.tr(),
                    value:
                        state.terminDetailsModel?.lastHealthInsuranceChange ??
                            ""),
                textCard(
                    title: AppStrings.content.tr(),
                    value: state.terminDetailsModel?.satisfaction ?? ""),
                textCard(
                    title: AppStrings.numberPersonsHousehold.tr(),
                    value: state.terminDetailsModel?.numberOfPersonsInHousehold
                            .toString() ??
                        ""),
                textCard(
                    title: AppStrings.workingActivity.tr(),
                    value: state.terminDetailsModel?.workActivity ?? ""),
              ],
            ),
          ),
        );
      },
    );
  }

  textCard({title, value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              style: kRegularLine14.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              value,
              style: kRegularLine13.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.kAshColorOne),
            ),
          )),
        ],
      ),
    );
  }
}
