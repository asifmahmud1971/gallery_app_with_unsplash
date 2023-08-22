import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_appbar.dart';
import 'package:terminator/features/components/custom_button2.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/screens/dashboard/widget/tab_title_widget.dart';
import 'package:terminator/features/screens/termine_details/view/termin_edit_page.dart';
import 'package:terminator/features/screens/termine_details/view/termin_history.dart';
import 'package:terminator/features/screens/termine_details/view/termin_page.dart';

import '../../../../core/constants/app_images.dart';

class TermineDetailsPage extends StatefulWidget {
  final bool isVisible;
  final String? id;

  const TermineDetailsPage({super.key, this.id, this.isVisible = true});

  @override
  State<TermineDetailsPage> createState() => _TermineDetailsPageState();
}

class _TermineDetailsPageState extends State<TermineDetailsPage> {
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.terminDetails.tr(),
      ),
      floatingActionButton: Visibility(
        visible: activePageIndex == 0 ? widget.isVisible : false,
        child: CustomButton2(
          isIconEnable: true,
          icon: AppImages.iconsEdit,
          iconSize: AppCommonSize.s20,
          isGradient: true,
          radius: 10,
          padding: REdgeInsets.symmetric(horizontal: 50, vertical: 10),
          title: AppStrings.edit.tr(),
          onPress: () {
            GetContext.to(TermineEditPage(
              id: widget.id,
            ));
          },
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
                      title: AppStrings.termin.tr(),
                      onPress: () {
                        _onTermineButtonPress();
                      },
                    ),
                  ),
                  kWidthBox15,
                  Expanded(
                    child: TabTitleWidget(
                      isActive: activePageIndex == 1,
                      title: AppStrings.history.tr(),
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
                  TerminPage(
                    id: widget.id,
                  ),
                  TerminHistory(
                    id: widget.id,
                  ),
                  // PieChartSample3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
