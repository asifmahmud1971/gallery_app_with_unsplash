import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/features/components/custom_progress_loader.dart';
import 'package:terminator/features/components/custom_snackbar.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/router/routes.dart';
import 'package:terminator/features/screens/auth/cubit/auth_cubit.dart';
import 'package:terminator/features/screens/auth/view/forgot_otp_page.dart';
import 'package:terminator/features/screens/auth/widget/error_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/strings.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/default_btn.dart';
import '../widget/auth_background.dart';

class ForgotPage extends StatefulWidget {
  ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
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
            if (state.status == ForgotStatus.loading) {
              showProgressDialog();
            } else if (state.status == ForgotStatus.success) {
              dismissProgressDialog();
              GetContext.to(ForgotOtpPage(
                email: state.forgotEmail,
              ));
              showTopSnackbar(context: context, message: state.message);
            } else if (state.status == ForgotStatus.notExist) {
              dismissProgressDialog();
              /*CustomDialog.showUnAuthorisedDialog(
                title: AppStrings.loginAlert.tr(),
                details: AppStrings.userNotFound.tr(),
                context: context,
                onYes: () {
                  Navigator.pop(context);
                },
              );*/
            }
          },
          builder: (context, state) {
            return AuthBackground(
              child: Padding(
                padding: REdgeInsets.only(top: 80, left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.forgotPasswordTitle.tr(),
                        style:
                            kH1Text.copyWith(color: AppColors.kWhiteColorOne),
                      ),
                      10.verticalSpace,
                      Text(
                        AppStrings.forgotPasswordDesc.tr(),
                        style: kRegularLine16.copyWith(
                            color: AppColors.kWhiteColorOne,
                            fontWeight: FontWeight.w400),
                      ),
                      40.verticalSpace,
                      CustomTextField(
                        title: AppStrings.emailAddress.tr(),
                        titleColor: Colors.white,
                        hintColor: AppColors.kAshColorTwo,
                        onChanged: (value) {
                          context
                              .read<AuthCubit>()
                              .emailCheck(value.toString());
                        },
                        controller:
                            context.read<AuthCubit>().forgotEmailController,
                        hint: AppStrings.loginHint.tr(),
                        borderColor:
                            state.emailValid ? Colors.white : Colors.red,
                        fillColor: Colors.transparent,
                        keyboardType: TextInputType.emailAddress,
                        textColor: AppColors.kWhiteColor,
                      ),
                      Visibility(
                        visible: state.status == ForgotStatus.notExist,
                        child: passwordConditionWidget(
                            text: AppStrings.userNotRegistered.tr()),
                      ),
                      50.verticalSpace,
                      SizedBox(
                          width: double.infinity,
                          child: DefaultBtn(
                              radius: 10,
                              btnColor: state.isEnable
                                  ? Colors.white
                                  : Colors.black12,
                              title: AppStrings.sendEmail.tr(),
                              textColor: AppColors.kPurpleColorOne,
                              onPress: state.isEnable
                                  ? () async {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      if (context
                                          .read<AuthCubit>()
                                          .forgotEmailController
                                          .text
                                          .isEmpty) {
                                        showCustomSnackBar(
                                            context: context,
                                            message: AppStrings.enterEmail.tr(),
                                            isError: false);
                                      } else if (!emailValidatorRegExp.hasMatch(
                                          context
                                              .read<AuthCubit>()
                                              .forgotEmailController
                                              .text
                                              .trim())) {
                                        showCustomSnackBar(
                                            context: context,
                                            message:
                                                AppStrings.invalidEmail.tr(),
                                            isError: false);
                                      } else {
                                        context.read<AuthCubit>().forgot();
                                        //GetContext.to(ForgotOtpPage());
                                      }
                                    }
                                  : null)),
                      10.verticalSpace,
                      SizedBox(
                          width: double.infinity,
                          child: DefaultBtn(
                              radius: 10,
                              btnColor: Colors.white,
                              title: AppStrings.backToLogin.tr(),
                              textColor: AppColors.kPurpleColorOne,
                              onPress: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                context.read<AuthCubit>().resetControllers();
                                GetContext.offAll(Routes.login);
                              })),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
