part of 'auth_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  authFail,
  notFound,
  success,
  failure,
}

enum ResetPassStatus {
  initial,
  loading,
  authFail,
  notFound,
  success,
  failure,
}

enum ForgotStatus {
  initial,
  loading,
  success,
  otpResentSuccess,
  failure,
  notExist,
}

enum OtpStatus {
  loading,
  success,
  failure,
  notExist,
}

enum ResetPassword {
  loading,
  success,
  failure,
  notExist,
  empty,
}

enum LogoutStatus {
  loading,
  success,
  failure,
}

class AuthState extends Equatable {
  final dynamic status;
  final bool isEnable;
  final bool passwordValid;
  final bool passwordMatch;
  final bool errorShow;
  final bool emailError;
  final bool conPassEmpty;
  final bool passwordError;
  final bool isExist;
  final bool emailValid;
  final bool capChar;
  final bool lenCheck;
  final String? message;
  final String? forgotEmail;
  final String? forgotToken;

  const AuthState({
    this.status = LoginStatus.initial,
    this.isEnable = false,
    this.passwordValid = false,
    this.passwordMatch = true,
    this.emailValid = true,
    this.conPassEmpty = true,
    this.emailError = false,
    this.isExist = true,
    this.capChar = false,
    this.errorShow = false,
    this.lenCheck = false,
    this.passwordError = false,
    this.message,
    this.forgotEmail,
    this.forgotToken,
  });

  AuthState copyWith({
    final dynamic status,
    final bool? isEnable,
    final bool? passwordValid,
    final bool? passwordMatch,
    final bool? emailValid,
    final bool? emailError,
    final bool? errorShow,
    final bool? conPassEmpty,
    final bool? capChar,
    final bool? lenCheck,
    final bool? isExist,
    final bool? passwordError,
    final String? message,
    final String? forgotEmail,
    final String? forgotToken,
  }) {
    return AuthState(
      status: status ?? this.status,
      isEnable: isEnable ?? this.isEnable,
      passwordValid: passwordValid ?? this.passwordValid,
      passwordMatch: passwordMatch ?? this.passwordMatch,
      emailValid: emailValid ?? this.emailValid,
      emailError: emailError ?? this.emailError,
      capChar: capChar ?? this.capChar,
      errorShow: errorShow ?? this.errorShow,
      isExist: isExist ?? this.isExist,
      conPassEmpty: conPassEmpty ?? this.conPassEmpty,
      lenCheck: lenCheck ?? this.lenCheck,
      passwordError: passwordError ?? this.passwordError,
      message: message ?? this.message,
      forgotEmail: forgotEmail ?? this.forgotEmail,
      forgotToken: forgotToken ?? this.forgotToken,
    );
  }

  @override
  List<Object> get props => [
        status,
        isEnable,
        passwordValid,
        passwordMatch,
        emailValid,
        emailError,
        errorShow,
        conPassEmpty,
        passwordError,
        isExist,
        capChar,
        lenCheck,
        message ?? "",
        forgotEmail ?? "",
        forgotToken ?? ""
      ];
}
