import 'package:dartz/dartz.dart';
import 'package:terminator/data/network/api_failure.dart';
import 'package:terminator/features/screens/termine/model/filter_model.dart';
import 'package:terminator/features/screens/termine/model/gallery_model.dart';
import 'package:terminator/features/screens/termine/model/termin_model.dart';

abstract class TerminRepositoryImp {
  Future<Either<ApiFailure, List<GalleryModel>>> getTerminData(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, FilterModel>> getFilterData();
}
