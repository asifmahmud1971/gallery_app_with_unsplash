import 'package:flutter/material.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';

class TabTitleWidget extends StatelessWidget {
  final String? title;
  final bool isActive;
  final VoidCallback? onPress;

  const TabTitleWidget({
    Key? key,
    this.title,
    this.isActive = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = isActive
        ? [
            Color(0xFF3F8AA7),
            Color(0xFF75B5CE),
            Color(0xFF67A7C0),
            Color(0xFF5A9EB8)
          ]
        : [
            Colors.transparent,
            Colors.transparent
          ]; // Add your custom inactive colors here

    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppCommonSize.s10),
          topRight: Radius.circular(AppCommonSize.s10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors,
        ),
        border: isActive
            ? null
            : Border.all(
                width: 1,
                color: AppColors.kGrayColorThree,
              ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPress,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppCommonSize.s10),
            child: Center(
              child: Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: kP1Text.copyWith(
                  fontWeight: semiBoldFont,
                  color: !isActive
                      ? AppColors.kPurpleColorOne
                      : AppColors.kWhiteColorOne,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
