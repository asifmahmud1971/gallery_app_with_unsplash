import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unsplash_gallery/data/network/api_client.dart';
import 'package:unsplash_gallery/data/network/api_exception.dart';
import 'package:unsplash_gallery/data/network/api_failure.dart';
import 'package:unsplash_gallery/data/network/api_urls.dart';
import 'package:unsplash_gallery/features/screens/gallery/model/gallery_model.dart';
import 'package:unsplash_gallery/features/screens/gallery/repository/gallery_repo_imp.dart';

@Injectable(as: GalleryRepositoryImp)
class GalleryRepository implements GalleryRepositoryImp {
  final ApiClient apiClient;

  GalleryRepository({
    required this.apiClient,
  });

  @override
  Future<Either<ApiFailure, List<GalleryModel>>> getGalleryData(
      Map<String, dynamic> params) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    List<GalleryModel> allPhotos = [];
    String fileName = "galleryData.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);

    try {
      if (connectivityResult == ConnectivityResult.none && file.existsSync()) {
        print("Loading from cache $file");
        var jsonData = file.readAsStringSync();
        final trimmedJsonString = jsonData.trim();

        log("cache data String -------------> $trimmedJsonString");

        List galleryData = json.decode(trimmedJsonString);
        log("cache data flutter -------------> $galleryData");

        galleryData.forEach((element) {
          allPhotos.add(GalleryModel.fromJson(element));
        });

        return Right(allPhotos);
      } else {
        file.delete();
        final response = await await apiClient.request(
            url: ApiUrls.photos, method: Method.get, params: params);

        List galleryData = response as List;

        galleryData.forEach((element) {
          allPhotos.add(GalleryModel.fromJson(element));
        });

        return Right(allPhotos);
      }
    } catch (error) {
      log(error.toString());

      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> downloadImage(Map<String, dynamic> params,
      {String? imageUrl, String? localPath}) async {
    try {
      final response = await await apiClient.request(
          url: imageUrl!, method: Method.get, params: params);

      final File imageFile = File(localPath!);
      await imageFile.writeAsBytes(response.bodyBytes);

      return Right(response);
    } catch (error) {
      log(error.toString());

      return Left(ApiException.handle(error).failure);
    }
  }
}
