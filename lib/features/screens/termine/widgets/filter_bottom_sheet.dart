import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_button2.dart';
import 'package:terminator/features/screens/termine/cubit/termin_cubit.dart';
import 'package:terminator/features/screens/termine/model/filter_model.dart';
import 'package:terminator/features/screens/termine/widgets/filter_row_widget.dart';

class FilterBottomSheet extends StatelessWidget {
  final FilterModel? filterList;
  const FilterBottomSheet({super.key, this.filterList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).copyWith().size.height -
          MediaQueryData.fromView(View.of(context)).padding.top,
      padding: EdgeInsets.all(AppCommonSize.s20),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColorOne,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppCommonSize.s10),
          topRight: Radius.circular(AppCommonSize.s10),
        ),
        boxShadow: [AppColors.kOrdinaryShadow],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  size: AppCommonSize.s22,
                  color: AppColors.kPurpleColorFour,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.filter.tr(),
                style: kH2Text.copyWith(
                  fontWeight: mediumFont,
                  color: AppColors.kPurpleColorFour,
                ),
              ),
            ),
            BlocBuilder<TerminCubit, TerminState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.all(AppCommonSize.s35),
                  child: Column(
                    children: [
                      FilterRowWidget(
                        isDropDownEnable: false,
                        labelText: AppStrings.filterDateRange.tr(),
                        hintText: AppStrings.filterDateRangeHint.tr(),
                        dateTime: context.read<TerminCubit>().dateRangeGlobal,
                        filterType: TerminFilterType.date,
                      ),
                      context.read<TerminCubit>().dateRangeGlobal == null
                          ? SizedBox()
                          : FilterRowWidget(
                              isDropDownEnable: false,
                              isDate: false,
                              labelText: AppStrings.filterTimeRange.tr(),
                              hintText: AppStrings.filterTimeRangeHint.tr(),
                              time: context.read<TerminCubit>().timeRangeGlobal,
                              filterType: TerminFilterType.date,
                            ),
                      FilterRowWidget(
                        labelText: AppStrings.cantons.tr(),
                        hintText: AppStrings.cantonsHint.tr(),
                        filterData: filterList?.canton,
                        filterType: TerminFilterType.canton,
                      ),
                      FilterRowWidget(
                        labelText: AppStrings.corLanguage.tr(),
                        hintText: AppStrings.corLanguageHint.tr(),
                        filterData: filterList?.correspondenceLanguage,
                        filterType: TerminFilterType.corrLanguage,
                      ),
                      FilterRowWidget(
                        labelText: AppStrings.otherLanguages.tr(),
                        hintText: AppStrings.otherLanguagesHint.tr(),
                        filterData: filterList?.otherLanguages,
                        filterType: TerminFilterType.otherLanguage,
                      ),
                      FilterRowWidget(
                        labelText: AppStrings.status.tr(),
                        hintText: AppStrings.statusHint.tr(),
                        filterData: filterList?.contactRecordStatus,
                        filterType: TerminFilterType.status,
                      ),
                      kHeightBox25,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton2(
                              title: AppStrings.reset.tr(),
                              radius: AppCommonSize.s12,
                              btnColor: AppColors.kWhiteColorOne,
                              textColor: AppColors.kPurpleColorFour,
                              outlineButton: true,
                              borderColor: AppColors.kGrayColorThree,
                              padding: EdgeInsets.symmetric(
                                vertical: AppHeight.s10,
                              ),
                              onPress: () {
                                Navigator.pop(context);
                                context.read<TerminCubit>().resetFilter();
                              },
                            ),
                          ),
                          kWidthBox12,
                          Expanded(
                            child: CustomButton2(
                              title: AppStrings.apply.tr(),
                              radius: AppCommonSize.s12,
                              isGradient: true,
                              padding: EdgeInsets.symmetric(
                                vertical: AppHeight.s10,
                              ),
                              onPress: () {
                                Navigator.pop(context);
                                context.read<TerminCubit>().page = 1;
                                context.read<TerminCubit>().getTerminData();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
