import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/my_context.dart';

class MyTooltip {
  late TextEditingController controller;
  static GlobalKey<NavigatorState> key = GlobalKey();

  static OverlayEntry entry = OverlayEntry(builder: (context) => SizedBox());

  static void showOverlay(bool isOpen) async {
    final overLay = Overlay.of(GetContext.context);
    final renderBox = key.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
        builder: (context) => Positioned(
            left: offset.dx,
            top: offset.dy + size.height - 12,
            width: size.width,
            child: buildOverLay()));

    overLay.insert(entry);
  }

  static Widget buildOverLay() => Material(
        color: Colors.transparent,
        elevation: 8,
        child: Stack(
          children: [
            Container(
              padding:
                  REdgeInsets.only(top: 20, left: 15, right: 10, bottom: 10),
              width: 200.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoCard("Nicht zuvor verwendetes Passwort"),
                  infoCard("Mindestens 8 Zeichen"),
                  infoCard("Mindestens 1 Grossbuchstabe"),
                  infoCard("Mindestens 1 Kleinbuchstabe"),
                  infoCard("Mindestens 1 Sonderzeichen"),
                  infoCard("Mindestens 1 Zahl"),
                ],
              ),
            ),
            Positioned(
                top: 3,
                left: 3,
                child: Icon(
                  Icons.info_outline,
                  size: 13.r,
                  color: AppColors.kPurpleColorTwo,
                ))
          ],
        ),
      );

  static infoCard(text) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.info,
              size: 12.r,
              color: AppColors.kPurpleColorTwo,
            ),
            5.horizontalSpace,
            Expanded(
              child: Text(
                text,
                style: kRegularLine12.copyWith(
                    fontWeight: FontWeight.w400, color: Colors.grey),
              ),
            )
          ],
        ),
        5.verticalSpace
      ],
    );
  }
}
