import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_appbar.dart';
import 'package:terminator/features/components/custom_button2.dart';
import 'package:terminator/features/components/custom_dialogs.dart';
import 'package:terminator/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:terminator/features/components/custom_svg.dart';
import 'package:terminator/features/components/custom_text_field.dart';
import 'package:terminator/features/router/routes.dart';
import 'package:terminator/features/screens/dashboard/view/termin_list.dart';
import 'package:terminator/features/screens/termine/cubit/termin_cubit.dart';
import 'package:terminator/features/screens/termine/widgets/filter_bottom_sheet.dart';

class TermineScreen extends StatefulWidget {
  const TermineScreen({super.key});

  @override
  State<TermineScreen> createState() => _TermineScreenState();
}

class _TermineScreenState extends State<TermineScreen> {
  Timer? _debounce;

  @override
  void initState() {
    context.read<TerminCubit>().homeController =
        RefreshController(initialRefresh: false);
    getData(isRefresh: true);
    context.read<TerminCubit>().getFilterData();
    super.initState();
  }

  void getData(
      {bool isToday = false, bool isRefresh = false, bool isSearch = false}) {
    if (isRefresh) {
      context.read<TerminCubit>().searchController.clear();
      context.read<TerminCubit>().sort = SortStatus.desc;
      context.read<TerminCubit>().resetFilter(isReset: true);
    } else if (isSearch) {
      context.read<TerminCubit>().resetFilter(isReset: true);
    }
    context.read<TerminCubit>().getTerminData(isToday: isToday);
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 800),
      () => getData(isSearch: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.termine.tr(),
        onPress: () {
          Navigator.pop(context);
          getData(isRefresh: true, isToday: true);
        },
      ),
      body: BlocConsumer<TerminCubit, TerminState>(
        listener: (context, state) {
          if (state.status == TerminStatus.unAuthorized) {
            CustomDialog.showUnAuthorisedDialog(
              context: context,
              onYes: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
              },
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWeight.s20),
            child: Column(
              children: [
                CustomTextField(
                  height: AppCommonSize.s12,
                  hintColor: AppColors.kAshColorThree,
                  controller: context.read<TerminCubit>().searchController,
                  hint: AppStrings.searchHint.tr(),
                  hintTextSize: AppTextSize.s14,
                  prefixIcon: Icons.search,
                  borderColor: AppColors.kGrayColorThree,
                  fillColor: AppColors.kWhiteColorTwo,
                  keyboardType: TextInputType.emailAddress,
                  textColor: AppColors.kPurpleColorFour,
                  onChanged: (s) {
                    _onSearchChanged(s);
                  },
                ),
                kHeightBox5,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: context.read<TerminCubit>().sortToggle,
                      child: Chip(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.zero,
                        clipBehavior: Clip.none,
                        labelPadding: EdgeInsets.zero,
                        avatar: CustomSvg(
                          icon:
                              context.read<TerminCubit>().sort == SortStatus.asc
                                  ? AppImages.sort
                                  : AppImages.sortRev,
                          size: AppCommonSize.s16,
                        ),
                        label: Text(
                          AppStrings.sort.tr(),
                          style: kP2Text.copyWith(
                            fontWeight: regularFont,
                            color: AppColors.kBlackColorOne,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    CustomButton2(
                      title: AppStrings.filter.tr(),
                      radius: AppCommonSize.s12,
                      isGradient: true,
                      isIconEnable: true,
                      icon: AppImages.filter,
                      iconSize: AppCommonSize.s16,
                      padding: EdgeInsets.symmetric(
                        vertical: AppHeight.s10,
                        horizontal: AppWeight.s25,
                      ),
                      onPress: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          backgroundColor: AppColors.kWhiteColorOne,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppCommonSize.s10),
                              topRight: Radius.circular(AppCommonSize.s10),
                            ),
                          ),
                          isScrollControlled: true,
                          builder: (BuildContext sheetContext) {
                            return FilterBottomSheet(
                              filterList: state.filterList,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                kHeightBox15,
                TerminList(
                  controller: context.read<TerminCubit>().homeController,
                  state: state,
                  onRefresh: () {
                    getData(isRefresh: true);
                  },
                  onLoading: state.hasReachedMax ? null : getData,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
