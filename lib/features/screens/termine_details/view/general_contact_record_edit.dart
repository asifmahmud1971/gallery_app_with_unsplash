import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_time_formatter.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';
import 'package:terminator/features/screens/termine_details/helper/visibility_check.dart';
import 'package:terminator/features/screens/termine_details/model/appointment_model.dart';
import 'package:terminator/features/screens/termine_details/widget/image_upload.dart';
import 'package:terminator/features/screens/termine_details/widget/widgets.dart';

class GeneralContactRecordEdit extends StatefulWidget {
  final String? id;

  const GeneralContactRecordEdit({super.key, this.id});

  @override
  State<GeneralContactRecordEdit> createState() =>
      _GeneralContactRecordEditState();
}

class _GeneralContactRecordEditState extends State<GeneralContactRecordEdit> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TerminDetailsCubit>().clear();

    super.initState();
  }

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
                10.verticalSpace,
                radioButton(),
                10.verticalSpace,
                Visibility(
                    visible: context
                                .read<TerminDetailsCubit>()
                                .selectedAppointment ==
                            0
                        ? true
                        : false,
                    child: Column(
                      children: [
                        resultDropdown(
                            hint: AppStrings.selectResult.tr(),
                            title: AppStrings.result.tr(),
                            value: GetContext.context
                                .read<TerminDetailsCubit>()
                                .selectedResult,
                            list: GetContext.context
                                .read<TerminDetailsCubit>()
                                .resultList,
                            onChanged: (value) {
                              setState(() {});
                              GetContext.context
                                  .read<TerminDetailsCubit>()
                                  .followUpDateTimeSelect(dateTime: null);
                              GetContext.context
                                  .read<TerminDetailsCubit>()
                                  .selectResult(ResultModel(
                                      value: value!.value, label: value.label));
                            }),
                        10.verticalSpace,
                      ],
                    )),
                Visibility(
                    visible: context
                            .read<TerminDetailsCubit>()
                            .selectedResult
                            ?.value ==
                        "Follow up contact necessary",
                    child: Column(
                      children: [
                        textYearCard(
                            selectedYear: GetContext.context
                                        .read<TerminDetailsCubit>()
                                        .followUpDateTime !=
                                    null
                                ? CustomTimeFormatter.timeDateFormat(GetContext
                                    .context
                                    .read<TerminDetailsCubit>()
                                    .followUpDateTime)
                                : AppStrings.selectDateTime.tr(),
                            title: AppStrings.followUpContactDateTime.tr(),
                            onTap: () {
                              DatePicker.showDateTimePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2020, 5, 5, 20, 50),
                                  maxTime: DateTime(2050, 6, 7, 05, 09),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                print('confirm $date');

                                context
                                    .read<TerminDetailsCubit>()
                                    .followUpDateTimeSelect(dateTime: date);
                              },
                                  currentTime: context
                                      .read<TerminDetailsCubit>()
                                      .followUpDateTime,
                                  locale: context.locale.scriptCode);
                            }),
                        10.verticalSpace,
                      ],
                    )),
                Visibility(
                  visible: TerminHelper().isExplanation(),
                  child: context
                              .read<TerminDetailsCubit>()
                              .selectedAppointment ==
                          0
                      ? explanationDropdown(
                          title: AppStrings.explanation.tr(),
                          value: context
                                  .read<TerminDetailsCubit>()
                                  .selectedPositiveExplanation ??
                              Appointment(label: "", value: "", type: "yes"),
                          list: hasAppointment,
                          onChanged: (value) {
                            //log("${value!.value}");
                            setState(() {});
                            context.read<TerminDetailsCubit>().selectYear(null);

                            context
                                .read<TerminDetailsCubit>()
                                .selectedExplanation(
                                    Appointment(
                                        value: value!.value,
                                        label: value.label),
                                    "yes");
                          })
                      : explanationDropdown(
                          title: AppStrings.explanation.tr(),
                          value: context
                                  .read<TerminDetailsCubit>()
                                  .selectedNegativeExplanation ??
                              Appointment(label: "", value: "", type: "no"),
                          list: noAppointment,
                          onChanged: (value) {
                            //log("${value!.value}");
                            setState(() {});
                            context
                                .read<TerminDetailsCubit>()
                                .selectedExplanation(
                                    Appointment(
                                        value: value!.value,
                                        label: value.label),
                                    "no");
                          }),
                ),
                Visibility(
                    visible: TerminHelper().isExpirationYear(),
                    child: Column(
                      children: [
                        10.verticalSpace,
                        textYearCard(
                            selectedYear: GetContext.context
                                        .read<TerminDetailsCubit>()
                                        .selectedYear !=
                                    null
                                ? CustomTimeFormatter.localToUTCDayFormat(
                                        GetContext.context
                                            .read<TerminDetailsCubit>()
                                            .selectedYear)
                                    .toString()
                                : AppStrings.selectYear.tr(),
                            title: AppStrings.expirationYear.tr(),
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2020, 5, 5, 20, 50),
                                  maxTime: DateTime(2050, 6, 7, 05, 09),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                print('confirm $date');

                                context
                                    .read<TerminDetailsCubit>()
                                    .selectYear(date);
                              },
                                  currentTime: context
                                      .read<TerminDetailsCubit>()
                                      .followUpDateTime,
                                  locale: context.locale.scriptCode);
                            }),
                      ],
                    )),
                Visibility(
                  visible: context
                          .read<TerminDetailsCubit>()
                          .selectedResult
                          ?.value ==
                      "Positive",
                  child: textFieldCard(
                      textInputType: TextInputType.number,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      controller:
                          context.read<TerminDetailsCubit>().contractedSign,
                      title: AppStrings.contractsSigned.tr(),
                      hint: AppStrings.enterContractsSign.tr()),
                ),
                Visibility(
                  visible: TerminHelper().isPhoto(),
                  child: ImageUpload(
                    title: AppStrings.photoOnSite.tr(),
                  ),
                ),
                Visibility(
                  visible: TerminHelper().isOthers(),
                  child: textFieldCard(
                      controller:
                          context.read<TerminDetailsCubit>().othersController,
                      title: AppStrings.other.tr(),
                      hint: AppStrings.enterOthers.tr()),
                ),
                textFieldCard(
                    maxLine: 5,
                    controller: context
                        .read<TerminDetailsCubit>()
                        .intermediaryRemarksController,
                    title: AppStrings.intermediaryRemarks.tr(),
                    hint: AppStrings.enterIntermediaryRemarks.tr()),
              ],
            ),
          ),
        );
      },
    );
  }

  radioButton() {
    List<String> list = [AppStrings.yes.tr(), AppStrings.no.tr()];

    return BlocBuilder<TerminDetailsCubit, TerminDetailsState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Text(
                AppStrings.appointmentHeld.tr(),
                style: kRegularLine14.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
              ),
            ),
            Expanded(
              child: Wrap(
                children: List.generate(
                  list.length,
                  (index) => textCardWithCheckBox(
                      enable: context
                                  .read<TerminDetailsCubit>()
                                  .selectedAppointment ==
                              index
                          ? true
                          : false,
                      onTap: () {
                        setState(() {});
                        context.read<TerminDetailsCubit>().selectedExplanation(
                            Appointment(), index == 0 ? "yes" : "no");
                        context
                            .read<TerminDetailsCubit>()
                            .selectResult(ResultModel());

                        context
                            .read<TerminDetailsCubit>()
                            .selectAppointment(index: index);
                        context.read<TerminDetailsCubit>().fileList.clear();

                        if (context
                                .read<TerminDetailsCubit>()
                                .selectedAppointment !=
                            index) {
                          context.read<TerminDetailsCubit>().clear();
                        }
                      },
                      value: list[index]),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
