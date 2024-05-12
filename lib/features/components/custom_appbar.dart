import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;
  CustomAppBar({
    Key? key,
    this.title,
    this.onBackPress,
    this.actions
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppHeight.s60);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppHeight.s60),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        leadingWidth: 50.w,
        leading: IconButton(onPressed: onBackPress, icon: Icon(Icons.arrow_back_ios_new,color: AppColors.kWhiteColor)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                AppColors.kGradientColorEndOne,
                AppColors.kGradientColorStartOne,
              ],
            ),
          ),
        ),
        title: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: kH3Text.copyWith(
            fontWeight: semiBoldFont,
            color: AppColors.kWhiteColorOne,
          ),
        ),
        actions: actions??[],
      ),
    );
  }
}
