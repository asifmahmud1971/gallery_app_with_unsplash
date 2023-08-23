import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/features/components/my_context.dart';

void showOverlay(BuildContext context, key) async {
  final overLay = Overlay.of(context);
  final renderBox = key.findRenderObject() as RenderBox;
  final size = renderBox.size;
  final offset = renderBox.localToGlobal(Offset.zero);

  OverlayEntry? entry = OverlayEntry(
      builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height - 10,
          width: size.width,
          child: buildOverLay()));
  overLay.insert(entry);

  await Future.delayed(const Duration(seconds: 2));
  entry.remove();
}

Widget buildOverLay() => Material(
      color: Colors.transparent,
      elevation: 8,
      child: Container(
        padding: REdgeInsets.only(top: 20, left: 15, right: 10, bottom: 10),
        width: 200.w,
        height: 100.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
      ),
    );
