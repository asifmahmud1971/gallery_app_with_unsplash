import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_button2.dart';
import 'package:terminator/features/components/custom_dialogs.dart';
import 'package:terminator/features/components/custom_svg.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/router/routes.dart';
import 'package:terminator/features/screens/auth/cubit/auth_cubit.dart';
import 'package:terminator/features/screens/dashboard/view/performance_page.dart';
import 'package:terminator/features/screens/dashboard/view/termine_page.dart';
import 'package:terminator/features/screens/dashboard/widget/tab_title_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // late PageController _pageController;
  int activePageIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  // }
  //
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  Future<bool> _onBackPressed() async {
    return CustomDialog.showCustomDialog2(
      context: context,
      title: AppStrings.appExitTitle.tr(),
      details: AppStrings.appExitTitleDesc.tr(),
      onYes: () => SystemNavigator.pop(),
    ).show().then(
          (value) => value as bool,
        );
  }

  void _onLogout() {
    return CustomDialog.showCustomDialog2(
      context: context,
      title: AppStrings.logOutTitle.tr(),
      details: AppStrings.logOutDesc.tr(),
      onYes: () {
        GetContext.back();
        context.read<AuthCubit>().logout();
      },
    );
  }

  void onPageChange(int index) {
    if (activePageIndex != index) {
      setState(() {
        activePageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onBackPressed();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kGrayColorThree,
          centerTitle: false,
          elevation: .3,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSvg(icon: AppImages.home),
              kWidthBox8,
              Text(
                AppStrings.home.tr(),
                style: kH2Text.copyWith(
                  color: AppColors.kPurpleColorTwo,
                  fontWeight: mediumFont,
                ),
              ),
              Spacer(),
              CustomButton2(
                isIconEnable: true,
                title: AppStrings.termine.tr(),
                icon: AppImages.activeDoc,
                isGradient: true,
                radius: AppCommonSize.s50,
                onPress: () {
                  Navigator.pushNamed(context, Routes.termineScreen);
                },
              ),
              kWidthBox18,
              InkWell(
                child: CustomSvg(icon: AppImages.exit),
                onTap: () => _onLogout(),
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
                        title: AppStrings.termine.tr(),
                        onPress: () {
                          onPageChange(0);
                        },
                      ),
                    ),
                    kWidthBox15,
                    Expanded(
                      child: TabTitleWidget(
                        isActive: activePageIndex == 1,
                        title: AppStrings.myPerformance.tr(),
                        onPress: () {
                          onPageChange(1);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 5,
                  child:
                      activePageIndex == 0 ? TerminePage() : PerformancePage()

                  // PageView(
                  //   controller: _pageController,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   onPageChanged: (int i) {
                  //     FocusScope.of(context).requestFocus(FocusNode());
                  //     setState(() {
                  //       activePageIndex = i;
                  //     });
                  //   },
                  //   children: <Widget>[
                  //     TerminePage(),
                  //     PerformancePage(),
                  //
                  //     // PieChartSample3(),
                  //   ],
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
