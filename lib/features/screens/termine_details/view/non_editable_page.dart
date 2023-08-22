import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/screens/termine_details/widget/address.dart';
import 'package:terminator/features/screens/termine_details/widget/contact_information.dart';
import 'package:terminator/features/screens/termine_details/widget/general_contact_record.dart';
import 'package:terminator/features/screens/termine_details/widget/personal_information.dart';
import 'package:terminator/features/screens/termine_details/widget/termin_details_expand.dart';
import 'package:terminator/features/screens/termine_details/widget/termin_relevant_information.dart';
import 'package:terminator/features/screens/termine_details/widget/termine_option.dart';

class NonEditablePage extends StatefulWidget {
  const NonEditablePage({super.key});

  @override
  State<NonEditablePage> createState() => _NonEditablePageState();
}

class _NonEditablePageState extends State<NonEditablePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
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
