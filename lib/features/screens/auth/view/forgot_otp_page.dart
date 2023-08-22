import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_progress_loader.dart';
import 'package:terminator/features/components/custom_snackbar.dart';
import 'package:terminator/features/components/default_btn.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/screens/auth/cubit/auth_cubit.dart';
import 'package:terminator/features/screens/auth/view/reset_password_page.dart';
import 'package:terminator/features/screens/auth/widget/auth_background.dart';
import 'package:terminator/features/screens/auth/widget/resend_widget.dart';

class ForgotOtpPage extends StatefulWidget {
  final String? email;

  const ForgotOtpPage({super.key, this.email});

  @override
  State<ForgotOtpPage> createState() => _ForgotOtpPageState();
}

class _ForgotOtpPageState extends State<ForgotOtpPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<AuthCubit>().resetControllers();
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.kPurpleColorFour,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status == OtpStatus.loading) {
              showProgressDialog();
            } else if (state.status == OtpStatus.success) {
              dismissProgressDialog();
              GetContext.to(ResetPasswordPage());
              //Navigator.pushReplacementNamed(context, Routes.forgotSuccess);
            } else if (state.status == OtpStatus.failure) {
              dismissProgressDialog();
            }
          },
          builder: (context, state) {
            return AuthBackground(
              child: otpWidget(context),
            );
          },
        ),
      ),
    );
  }

  otpWidget(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == OtpStatus.loading) {
          showProgressDialog();
        } else if (state.status == OtpStatus.notExist) {
          dismissProgressDialog();
          showTopSnackbar(context: context, message: state.message);
        } else if (state.status == OtpStatus.success) {
          dismissProgressDialog();
        } else if (state.status == ForgotStatus.otpResentSuccess) {
          dismissProgressDialog();
          showTopSnackbar(context: context, message: state.message);
        } else {
          dismissProgressDialog();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                150.verticalSpace,
                Text(
                  AppStrings.verifyOtp.tr(),
                  style: kH1Text.copyWith(color: AppColors.kWhiteColorOne),
                ),
                10.verticalSpace,
                Text(
                  "${AppStrings.verifyOtpDesc1} ${widget.email} ${AppStrings.verifyOtpDesc2}",
                  style: kRegularLine16.copyWith(
                      color: AppColors.kWhiteColorOne,
                      fontWeight: FontWeight.w400),
                ),
                40.verticalSpace,
                PinFieldAutoFill(
                  controller: context.read<AuthCubit>().otpController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: BoxLooseDecoration(
                    textStyle: kRegularLine18.copyWith(
                      color: AppColors.kPurpleColorFour,
                      fontWeight: boldFont,
                    ),
                    radius: const Radius.circular(8),
                    bgColorBuilder: FixedColorBuilder(AppColors.kWhiteColor),
                    strokeColorBuilder: FixedColorBuilder(
                      Colors.transparent,
                    ),
                  ),
                  codeLength: 6,
                  currentCode: context.read<AuthCubit>().otpController.text,
                  onCodeChanged: (code) {
                    context.read<AuthCubit>().otpValidCheck();
                    if (code!.length == 6) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  },
                ),
                kHeightBox20,
                Row(
                  children: [
                    Text(AppStrings.codeNotReceived.tr(),
                        style: kRegularLine13.copyWith(
                            color: AppColors.kWhiteColorTwo)),
                    ResendWidget(
                      email: widget.email.toString(),
                    ),
                  ],
                ),
                50.verticalSpace,
                SizedBox(
                    width: double.infinity,
                    child: DefaultBtn(
                        radius: 10,
                        btnColor:
                            state.isEnable ? Colors.white : Colors.black12,
                        title: AppStrings.verifyOtp.tr(),
                        textColor: AppColors.kPurpleColorOne,
                        onPress: state.isEnable
                            ? () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                context.read<AuthCubit>().otpCheck();
                              }
                            : null)),
              ],
            ),
          ),
        );
      },
    );
  }
}
