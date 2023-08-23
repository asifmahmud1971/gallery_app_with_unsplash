import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_images.dart';
import 'package:unsplash_gallery/features/components/custom_svg.dart';

void showCustomSnackBar({
  required BuildContext context,
  String? message,
  bool isError = true,
  bool isCenterText = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message ?? '',
        textAlign: isCenterText ? TextAlign.center : TextAlign.left,
      ),
      margin: const EdgeInsets.all(10),
      backgroundColor: isError ? AppColors.kErrorColor : Colors.black,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}

void showIconSnackbar({
  required BuildContext context,
  String? message,
  bool isError = true,
  bool isCenterText = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: EdgeInsets.zero,
      clipBehavior: Clip.none,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20),
      content: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: isError ? AppColors.kErrorColor : Colors.black,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: CustomSvg(
                    icon: AppImages.iconsLogo,
                    size: 15.r,
                  )),
              SizedBox(width: 10),
              Text(message ?? ""),
            ],
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

void showTopSnackbar({
  required BuildContext context,
  String? message,
  bool isError = true,
  bool isCenterText = false,
}) {
  Flushbar(
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    backgroundColor: AppColors.kPurpleColorFour,
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    message: message ?? "Vielen Dank. Die E-Mail wurde erfolgreich gesendet.",
    duration: Duration(seconds: 3),
  )..show(context);
}
