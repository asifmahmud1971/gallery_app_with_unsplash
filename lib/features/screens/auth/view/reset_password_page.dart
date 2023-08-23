import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/app/app_dependency.dart';
import 'package:unsplash_gallery/core/app/app_preference.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/core/constants/app_strings.dart';
import 'package:unsplash_gallery/features/components/custom_dialogs.dart';
import 'package:unsplash_gallery/features/components/custom_progress_loader.dart';
import 'package:unsplash_gallery/features/components/custom_snackbar.dart';
import 'package:unsplash_gallery/features/components/custom_text_field.dart';
import 'package:unsplash_gallery/features/components/default_btn.dart';
import 'package:unsplash_gallery/features/components/my_context.dart';
import 'package:unsplash_gallery/features/components/my_tooltip.dart';
import 'package:unsplash_gallery/features/router/routes.dart';
import 'package:unsplash_gallery/features/screens/auth/cubit/auth_cubit.dart';
import 'package:unsplash_gallery/features/screens/auth/widget/auth_background.dart';
import 'package:unsplash_gallery/features/screens/auth/widget/error_widget.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final AppPreferences _appPreferences = instance.get();
  final _formKey = GlobalKey<FormState>();
  bool isRemember = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<AuthCubit>().resetControllers();
        GetContext.offAll(Routes.login);
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.kPurpleColorFour,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status == ResetPassword.loading) {
              showProgressDialog();
            } else if (state.status == ResetPassword.success) {
              dismissProgressDialog();
              GetContext.offAll(Routes.login);
              showTopSnackbar(context: context, message: state.message);
            } else if (state.status == ResetPassword.empty) {
              dismissProgressDialog();
              CustomDialog.showUnAuthorisedDialog(
                title: AppStrings.loginAlert.tr(),
                details: AppStrings.loginAlertBody.tr(),
                context: context,
                onYes: () {
                  Navigator.pop(context);
                },
              );
            } else if (state.status == ResetPassword.failure) {
              dismissProgressDialog();
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                if (context.read<AuthCubit>().isTooltipOpen)
                  MyTooltip.entry.remove();
                context.read<AuthCubit>().isTooltipOpen = false;
              },
              child: AuthBackground(
                child: Padding(
                  padding: REdgeInsets.only(top: 80.h),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: REdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kHeightBox50,
                            Text(
                              AppStrings.resetPassword.tr(),
                              style: kRegularLine26.copyWith(
                                  color: AppColors.kWhiteColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            kHeightBox10,
                            CustomTextField(
                              onChanged: (value) {
                                context
                                    .read<AuthCubit>()
                                    .passwordValidityCheck();
                                log("message===========> ${state.errorShow}");
                              },
                              tooltip: true,
                              isPassword: true,
                              textColor: AppColors.kWhiteColor,
                              title: AppStrings.password.tr(),
                              titleColor: Colors.white,
                              hintColor: AppColors.kAshColorTwo,
                              borderColor:
                                  !state.errorShow ? Colors.white : Colors.red,
                              controller: context
                                  .read<AuthCubit>()
                                  .resetPasswordController,
                              hint: AppStrings.enterPassword.tr(),
                              fillColor: Colors.transparent,
                              suffixIconColor: Colors.orangeAccent,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            Visibility(
                              visible: state.errorShow,
                              child: passwordConditionWidget(
                                  text: AppStrings.passwordConditionError.tr()),
                            ),
                            20.verticalSpace,
                            CustomTextField(
                              onChanged: (value) {
                                context.read<AuthCubit>().passwordMatchCheck();
                              },
                              isPassword: true,
                              textColor: AppColors.kWhiteColor,
                              title: AppStrings.confirmPassword.tr(),
                              titleColor: Colors.white,
                              hintColor: AppColors.kAshColorTwo,
                              borderColor:
                                  state.passwordMatch || state.conPassEmpty
                                      ? Colors.white
                                      : Colors.red,
                              controller: context
                                  .read<AuthCubit>()
                                  .resetConfirmPasswordController,
                              hint: AppStrings.resetReEnterPassword.tr(),
                              fillColor: Colors.transparent,
                              suffixIconColor: Colors.orangeAccent,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            Visibility(
                              visible: state.passwordMatch || state.conPassEmpty
                                  ? false
                                  : true,
                              child: passwordConditionWidget(
                                  text: AppStrings.passwordNotMatch.tr()),
                            ),
                            20.verticalSpace,
                            SizedBox(
                                width: double.infinity,
                                child: DefaultBtn(
                                  onPress: (state.passwordValid &&
                                          state.passwordMatch)
                                      ? () {
                                          context
                                              .read<AuthCubit>()
                                              .resetPassword();
                                        }
                                      : null,
                                  radius: 10,
                                  btnColor: (state.passwordValid &&
                                              state.passwordMatch) &&
                                          (context
                                                  .read<AuthCubit>()
                                                  .resetPasswordController
                                                  .text
                                                  .isNotEmpty &&
                                              context
                                                  .read<AuthCubit>()
                                                  .resetConfirmPasswordController
                                                  .text
                                                  .isNotEmpty)
                                      ? Colors.white
                                      : Colors.black12,
                                  title: AppStrings.resetPassword.tr(),
                                  textColor: AppColors.kPurpleColorOne,
                                )),
                            20.verticalSpace,
                            Visibility(
                                visible: state.errorShow,
                                child: passwordInstructionWidget(
                                    char: state.capChar,
                                    length: state.lenCheck)),
                          ],
                        ),
                      ),
                    ),
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
