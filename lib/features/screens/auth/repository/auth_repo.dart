import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:terminator/data/network/api_client.dart';
import 'package:terminator/data/network/api_exception.dart';
import 'package:terminator/data/network/api_failure.dart';
import 'package:terminator/data/network/api_urls.dart';
import 'package:terminator/features/screens/auth/models/login_response.dart';

import 'auth_repo_imp.dart';

@Injectable(as: AuthRepositoryImp)
class AuthRepository implements AuthRepositoryImp {
  final ApiClient apiClient;

  AuthRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: ApiUrls.login, method: Method.post, params: params);

      log("All Headers ====> " + response.toString());

      return Right(LoginResponse.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> forgotPassword(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: ApiUrls.forgot, method: Method.post, params: params);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> otpCheck(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: ApiUrls.otpCheck, method: Method.post, params: params);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> resetPassword(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: ApiUrls.resetPassword, method: Method.put, params: params);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> logout() async {
    try {
      final response = await await apiClient.request(
          url: ApiUrls.logout, method: Method.post);

      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
