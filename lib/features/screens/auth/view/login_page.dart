import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/app/app_dependency.dart';
import 'package:unsplash_gallery/core/app/app_preference.dart';
import 'package:unsplash_gallery/features/components/custom_dialogs.dart';
import 'package:unsplash_gallery/features/components/custom_progress_loader.dart';
import 'package:unsplash_gallery/features/components/default_btn.dart';
import 'package:unsplash_gallery/features/components/my_context.dart';
import 'package:unsplash_gallery/features/router/routes.dart';
import 'package:unsplash_gallery/features/screens/auth/cubit/auth_cubit.dart';
import 'package:unsplash_gallery/features/screens/auth/widget/auth_background.dart';
import 'package:unsplash_gallery/features/screens/auth/widget/error_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../components/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AppPreferences _appPreferences = instance.get();
  final _formKey = GlobalKey<FormState>();
  bool isRemember = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.kPurpleColorFour,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == LoginStatus.loading) {
            showProgressDialog();
          } else if (state.status == LoginStatus.success) {
            dismissProgressDialog();
            GetContext.offAll(Routes.dashboard);
          } else if (state.status == LoginStatus.authFail ||
              state.status == LoginStatus.notFound) {
            CustomDialog.showUnAuthorisedDialog(
              title: AppStrings.loginAlert.tr(),
              details: AppStrings.loginAlertBody.tr(),
              context: context,
              onYes: () {
                Navigator.pop(context);
              },
            );

            dismissProgressDialog();
          } else {
            dismissProgressDialog();
          }
        },
        builder: (context, state) {
          return AuthBackground(
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
                        Text(
                          AppStrings.login.tr(),
                          style: kRegularLine26.copyWith(
                              color: AppColors.kWhiteColor,
                              fontWeight: FontWeight.w600),
                        ),
                        20.verticalSpace,
                        CustomTextField(
                          title: AppStrings.emailAddress.tr(),
                          titleColor: Colors.white,
                          hintColor: AppColors.kAshColorTwo,
                          controller: context.read<AuthCubit>().emailController,
                          hint: AppStrings.loginHint.tr(),
                          borderColor:
                              !state.emailError ? Colors.white : Colors.red,
                          fillColor: Colors.transparent,
                          keyboardType: TextInputType.emailAddress,
                          textColor: AppColors.kWhiteColor,
                          onChanged: (value) {
                            context
                                .read<AuthCubit>()
                                .loginFormValidation(clickFrom: "field");
                          },
                        ),
                        Visibility(
                          visible: state.emailError,
                          child: passwordConditionWidget(
                              text: !state.emailValid
                                  ? AppStrings.enterValidEmail.tr()
                                  : AppStrings.emptyEmail.tr()),
                        ),
                        10.verticalSpace,
                        CustomTextField(
                          isPassword: true,
                          textColor: AppColors.kWhiteColor,
                          title: AppStrings.password.tr(),
                          titleColor: Colors.white,
                          hintColor: AppColors.kAshColorTwo,
                          borderColor:
                              state.passwordError ? Colors.red : Colors.white,
                          controller:
                              context.read<AuthCubit>().passwordController,
                          hint: AppStrings.passwordHint.tr(),
                          fillColor: Colors.transparent,
                          suffixIconColor: Colors.orangeAccent,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            context
                                .read<AuthCubit>()
                                .loginFormValidation(clickFrom: "field");
                          },
                        ),
                        Visibility(
                          visible: state.passwordError,
                          child: passwordConditionWidget(
                              text: AppStrings.emptyPassword.tr()),
                        ),
                        kHeightBox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.forgot);
                              },
                              child: Text(
                                AppStrings.forgotPasswordTitle.tr(),
                                style: kRegularLine14.copyWith(
                                    color: AppColors.kBlueColorTwo,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        kHeightBox20,
                        SizedBox(
                            width: double.infinity,
                            child: DefaultBtn(
                              radius: 10,
                              btnColor: Colors.white,
                              title: AppStrings.login.tr(),
                              textColor: AppColors.kPurpleColorOne,
                              onPress: () {
                                context.read<AuthCubit>().loginFormValidation();
                                //context.read<AuthCubit>().login();
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
