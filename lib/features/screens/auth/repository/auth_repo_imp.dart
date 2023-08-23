import 'package:dartz/dartz.dart';
import 'package:unsplash_gallery/data/network/api_failure.dart';

import '../models/login_response.dart';

abstract class AuthRepositoryImp {
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> forgotPassword(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> otpCheck(Map<String, dynamic> params);
  Future<Either<ApiFailure, dynamic>> resetPassword(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> logout();
}
