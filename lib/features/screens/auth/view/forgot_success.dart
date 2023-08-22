import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_svg.dart';
import 'package:terminator/features/components/default_btn.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/router/routes.dart';
import 'package:terminator/features/screens/auth/cubit/auth_cubit.dart';

class ForgotSuccess extends StatelessWidget {
  const ForgotSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<AuthCubit>().resetControllers();
        GetContext.offAll(Routes.login);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: AppColors.kWhiteColor,
        body: Container(
          width: 1.sw,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSvg(
                icon: AppImages.iconsEmailSent,
                size: 120,
              ),
              kHeightBox50,
              Text(
                AppStrings.emailSent.tr(),
                style: kRegularLine26,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  AppStrings.forgotEmailSend.tr(),
                  style: kRegularLine15.copyWith(color: Colors.grey),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: DefaultBtn(
                  radius: 10,
                  textStyle: kRegularLine18.copyWith(
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.w600),
                  title: AppStrings.backToLogin.tr(),
                  outlineButton: true,
                  btnColor: Colors.transparent,
                  borderColor: AppColors.kPrimaryColor,
                  onPress: () {
                    context.read<AuthCubit>().resetControllers();
                    GetContext.offAll(Routes.login);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
