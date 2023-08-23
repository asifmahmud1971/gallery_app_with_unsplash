import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';

showProgressDialog({bool isIndicator = false, value}) {
  if (!EasyLoading.isShow) {
    EasyLoading.show(
        dismissOnTap: false,
        indicator: isIndicator
            ? Container(
                child: Text(
                  "$value",
                  style: kRegularLine16.copyWith(color: Colors.white),
                ),
              )
            : null);
  }
}

dismissProgressDialog() {
  if (EasyLoading.isShow) {
    EasyLoading.dismiss();
  }
}
