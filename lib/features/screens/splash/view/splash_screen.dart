import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/app/app_dependency.dart';
import 'package:unsplash_gallery/core/app/app_preference.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_images.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/core/constants/app_strings.dart';
import 'package:unsplash_gallery/features/components/my_context.dart';
import 'package:unsplash_gallery/features/router/routes.dart';

import '../../gallery/view/gallery_screen.dart';

class SplashScreen extends StatefulWidget {
  final AppPreferences _appPreferences;

  SplashScreen({Key? key})
      : _appPreferences = instance.get(),
        super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _navigation);
  }

  void _navigation() async {
    if (await widget._appPreferences.isUserLoggedIn()) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.dashboard, (route) => false);
    } else {
      /*Navigator.pushNamedAndRemoveUntil(
          context, Routes.login, (route) => false);*/
      GetContext.to(GalleryScreen());
    }
  }

  @override
  initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120.h,
              width: 120.h,
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  AppImages.terAnim,
                ),
              ),
            ),
            Text(
              AppStrings.appName.tr(),
              style: kLogoText.copyWith(
                color: AppColors.kPurpleColorTwo,
              ),
            )
          ],
        ),
      ),
    );
  }
}
