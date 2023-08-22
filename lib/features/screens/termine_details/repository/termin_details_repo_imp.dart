import 'package:dartz/dartz.dart';
import 'package:terminator/data/network/api_failure.dart';
import 'package:terminator/features/screens/termine_details/model/history_model.dart';
import 'package:terminator/features/screens/termine_details/model/termin_details_model.dart';

abstract class TerminDetailsImp {
  Future<Either<ApiFailure, TerminDetailsModel>> getTerminDetailsData(
      Map<String, dynamic> params, id);

  Future<Either<ApiFailure, List<HistoryModel>>> getTerminHistory(
      Map<String, dynamic> params, id);

  Future<Either<ApiFailure, dynamic>> editDetails(
      Map<String, dynamic> params, id);
}
