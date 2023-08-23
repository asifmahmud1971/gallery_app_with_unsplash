import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';

passwordConditionWidget({text}) {
  return Container(
    padding: REdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.red, width: 1)),
    child: Text.rich(
      TextSpan(
        style: kRegularLine13.copyWith(),
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(
              Icons.cancel_outlined,
              size: 16.r,
              color: Colors.red,
            ),
          ),
          TextSpan(
              text: '  $text',
              style: kRegularLine13.copyWith(
                  color: Colors.red, fontWeight: FontWeight.w400))
        ],
      ),
      textAlign: TextAlign.center,
    ),
  );
}

passwordInstructionWidget({bool length = false, bool char = false}) {
  return Container(
    padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.red, width: 1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Das Passwort erfüllt folgende Bedingungen nicht:",
            style: kRegularLine13.copyWith(color: Colors.red)),
        5.verticalSpace,
        Visibility(
          visible: length ? false : true,
          child: Text.rich(
            TextSpan(
              style: kRegularLine13.copyWith(),
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.info,
                    size: 10.r,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                    text: '  Mindestens 8 Zeichen',
                    style: kRegularLine13.copyWith(color: Colors.red))
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        2.verticalSpace,
        Visibility(
          visible: char ? false : true,
          child: Text.rich(
            TextSpan(
              style: kRegularLine13.copyWith(),
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.info,
                    size: 10.r,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                    text: '  Mindestens 1 Grossbuchstabe',
                    style: kRegularLine13.copyWith(color: Colors.red))
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
