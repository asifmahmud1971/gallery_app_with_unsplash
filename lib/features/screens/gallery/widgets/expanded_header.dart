import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';

class ExpandedHeader extends StatelessWidget {
  final bool isExpanded;
  final String? title;
  final Color? headerColor;
  final Color? titleColor;
  final bool? isDetails;
  final double? headerHeight;

  const ExpandedHeader({
    Key? key,
    required this.isExpanded,
    this.title,
    this.headerColor,
    this.titleColor,
    this.isDetails = false,
    this.headerHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: isExpanded
              ? Radius.circular(0)
              : Radius.circular(AppCommonSize.s6),
          bottomLeft: isExpanded
              ? Radius.circular(0)
              : Radius.circular(AppCommonSize.s6),
        ),
        color: headerColor ?? Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: AppColors.kGrayColorThree, width: isExpanded ? 1 : 0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppWeight.s14,
              vertical: headerHeight ?? AppHeight.s8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isExpanded ? title ?? '' : (title ?? ''),
                style: isDetails!
                    ? kRegularLine16.copyWith(
                        color: AppColors.kPurpleColorFour,
                        fontWeight: FontWeight.w600)
                    : kP3Text.copyWith(
                        color: AppColors.kAshColorThree,
                        fontWeight: regularFont),
              ),
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: AppColors.kAshColorThree,
                size: AppCommonSize.s22,
              )
            ],
          ),
        ),
      ),
    );
  }
}
