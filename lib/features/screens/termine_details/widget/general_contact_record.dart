import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';

class GeneralContactRecord extends StatelessWidget {
  final String? id;

  const GeneralContactRecord({super.key, this.id});

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
                    title: AppStrings.terminId.tr(),
                    value:
                        state.terminDetailsModel?.lastAppointment?.prefixId ??
                            ""),
                10.verticalSpace,
                textCard(
                    title: AppStrings.assinedTo.tr(),
                    value:
                        state.terminDetailsModel?.allocation?.user?.fullName ??
                            ""),
              ],
            ),
          ),
        );
      },
    );
  }

  textCard({title, value}) {
    return Row(
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
    );
  }
}
