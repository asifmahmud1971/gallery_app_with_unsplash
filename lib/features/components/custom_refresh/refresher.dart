import 'package:flutter/material.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/src/indicator/custom_indicator.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/src/indicator/material_indicator.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/src/smart_refresher.dart';

import '../../../core/constants/app_colors.dart';

Widget customRefresher(
    {required RefreshController controller,
    required VoidCallback? onRefresh,
    VoidCallback? onLoading,
    List<Widget>? children,
    Widget? child,
    bool enablePullUp = false,
    ScrollController? scrollController}) {
  return SmartRefresher(
    scrollController: scrollController,
    onRefresh: onRefresh,
    onLoading: onLoading,
    header: const WaterDropMaterialHeader(
      backgroundColor: AppColors.kPurpleColorFour,
      color: Colors.white,
    ),
    footer: CustomFooter(
      builder: (BuildContext? context, LoadStatus? mode) {
        Widget? body;
        if (mode == LoadStatus.idle) {
          body = const SizedBox();
        } else if (mode == LoadStatus.loading) {
          body = Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
              SizedBox(
                width: 10,
              ),
              Text("")
            ],
          );
        } else if (mode == LoadStatus.failed) {
          body = const SizedBox();
        } else if (mode == LoadStatus.canLoading) {
          body = const SizedBox();
        } else {
          body = const SizedBox();
        }
        return SizedBox(
          height: 55.0,
          child: Center(child: body),
        );
      },
    ),
    enablePullDown: onRefresh == null ? false : true,
    primary: false,
    enablePullUp: onLoading != null ? true : false,
    controller: controller,
    child: child ??
        ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: children ?? [],
        ),
  );
}
