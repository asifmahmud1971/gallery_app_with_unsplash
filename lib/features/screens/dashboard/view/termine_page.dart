import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_dialogs.dart';
import 'package:terminator/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:terminator/features/router/routes.dart';
import 'package:terminator/features/screens/dashboard/view/termin_list.dart';
import 'package:terminator/features/screens/termine/cubit/termin_cubit.dart';

class TerminePage extends StatefulWidget {
  const TerminePage({super.key});

  @override
  State<TerminePage> createState() => _TerminePageState();
}

class _TerminePageState extends State<TerminePage> {
  @override
  void initState() {
    getData(isRefresh: true);
    super.initState();
  }

  void getData({bool isRefresh = false}) {
    if (isRefresh) {
      context.read<TerminCubit>().page = 1;
    }
    context.read<TerminCubit>().getTerminData(isToday: true);
  }

  @override
  Widget build(BuildContext context) {
    context.read<TerminCubit>().homeTodayController =
        RefreshController(initialRefresh: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPurpleColorFour,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          AppStrings.appName.tr(),
          style: kRegularLine20.copyWith(
              color: AppColors.kWhiteColor, fontWeight: FontWeight.w700),
        ),
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
          return TerminList(
            state: state,
            controller: context.read<TerminCubit>().homeTodayController,
            onRefresh: () {
              getData(isRefresh: true);
            },
            onLoading: state.hasReachedMax
                ? null
                : () {
                    getData();
                  },
          );
        },
      ),
    );
  }
}
