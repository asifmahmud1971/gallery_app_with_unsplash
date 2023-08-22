import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/screens/termine_details/view/general_contact_record_edit.dart';
import 'package:terminator/features/screens/termine_details/widget/termin_details_expand.dart';

class EditablePage extends StatefulWidget {
  const EditablePage({super.key});

  @override
  State<EditablePage> createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          TerminExpendedDetails(
            title: AppStrings.generalContactRecordInformation.tr(),
            child: GeneralContactRecordEdit(),
          ),
        ],
      ),
    );
  }
}
