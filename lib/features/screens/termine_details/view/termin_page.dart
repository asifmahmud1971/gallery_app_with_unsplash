import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';
import 'package:terminator/features/screens/termine_details/widget/address.dart';
import 'package:terminator/features/screens/termine_details/widget/contact_information.dart';
import 'package:terminator/features/screens/termine_details/widget/general_contact_record.dart';
import 'package:terminator/features/screens/termine_details/widget/personal_information.dart';
import 'package:terminator/features/screens/termine_details/widget/termin_details_expand.dart';
import 'package:terminator/features/screens/termine_details/widget/termin_relevant_information.dart';
import 'package:terminator/features/screens/termine_details/widget/termine_option.dart';

class TerminPage extends StatefulWidget {
  final String? id;
  const TerminPage({super.key, this.id});

  @override
  State<TerminPage> createState() => _TerminPageState();
}

class _TerminPageState extends State<TerminPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TerminDetailsCubit>().getTerminDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          TerminExpendedDetails(
            title: AppStrings.generalContactRecordInformation.tr(),
            child: GeneralContactRecord(),
          ),
          10.verticalSpace,
          TerminExpendedDetails(
            title: AppStrings.personalInformation.tr(),
            child: PersonalInformation(),
          ),
          10.verticalSpace,
          TerminExpendedDetails(
            title: AppStrings.address.tr(),
            child: Address(),
          ),
          10.verticalSpace,
          TerminExpendedDetails(
            title: AppStrings.terminRelevantInformation.tr(),
            child: TerminRelevantInformation(),
          ),
          10.verticalSpace,
          TerminExpendedDetails(
            title: AppStrings.contactInformation.tr(),
            child: ContactInformation(),
          ),
          10.verticalSpace,
          TerminExpendedDetails(
            title: AppStrings.termine.tr(),
            child: TermineOption(),
          ),
        ],
      ),
    );
  }
}
