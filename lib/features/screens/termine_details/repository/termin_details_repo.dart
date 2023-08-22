import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:terminator/data/network/api_client.dart';
import 'package:terminator/data/network/api_exception.dart';
import 'package:terminator/data/network/api_failure.dart';
import 'package:terminator/data/network/api_urls.dart';
import 'package:terminator/features/screens/termine_details/model/history_model.dart';
import 'package:terminator/features/screens/termine_details/model/termin_details_model.dart';

import 'termin_details_repo_imp.dart';

@Injectable(as: TerminDetailsImp)
class TerminDetailsRepository implements TerminDetailsImp {
  final ApiClient apiClient;

  TerminDetailsRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, TerminDetailsModel>> getTerminDetailsData(
      Map<String, dynamic> params, id) async {
    try {
      final response = await await apiClient.request(
          url: "${ApiUrls.termin}/$id)", method: Method.get, params: params);

      return Right(TerminDetailsModel.fromJson(response));
    } catch (error, stackTrace) {
      log('$error');
      log('$stackTrace');
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, List<HistoryModel>>> getTerminHistory(
      Map<String, dynamic> params, id) async {
    List<HistoryModel> allHistory = [];
    try {
      final response = await await apiClient.request(
          url: "${ApiUrls.terminHistory(id)}",
          method: Method.get,
          params: params);
      List historyData = response as List;

      historyData.forEach((element) {
        allHistory.add(HistoryModel.fromJson(element));
      });
      return Right(allHistory);
    } catch (error, stackTrace) {
      log('$error');
      log('$stackTrace');
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> editDetails(
      Map<String, dynamic> params, id) async {
    try {
      final response = await await apiClient.request(
          isMultipart: true,
          formData: FormData.fromMap(params),
          url: "${ApiUrls.editDetails(id)}",
          method: Method.post);

      return Right(response);
    } catch (error, stackTrace) {
      log('$error');
      log('$stackTrace');
      return Left(ApiException.handle(error).failure);
    }
  }
}
