import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:terminator/core/app/app_dependency.dart';
import 'package:terminator/core/app/app_preference.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_progress_loader.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/router/routes.dart';
import 'package:terminator/features/screens/auth/repository/auth_repo_imp.dart';

import '../../../../core/constants/strings.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AppPreferences _appPreferences;
  final AuthRepositoryImp _loginRepository;

  AuthCubit(this._loginRepository)
      : _appPreferences = instance.get(),
        super(AuthState());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();
  final TextEditingController resetConfirmPasswordController =
      TextEditingController();
  final TextEditingController forgotEmailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  RegExp regex = RegExp(r'^(?=.*[A-Z]).{8,}$');
  bool fromAuth = false;
  bool charCheck = false;

  bool isTooltipOpen = false;

  Future<void> login({bool isRemember = false}) async {
    String token = await _appPreferences.getUserAccessToken();
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final response = await _loginRepository.loginUser({
        "email": emailController.text.trim(),
        "password": passwordController.text,
      });

      response.fold(
        (failure) {
          dismissProgressDialog();
          if (failure.code == 422) {
            emit(state.copyWith(
                status: LoginStatus.authFail,
                message: failure.error['message']));
          } else if (failure.code == 401) {
            emit(state.copyWith(
                status: LoginStatus.notFound, message: failure.message));
          } else {
            emit(state.copyWith(status: LoginStatus.failure));
          }
        },
        (data) async {
          _appPreferences.saveUserData(data);
          _appPreferences.setUserAccessToken(data.token);
          emit(state.copyWith(status: LoginStatus.success));
          resetControllers();
        },
      );
    } on Exception catch (_) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  Future<void> forgot({email}) async {
    emit(state.copyWith(status: LoginStatus.loading));

    if (forgotEmailController.text.isNotEmpty &&
        emailValidatorRegExp.hasMatch(forgotEmailController.text.trim())) {
      final response = await _loginRepository.forgotPassword({
        "email": email ?? forgotEmailController.text.trim(),
      });

      response.fold(
        (failure) {
          if (failure.code == 422) {
            emit(state.copyWith(
                status: ForgotStatus.notExist,
                isExist: false,
                message: failure.error['message']));
          } else {
            emit(state.copyWith(status: ForgotStatus.failure));
          }
        },
        (data) async {
          emit(state.copyWith(
              status: ForgotStatus.success,
              message: AppStrings.otpSentSuccessfully.tr(),
              isExist: true,
              forgotEmail: forgotEmailController.text.trim()));
          resetControllers();
        },
      );
    } else {
      if (!emailValidatorRegExp.hasMatch(forgotEmailController.text.trim())) {
        emit(state.copyWith(
            status: ForgotStatus.initial, isEnable: false, emailValid: false));
      } else {
        emit(state.copyWith(status: ForgotStatus.initial, isEnable: false));
      }
    }
  }

  Future<void> resentOtp({email}) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final response = await _loginRepository.forgotPassword({
      "email": email,
    });

    response.fold(
      (failure) {
        if (failure.code == 422) {
          emit(state.copyWith(
              status: ForgotStatus.notExist,
              message: failure.error['message']));
        } else {
          emit(state.copyWith(status: ForgotStatus.failure));
        }
      },
      (data) async {
        emit(state.copyWith(
            status: ForgotStatus.otpResentSuccess,
            message: AppStrings.otpResentSuccessfully.tr(),
            forgotEmail: state.forgotEmail));
        resetControllers();
      },
    );
  }

  Future<void> otpCheck() async {
    emit(state.copyWith(status: OtpStatus.loading));

    final response = await _loginRepository.otpCheck({
      "email": state.forgotEmail,
      "token": otpController.text.trim(),
    });

    response.fold(
      (failure) {
        if (failure.code == 422) {
          emit(state.copyWith(
              status: OtpStatus.notExist, message: AppStrings.wrongOtp.tr()));
        } else {
          emit(state.copyWith(status: OtpStatus.failure));
        }
        resetControllers();
      },
      (data) async {
        emit(state.copyWith(
            status: OtpStatus.success,
            message: AppStrings.otpSentSuccessfully.tr(),
            forgotToken: otpController.text.trim(),
            forgotEmail: state.forgotEmail));
        resetControllers();
      },
    );
  }

  Future<void> resetPassword() async {
    emit(state.copyWith(status: OtpStatus.loading));

    if (resetPasswordController.text.isNotEmpty &&
        resetConfirmPasswordController.text.isNotEmpty) {
      final response = await _loginRepository.resetPassword({
        "email": state.forgotEmail,
        "token": state.forgotToken,
        "password": resetPasswordController.text.trim(),
        "password_confirmation": resetConfirmPasswordController.text.trim(),
      });
      response.fold(
        (failure) {
          if (failure.code == 422) {
            emit(state.copyWith(status: ResetPassword.notExist));
          } else {
            emit(state.copyWith(status: ResetPassword.failure));
          }
        },
        (data) async {
          emit(state.copyWith(
              status: ResetPassword.success,
              message: AppStrings.passwordResetSuccessfully.tr(),
              forgotEmail: forgotEmailController.text.trim()));
          resetControllers();
        },
      );
    } else {
      emit(state.copyWith(
          status: ResetPassword.empty,
          message: "",
          forgotEmail: forgotEmailController.text.trim()));
      resetControllers();
    }
  }

  Future<void> logout() async {
    showProgressDialog();
    emit(state.copyWith(status: LogoutStatus.loading));
    final response = await _loginRepository.logout();

    response.fold(
      (failure) {
        dismissProgressDialog();
        emit(state.copyWith(status: LogoutStatus.failure));
      },
      (data) async {
        dismissProgressDialog();

        fromAuth = true;
        _appPreferences.logout();
        GetContext.offAll(Routes.login);
        emit(state.copyWith(status: LogoutStatus.success));
      },
    );
  }

  void emailCheck(email) {
    if (emailValidatorRegExp.hasMatch(email)) {
      emit(state.copyWith(
          status: ForgotStatus.initial, isEnable: true, emailValid: true));
    } else {
      emit(state.copyWith(
          status: ForgotStatus.initial, isEnable: false, emailValid: false));
    }
  }

  void loginFormValidation({clickFrom}) {
    emailCheck(emailController.text);

    if (clickFrom == "field") {
      if (!state.emailValid && emailController.text.isNotEmpty) {
        emit(state.copyWith(
            status: ForgotStatus.initial, isEnable: false, emailError: true));
      } else if (emailController.text.isEmpty) {
        emit(state.copyWith(
            status: ForgotStatus.initial, isEnable: false, emailError: false));
      } else if (emailController.text.isNotEmpty && state.emailValid) {
        emit(state.copyWith(
            status: ForgotStatus.initial,
            isEnable: true,
            passwordError: false,
            emailError: false));
      }
      if (passwordController.text.isNotEmpty) {
        emit(state.copyWith(
            status: ForgotStatus.initial,
            isEnable: false,
            passwordError: false));
      }
    } else {
      if (passwordController.text.isNotEmpty &&
          state.emailValid &&
          emailController.text.isNotEmpty) {
        login();
        emit(state.copyWith(
            status: ForgotStatus.initial,
            isEnable: true,
            passwordError: false,
            emailError: false));
      } else if (passwordController.text.isEmpty ||
          emailController.text.isEmpty) {
        emit(state.copyWith(
            status: ForgotStatus.initial,
            isEnable: false,
            passwordError: passwordController.text.isEmpty,
            emailValid: true,
            emailError: emailController.text.isEmpty));
      } else {
        emit(state.copyWith(
          status: ForgotStatus.initial,
          isEnable: false,
        ));
      }
    }
  }

  void otpValidCheck() {
    if (otpController.text.length >= 6 && otpController.text.isNotEmpty) {
      emit(state.copyWith(
        status: ForgotStatus.initial,
        isEnable: true,
      ));
    } else {
      emit(state.copyWith(status: ForgotStatus.initial, isEnable: false));
    }
  }

  void passwordValidityCheck() {
    if (resetPasswordController.text.isNotEmpty &&
        resetPasswordController.text.length >= 8 &&
        regex.hasMatch(resetPasswordController.text)) {
      if (resetConfirmPasswordController.text.isNotEmpty) {
        passwordMatchCheck();
      }

      emit(state.copyWith(
          status: ResetPassStatus.initial,
          passwordValid: true,
          errorShow: false,
          capChar: capitalLetterRegex.hasMatch(resetPasswordController.text),
          lenCheck: resetPasswordController.text.length >= 8 ? true : false));
    } else if (resetPasswordController.text.isEmpty) {
      emit(state.copyWith(
          status: ResetPassStatus.initial,
          passwordValid: false,
          errorShow: false,
          capChar: capitalLetterRegex.hasMatch(resetPasswordController.text),
          lenCheck: resetPasswordController.text.length >= 8 ? true : false));
    } else {
      emit(state.copyWith(
          status: ResetPassStatus.initial,
          passwordValid: false,
          errorShow: true,
          capChar: capitalLetterRegex.hasMatch(resetPasswordController.text),
          lenCheck: resetPasswordController.text.length >= 8 ? true : false));
    }
  }

  void passwordMatchCheck() {
    if (resetPasswordController.text == resetConfirmPasswordController.text) {
      emit(state.copyWith(
          status: ResetPassStatus.initial,
          passwordMatch: true,
          conPassEmpty: resetConfirmPasswordController.text.isEmpty));
    } else if (resetConfirmPasswordController.text.isEmpty &&
        resetPasswordController.text.isEmpty) {
      emit(state.copyWith(
          status: ResetPassStatus.initial,
          passwordMatch: true,
          conPassEmpty: resetConfirmPasswordController.text.isEmpty));
    } else {
      emit(state.copyWith(
          status: ResetPassStatus.initial,
          passwordMatch: false,
          conPassEmpty: resetConfirmPasswordController.text.isEmpty));
    }
  }

  Future<void> resetControllers() async {
    emailController.clear();
    passwordController.clear();
    forgotEmailController.clear();
    otpController.clear();
    resetConfirmPasswordController.clear();
    resetPasswordController.clear();
    emit(state.copyWith(status: LoginStatus.initial, isEnable: false));
  }
}
