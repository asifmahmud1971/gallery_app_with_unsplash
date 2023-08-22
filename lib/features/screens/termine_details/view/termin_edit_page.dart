import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_appbar.dart';
import 'package:terminator/features/components/custom_button2.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/router/routes.dart';
import 'package:terminator/features/screens/dashboard/widget/tab_title_widget.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';
import 'package:terminator/features/screens/termine_details/view/editable_page.dart';
import 'package:terminator/features/screens/termine_details/view/non_editable_page.dart';

class TermineEditPage extends StatefulWidget {
  final String? id;
  final bool? apiCall;

  const TermineEditPage({super.key, this.id, this.apiCall = false});

  @override
  State<TermineEditPage> createState() => _TermineEditPageState();
}

class _TermineEditPageState extends State<TermineEditPage> {
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.apiCall!) {
      context.read<TerminDetailsCubit>().getTerminDetails(widget.id);
    }
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTermineButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 400), curve: Curves.decelerate);
  }

  void _onPerformanceButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 400), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TerminDetailsCubit, TerminDetailsState>(
      listener: (context, state) {
        if (state.status == TerminDetailsStatus.editSuccess) {
          GetContext.offAll(Routes.dashboard);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.editTermin.tr(),
        ),
        bottomNavigationBar: Padding(
          padding: REdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 1.sw,
                child: CustomButton2(
                  onPress: () {
                    context.read<TerminDetailsCubit>().editDetails(widget.id);
                  },
                  title: AppStrings.continueWorkFlow.tr(),
                  isIconEnable: true,
                  icon: AppImages.iconsContinueWorkflow,
                  iconSize: AppCommonSize.s15,
                  isGradient: true,
                  radius: 10,
                ),
              ),
              10.verticalSpace,
              SizedBox(
                width: 1.sw,
                child: CustomButton2(
                  onPress: () {
                    context.read<TerminDetailsCubit>().clear();
                    GetContext.back();
                  },
                  title: AppStrings.cancel.tr(),
                  btnColor: Colors.white,
                  textColor: AppColors.kPurpleColorFour,
                  radius: 10,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppCommonSize.s20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppCommonSize.s25),
                child: Row(
                  children: [
                    Expanded(
                      child: TabTitleWidget(
                        isActive: activePageIndex == 0,
                        title: AppStrings.editable.tr(),
                        onPress: () {
                          _onTermineButtonPress();
                        },
                      ),
                    ),
                    kWidthBox15,
                    Expanded(
                      child: TabTitleWidget(
                        isActive: activePageIndex == 1,
                        title: AppStrings.nonEditable.tr(),
                        onPress: () {
                          _onPerformanceButtonPress();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      activePageIndex = i;
                    });
                  },
                  children: <Widget>[
                    EditablePage(),
                    NonEditablePage(),
                    // PieChartSample3(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
