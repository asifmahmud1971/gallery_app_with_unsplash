import 'package:dartz/dartz.dart';
import 'package:terminator/data/network/api_failure.dart';
import 'package:terminator/features/screens/dashboard/model/performance_model.dart';

abstract class DashboardRepositoryImp {
  Future<Either<ApiFailure, PerformanceModel>> getDashboardData(
      Map<String, dynamic> params);
}
