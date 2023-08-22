import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';

class Address extends StatelessWidget {
  const Address({super.key});

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
                    title: AppStrings.street.tr(),
                    value: state.terminDetailsModel?.street ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.houseNumber.tr(),
                    value: state.terminDetailsModel?.houseNumber ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.zipCode.tr(),
                    value: state.terminDetailsModel?.zipCode ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.city.tr(),
                    value: state.terminDetailsModel?.city ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.country.tr(),
                    value: state.terminDetailsModel?.country ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.canton.tr(),
                    value: state.terminDetailsModel?.canton ?? ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.region.tr(),
                    value: state.terminDetailsModel?.region ?? ""),
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
