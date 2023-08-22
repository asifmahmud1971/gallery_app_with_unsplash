import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:terminator/data/network/api_client.dart';
import 'package:terminator/data/network/api_exception.dart';
import 'package:terminator/data/network/api_failure.dart';
import 'package:terminator/data/network/api_urls.dart';
import 'package:terminator/features/screens/dashboard/model/performance_model.dart';

import 'dashboard_repo_imp.dart';

@Injectable(as: DashboardRepositoryImp)
class DashboardRepository implements DashboardRepositoryImp {
  final ApiClient apiClient;

  DashboardRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, PerformanceModel>> getDashboardData(
      Map<String, dynamic> params) async {
    try {
      final response = await await apiClient.request(
          url: ApiUrls.dashboard, method: Method.get, params: params);

      return Right(PerformanceModel.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
