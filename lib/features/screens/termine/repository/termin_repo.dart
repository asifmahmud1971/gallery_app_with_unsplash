import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:terminator/data/network/api_client.dart';
import 'package:terminator/data/network/api_exception.dart';
import 'package:terminator/data/network/api_failure.dart';
import 'package:terminator/data/network/api_urls.dart';
import 'package:terminator/features/screens/termine/model/filter_model.dart';
import 'package:terminator/features/screens/termine/model/gallery_model.dart';
import 'package:terminator/features/screens/termine/model/termin_model.dart';

import 'termin_repo_imp.dart';

@Injectable(as: TerminRepositoryImp)
class TerminRepository implements TerminRepositoryImp {
  final ApiClient apiClient;

  TerminRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, List<GalleryModel>>> getTerminData(
      Map<String, dynamic> params) async {

    List<GalleryModel> allPhotos = [];
    try {
      final response = await await apiClient.request(
          url: ApiUrls.photos, method: Method.get, params: params);

      List galleryData = response as List;

      galleryData.forEach((element) {
        allPhotos.add(GalleryModel.fromJson(element));
      });

      return Right(allPhotos);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, FilterModel>> getFilterData() async {
    try {
      final response = await await apiClient.request(
          url: ApiUrls.terminFilter, method: Method.get);

      return Right(FilterModel.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
