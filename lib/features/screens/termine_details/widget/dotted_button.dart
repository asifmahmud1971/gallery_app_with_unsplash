import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';

class DottedButton extends StatelessWidget {
  final VoidCallback? onTap;

  const DottedButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
      child: InkWell(
        onTap: onTap ?? () {},
        child: DottedBorder(
            radius: Radius.circular(5),
            borderType: BorderType.RRect,
            strokeWidth: 0.5,
            child: Container(
              height: 60.r,
              width: 60.r,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Icon(
                Icons.add,
                color: AppColors.dateColor,
              ),
            )),
      ),
    );
  }
}
