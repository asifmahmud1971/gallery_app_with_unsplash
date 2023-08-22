import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_dialogs.dart';
import 'package:terminator/features/router/routes.dart';
import 'package:terminator/features/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:terminator/features/screens/dashboard/model/performance_model.dart';
import 'package:terminator/features/screens/dashboard/widget/filter_widget.dart';

enum PostOptionType { today, yesterday, last_week, last_month, custom }

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  final List<Map<PostOptionType, String>> menuItems = [
    {PostOptionType.today: AppStrings.today.tr()},
    {PostOptionType.yesterday: AppStrings.yesterday.tr()},
    {PostOptionType.last_week: AppStrings.lastWeek.tr()},
    {PostOptionType.last_month: AppStrings.lastMonth.tr()},
    {PostOptionType.custom: AppStrings.custom.tr()},
  ];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    context.read<DashboardCubit>().toggleFilter();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if (state.status == DashboardStatus.unAuthorized) {
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
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppHeight.s25, horizontal: AppWeight.s30),
              decoration: BoxDecoration(
                color: AppColors.kWhiteColorOne,
                borderRadius: BorderRadius.circular(AppCommonSize.s20),
                border: Border.all(width: 1, color: AppColors.kGrayColorThree),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.myPerformance.tr(),
                    style: kH3Text.copyWith(
                      fontWeight: semiBoldFont,
                      color: AppColors.kPurpleColorFour,
                    ),
                  ),
                  kHeightBox12,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${AppStrings.total.tr()} ',
                          style: kP2Text.copyWith(
                            color: AppColors.kAshColorOne,
                            fontWeight: boldFont,
                          ),
                        ),
                        TextSpan(
                          text: state.performanceList?.totalContactDataRecord
                              .toString(),
                          style: kP2Text.copyWith(
                            color: AppColors.kAshColorOne,
                            fontWeight: regularFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                  kHeightBox30,
                  FilterWidget(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SfCircularChart(
                        margin: EdgeInsets.zero,
                        series: <CircularSeries>[
                          PieSeries<PieChart, String>(
                            dataSource: state.performanceList?.pieChart,
                            xValueMapper: (PieChart data, _) => data.label,
                            yValueMapper: (PieChart data, _) => data.count,
                            pointColorMapper: (PieChart data, _) => data.color,
                            dataLabelMapper: (PieChart data, int) =>
                                '${data.percentage}%',
                            dataLabelSettings: DataLabelSettings(
                              labelAlignment: ChartDataLabelAlignment.middle,
                              textStyle: kP2Text.copyWith(
                                fontWeight: boldFont,
                                color: AppColors.kWhiteColor,
                              ),
                              isVisible: true,
                              overflowMode: OverflowMode.trim,
                            ),
                          )
                        ],
                      ),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.performanceList?.pieChart?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                decoration: BoxDecoration(
                                    color: state.performanceList
                                        ?.pieChart?[index].color,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  '${state.performanceList?.pieChart?[index].count}',
                                  style: kP2Text.copyWith(
                                    fontWeight: boldFont,
                                    color: AppColors.kWhiteColor,
                                  ),
                                ),
                              ),
                              kWidthBox5,
                              Flexible(
                                child: Text(
                                  state.performanceList?.pieChart?[index]
                                          .label ??
                                      '',
                                  style: kP2Text.copyWith(
                                    color: AppColors.kAshColorOne,
                                    fontWeight: regularFont,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => kHeightBox5,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
